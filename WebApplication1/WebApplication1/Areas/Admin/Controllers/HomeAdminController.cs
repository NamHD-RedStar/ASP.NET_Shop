using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        private JP_ShopThoitrangEntities db = new JP_ShopThoitrangEntities();
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult View_Product()
        {
            var products = db.products.Include(p => p.catalog);
            ViewBag.catalog_id = new SelectList(db.catalogs, "catalog_id", "catalog_name");
            return View(products.OrderByDescending(s => s.created).ToList());
        }


        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create_Product(product product, HttpPostedFileBase img, string product_name, int? quantity, int? price, string content, string catalog_id)
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


        public ActionResult Edit_Product(string id)
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
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult EditPost_Product(string product_id, HttpPostedFileBase img, string product_name, int? quantity, int? price, string content, string catalog_id)
        {

            if (product_id != null)
            {
                product product = db.products.Where(s => s.product_id == product_id).FirstOrDefault();
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

        public ActionResult Delete_Product(string id)
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
        [HttpPost, ActionName("Delete_Product")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            product product = db.products.Find(id);
            // Delete old Image Upload
            if (product.image_main != null)
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

    }
}