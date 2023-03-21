using FireSharp.Config;
using FireSharp.Interfaces;
using FireSharp.Response;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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
    public class adminsController : Controller
    {
        private JP_ShopThoitrangEntities db = new JP_ShopThoitrangEntities();

        // GET: Admin/admins
        public ActionResult Index()
        {
            return View();
        }














        public ActionResult ChatUser()
        {
            return View();
        }




        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "5olMpYf4mWwFN5yAjdt7G6FDv3UAJptjOYwc8Lq1",
            BasePath = "https://jpshopcharuser-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;
        [HttpPost]
        public JsonResult UpData(string phone_user, string chatcontent)
        {
            int _code = 200;
            string msg = "";
            string gmail = "admin_shopnamjp@gmail.com";
            try
            {
              
                    user_temp user = Session["user"] as user_temp;
                    ChatUser chatUser = new ChatUser()
                    {
                        //Chat_id = DateTime.Now.ToString("yyyyMMddHHmmss") + "chatuser",
                        Chat_user_id = gmail,
                        Chat_name = "Admin",
                        Chat_content = chatcontent,
                        Chat_create = DateTime.Now.ToString(),
                        Chat_gmail = gmail,
                        Chat_check = "1",
                        Chat_phone = "0245687988"
                    };
                    client = new FireSharp.FirebaseClient(config);
                    PushResponse response = client.Push("User/" + phone_user, chatUser);
                    chatUser.Chat_id = response.Result.name;
                    SetResponse setResponse = client.Set("User/" + phone_user + "/" + chatUser.Chat_id, chatUser);

                    if (setResponse.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        _code = 200;
                        msg = "Chat Succes";
                    }
                    else
                    {
                        _code = 500;
                        msg = "Chat Error";
                    }
            }
            catch (Exception)
            {
                _code = 500;
                msg = "Not connect Chat";
            }

            return Json(new { code = 200, msg = msg }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DownData()
        {
            var list = new List<ChatUser>();
           
                user_temp user = Session["user"] as user_temp;


                client = new FireSharp.FirebaseClient(config);
                FirebaseResponse response = client.Get("User/1221212122/");
                dynamic data = JsonConvert.DeserializeObject<dynamic>(response.Body);

                if (data != null)
                {
                    foreach (var item in data)
                    {
                        list.Add(JsonConvert.DeserializeObject<ChatUser>(((JProperty)item).Value.ToString()));
                    }
                }
            
            return Json(new { code = 200, msg = "Load tin nhắn thành công", _dulieu = list }, JsonRequestBehavior.AllowGet);
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
