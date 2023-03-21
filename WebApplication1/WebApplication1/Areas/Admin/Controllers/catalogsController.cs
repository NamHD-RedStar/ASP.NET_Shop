using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class catalogsController : Controller
    {
        private JP_ShopThoitrangEntities db = new JP_ShopThoitrangEntities();

        // GET: Admin/catalogs
        public ActionResult Index(int? page)
        {
            System.IO.File.Copy(Server.MapPath("/Uploads/ImgNull/null.png"), Path.Combine(Server.MapPath("/Uploads/Catalogs/null.png")), true);
            System.IO.File.Copy(Server.MapPath("/Uploads/ImgNull/null.png"), Path.Combine(Server.MapPath("/Uploads/Products/null.png")), true);
            //if (search_admin_txt != null || search_admin_txt != "")
            //{
            //    return View(db.catalogs.Where(s => s.catalog_name.Contains(search_admin_txt.ToString())).ToList()); ;
            //}
            //else
            //{
            //    return View(db.catalogs.ToList());
            //}
            var catalog = db.catalogs.ToList();
            if (page == null) page = 1;
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(catalog.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/catalogs/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            catalog catalog = db.catalogs.Find(id);
            if (catalog == null)
            {
                return HttpNotFound();
            }
            return View(catalog);
        }

        // GET: Admin/catalogs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/catalogs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( catalog catalog,HttpPostedFileBase img,string catalog_name)
        {
            string _path = Server.MapPath("~/Uploads/Catalogs/");
            if (!Directory.Exists(_path))
            {
                Directory.CreateDirectory(_path);
            }
            if (img != null)
            {
                string newFileName = DateTime.Now.Millisecond.ToString() + DateTime.Now.ToString("yyyyMMddHHmmss") + "Danhmuc" + ".jpg";
                string path0 = Path.Combine(_path + newFileName);

                // resize
                //WebImage new_img = new WebImage(img.InputStream);
                //if (new_img.Width > 500 || new_img.Height >280)
                //{
                //    new_img.Resize(500, 280);
                //}

                img.SaveAs(path0);

                catalog.catalog_image = newFileName;
            }
            else
            {
                catalog.catalog_image = "null.jpg";
            }
            catalog.catalog_id = DateTime.Now.ToString("yyyyMMddHHmmss") + "catalog_id";
            catalog.catalog_name = catalog_name;
            if (ModelState.IsValid)
            {
                db.catalogs.Add(catalog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(catalog);
        }

        // GET: Admin/catalogs/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            catalog catalog = db.catalogs.Find(id);
            if (catalog == null)
            {
                return HttpNotFound();
            }
            return View(catalog);
        }

        // POST: Admin/catalogs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,catalog_id,catalog_name,catalog_image")] catalog catalog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(catalog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(catalog);
        }

        // GET: Admin/catalogs/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            catalog catalog = db.catalogs.Find(id);
            if (catalog == null)
            {
                return HttpNotFound();
            }
            return View(catalog);
        }

        // POST: Admin/catalogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            catalog catalog = db.catalogs.Find(id);
            string physicalPath = "";
            // Delete old Image Upload
           if (catalog.catalog_image ==null || catalog.catalog_image == "")
            {
                 physicalPath = Path.Combine(Server.MapPath("~/Uploads/Catalogs/null.png"));
            }
            else
            {
                 physicalPath = Path.Combine(Server.MapPath("~/Uploads/Catalogs/"), catalog.catalog_image);
            }
           

            if (System.IO.File.Exists(physicalPath))
            {
                System.IO.File.Delete(physicalPath);
            }
            db.catalogs.Remove(catalog);
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
