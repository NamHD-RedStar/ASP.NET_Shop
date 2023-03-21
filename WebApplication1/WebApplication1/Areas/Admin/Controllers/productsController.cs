using System;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using PagedList;

namespace WebApplication1.Areas.Admin.Controllers

{
    public class productsController : Controller
    {
        private JP_ShopThoitrangEntities db = new JP_ShopThoitrangEntities();

        // GET: Admin/products
        public ActionResult Index(int? page)
        {
            string id_ = "";
           // var products = db.products.Include(p => p.catalog);
            ViewBag.catalog_id = new SelectList(db.catalogs, "catalog_id", "catalog_name");

            var prod = db.products.OrderByDescending(s => s.created).ToList();


            if (page == null) page = 1;
            //Số sp hiển thị trên 1 trang
            int pageSize = 8;
            // Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);
            // Trả về các sp được phân trang theo kích thước và số trang.
            return View(prod.ToPagedList(pageNumber, pageSize));


            //if (search_admin_txt ==null)
            //{
            //    return View(db.products.OrderByDescending(s=>s.created).ToList());
            //    //return View(db.products.OrderByDescending(s => s.created).ToList());
            //}
            //else
            //{
            //    return View(db.products.Where(s => s.product_name.Contains(search_admin_txt.ToString())).ToList());
            //    //return View(db.products.OrderByDescending(s => s.created).ToList());
            //}

        }

        // GET: Admin/products/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/products/Create
        public ActionResult Create()
        {
            ViewBag.catalog_id = new SelectList(db.catalogs, "catalog_id", "catalog_name");
            return View();
        }

        // POST: Admin/products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(product product, HttpPostedFileBase img, string product_name, int? quantity, int? price, string content, string catalog_id)
        {
            //product product = new product();
            string _path = Server.MapPath("~/Uploads/Products/");
            if (!Directory.Exists(_path))
            {
                Directory.CreateDirectory(_path);
            }
            //[Bind(Include = "id,product_id,catalog_id,product_name,image_main,image_sub,price,content,discount,quantity,quantity_sold,status,created")
            if (img != null)
            {
                string newFileName = DateTime.Now.Millisecond.ToString() + DateTime.Now.ToString("yyyyMMddHHmmss") + "Products" + ".jpg";
                string path0 = Path.Combine(_path + newFileName);
                // resize
                //WebImage new_img = new WebImage(img.InputStream);
                //if (new_img.Width > 500 || new_img.Height > 280)
                //{
                //    new_img.Resize(500, 280);
                //}
                // new_img.Save(path0);
                img.SaveAs(path0);
                product.image_main = newFileName;
            }
            else
            {
                product.image_main = "null.jpg";
            }
            string product_id = DateTime.Now.ToString("yyyyMMddHHmmss") + "products";
            product.product_name = product_name;
            product.product_id = product_id; 
            product.catalog_id = catalog_id;
            product.quantity = quantity;
            product.price = price;
            product.content = content;
            product.status = 1;
            product.discount = 0;
            product.quantity_sold = 0;
            product.created = DateTime.Now;
            if (ModelState.IsValid)
            {
                db.products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.catalog_id = new SelectList(db.catalogs, "catalog_id", "catalog_name", product.catalog_id);
            return View(product);
        }
        [ValidateInput(false)]
        // GET: Admin/products/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.catalog_id = new SelectList(db.catalogs, "catalog_id", "catalog_name", product.catalog_id);
            return View(product);
        }

        // POST: Admin/products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult EditPost(string product_id,  HttpPostedFileBase img, string product_name, int? quantity, int? price, string content, string catalog_id)
        {
          
            if(product_id != null)
            {
                product product = db.products.Where(s=>s.product_id == product_id).FirstOrDefault();
                string _path = Server.MapPath("~/Uploads/Products/");
                if (img != null)
                {
                    string newFileName = DateTime.Now.Millisecond.ToString() + DateTime.Now.ToString("yyyyMMddHHmmss") + "Products" + ".jpg";
                    string path0 = Path.Combine(_path + newFileName);
                    // resize
                    //WebImage new_img = new WebImage(img.InputStream);
                    //if (new_img.Width > 500 || new_img.Height > 280)
                    //{
                    //    new_img.Resize(500, 280);
                    //}
                    //new_img.Save(path0);
                    img.SaveAs(path0);
                    // Delete old Image Upload
                    if (product.image_main != null)
                    {
                        string physicalPath = Path.Combine(Server.MapPath("~/Uploads/Products/"), product.image_main);
                        if (System.IO.File.Exists(physicalPath))
                        {
                            System.IO.File.Delete(physicalPath);
                        }
                    }
                  

                    product.image_main = newFileName;
                }
             
                product.product_name = product_name;
                product.product_id = product_id;
                product.catalog_id = catalog_id;
                product.quantity = quantity;
                product.price = price;
                product.content = content;
                product.status = 1;
                product.created = DateTime.Now;

                if (ModelState.IsValid)
                {
                    db.Entry(product).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                ViewBag.catalog_id = new SelectList(db.catalogs, "catalog_id", "catalog_name", product.catalog_id);
                return RedirectToAction("Index");
            }
            else
            {
                return View("loi");
            }
            
        }
        public ActionResult loi()
        {
            return View();
        }

        // GET: Admin/products/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            product product = db.products.Find(id);
            // Delete old Image Upload
            if(product.image_main != null)
            {
                string physicalPath = Path.Combine(Server.MapPath("~/Uploads/Products/"), product.image_main);
                if (System.IO.File.Exists(physicalPath))
                {
                    System.IO.File.Delete(physicalPath);
                }
            }
           
            db.products.Remove(product);
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
