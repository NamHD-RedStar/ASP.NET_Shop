using FireSharp.Config;
using FireSharp.Interfaces;
using FireSharp.Response;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;


namespace WebApplication1.Controllers
{
    public class ChatUserController : Controller
    {
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "5olMpYf4mWwFN5yAjdt7G6FDv3UAJptjOYwc8Lq1",
            BasePath = "https://jpshopcharuser-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;
        // GET: ChatUser
        public ActionResult Index()
        {
            ChatUser chatUser = new ChatUser()
            {
                //Chat_id = DateTime.Now.ToString("yyyyMMddHHmmss") + "chatuser",
                Chat_user_id = "nguyenvannamiduser",
                Chat_name = "Nguyen Van nam",
                Chat_content = "Xin chao toi la nguyen van nam",
                Chat_create = DateTime.Now.ToString()

            };
            //UpData(chatUser);
            return View();
           
        }


        public bool UpData(ChatUser chatUser)
        {
            bool ret = false;
            try
            {
                client = new FireSharp.FirebaseClient(config);
                var data = chatUser;
                PushResponse response = client.Push("User/", data);
                chatUser.Chat_id = response.Result.name;
                SetResponse setResponse = client.Set("User/" + data.Chat_id, data);

                if (setResponse.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    ret = true;
                }
                else
                {
                    ret = false;
                }
            }
            catch (Exception)
            {
                ret = false;
            }

            return ret;
        }


        public JsonResult DownData(string id)
        {
            if (id != null)
            {
                client = new FireSharp.FirebaseClient(config);
                FirebaseResponse response = client.Get("User/");
                dynamic data = JsonConvert.DeserializeObject<dynamic>(response.Body);
                var list = new List<ChatUser>();
                if (data != null)
                {
                    foreach (var item in data)
                    {
                        list.Add(JsonConvert.DeserializeObject<ChatUser>(((JProperty)item).Value.ToString()));
                    }
                }
                return Json(new { code = 200, msg = "Lay dl thanh cong", _dulieu = list, _response = response }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { code = 500, msg = "Lay dl k thanh cong" }, JsonRequestBehavior.AllowGet);
            }
        }




        public JsonResult Detail(string id)
        {
            if (id != null)
            {
                client = new FireSharp.FirebaseClient(config);
                FirebaseResponse _response = client.Get("Chat/");

                List<ChatUser> chatUsers = new List<ChatUser>();

                ChatUser data = JsonConvert.DeserializeObject<ChatUser>(_response.Body);
                //return View(data);


                //var data = JsonConvert.DeserializeObject<dynamic>(_response);
                //FirebaseResponse response_ =  client.GetAsync("Chat/User1");
                //System.Diagnostics.Debug.Write("Sản phẩm: "  +data);

                return Json(new { code = 200, msg = "Lay dl thanh cong", dulieu = data, response = _response }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                return Json(new { code = 500, msg = "Lay dl k thanh cong"}, JsonRequestBehavior.AllowGet);

            }

        }




        private void AddStudentToFirebase(string student)
        {
            client = new FireSharp.FirebaseClient(config);
            var data = student;
            PushResponse response = client.Push("Students/", data);
            data = response.Result.name;
            SetResponse setResponse = client.Set("Students/" + data, data);

            System.Diagnostics.Debug.WriteLine("Sản phẩm: " + setResponse + "-");
        }
        public ActionResult Edit(string id)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Get("Students/" + id);
        
            return View();
        }
        public ActionResult Edit()
        {
            client = new FireSharp.FirebaseClient(config);
            SetResponse response = client.Set("Students/" + "","" );
            return RedirectToAction("Index");
        }

        public ActionResult Delete(string id)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Delete("Students/" + id);
            return RedirectToAction("Index");
        }


        public  bool ChatReatime()
        {
            //string basePath = "https://jpshopcharuser-default-rtdb.firebaseio.com/";
            //string authSecret = "5olMpYf4mWwFN5yAjdt7G6FDv3UAJptjOYwc8Lq1";
            //IFirebaseClient client;
            //IFirebaseConfig config = new FirebaseConfig
            //{
            //    AuthSecret = authSecret,
            //    BasePath = basePath
            //};
            ChatUser chat = new ChatUser()
            {
                Chat_id = DateTime.Now.ToString("yyyyMMddHHmmss") + "chatuser",
                Chat_user_id = "nguyenvannamiduser",
                Chat_name = "Nguyen Van nam",
                Chat_content="Xin chao toi la nguyen van nam",
                Chat_create = DateTime.Now.ToString()

            };


            client = new FireSharp.FirebaseClient(config);
            if (client != null)
            {
                //SetResponse response = await client.SetAsync(txt_masv.Text.Trim(), duliau_anh);
                  client.SetAsync("Chat/User1",chat);
                //client.PushAsync("Chat",chat);

            }
            return true;
        }



    }
}