using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class transactionsController : Controller
    {
        private JP_ShopThoitrangEntities db = new JP_ShopThoitrangEntities();

        // GET: Admin/transactions
        public ActionResult Index(string id)
        {
            if (id == null)
            {
                return View(db.transactions.ToList());
            }else if(id == "000")// Chưa xác nhận
            {
                return View(db.transactions.Where(s=>s.status == 0).ToList());
            }
            else if (id == "001")//Đã xác nhận- chờ vận chuyển
            {
                return View(db.transactions.Where(s => s.status == 1).ToList());
            }
            else if (id == "002")//Giao thành công
            {
                return View(db.transactions.Where(s => s.status == 2).ToList());
            }
            else if (id == "010")// Hủy
            {
                return View(db.transactions.Where(s => s.status == -1).ToList());
            }
            else if (id == "020")// Giao tất bại
            {
                return View(db.transactions.Where(s => s.status == -2).ToList());
            }
            else
            {
                return View(db.transactions.ToList());
            }


        }

        // GET: Admin/transactions/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }



            // get product in order
            var _products = db.orders.Where(s => s.transactions_id == id).ToList();
            var _Order = new List<Detail_Order_Temp>();
            var _transaction_temp = new transaction_temp();
            var _transaction = db.transactions.Where(s => s.transactions_id == id).FirstOrDefault();
            foreach (var item in _products)
            {

                var product = db.products.FirstOrDefault(s => s.product_id == item.product_id);
                Detail_Order_Temp detail_Order_Temp = new Detail_Order_Temp()
                {
                    _transactions_id = item.transactions_id,
                    _product_id = product.product_id,
                    _product_name = product.product_name,
                    _product_image = product.image_main,
                    _product_price = (int)product.price,
                    _quantity = (int)item.quantity,
                    _check = 1

                };
                _Order.Add(detail_Order_Temp);

            }
            _transaction_temp._transactions_id = id;
            _transaction_temp._username = _transaction.username;
            _transaction_temp._address = _transaction.address;
            _transaction_temp._phonenumber = _transaction.phonenumber;
            _transaction_temp._total_price = (int)_transaction.total_price;
            _transaction_temp._payment = _transaction.payment;
            _transaction_temp._create = (DateTime)_transaction.created;
            _transaction_temp._status = (int)_transaction.status;
            _transaction_temp._shipping = (int)_transaction.shipping;
            _transaction_temp._gmail = _transaction.gmail;

            ViewBag.transaction_temps = _transaction_temp;



            return View(_Order);
        }

        public ActionResult Order_confirmation(string id, string check)
        {
            if (id == null || check ==null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var tr = db.transactions.Where(s=>s.transactions_id ==id).FirstOrDefault();
            if(tr != null && check =="200")
            {
                tr.status = 1; // Xác nhận đơn hàng
            }else if(tr != null && check == "300")
            {
                tr.status = -1; //Hủy
            }
            else if (tr != null && check == "400")
            {
                tr.status = 1; // Giao hàng Thành công
            }
            else if (tr != null && check == "500")
            {
                tr.status = -2; // Giao Thất Bại
            }
            if (ModelState.IsValid)
            {
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }


        // GET: Admin/transactions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/transactions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,transactions_id,status,user_id,username,phonenumber,gmail,address,total_price,payment,payment_info,message,security,created,shipping")] transaction transaction)
        {
            if (ModelState.IsValid)
            {
                db.transactions.Add(transaction);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(transaction);
        }

        // GET: Admin/transactions/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            transaction transaction = db.transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            return View(transaction);
        }

        // POST: Admin/transactions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,transactions_id,status,user_id,username,phonenumber,gmail,address,total_price,payment,payment_info,message,security,created,shipping")] transaction transaction)
        {
            if (ModelState.IsValid)
            {
                db.Entry(transaction).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(transaction);
        }

        // GET: Admin/transactions/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            transaction transaction = db.transactions.Find(id);
            if (transaction == null)
            {
                return HttpNotFound();
            }
            return View(transaction);
        }

        // POST: Admin/transactions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            transaction transaction = db.transactions.Find(id);
            db.transactions.Remove(transaction);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
