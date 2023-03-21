using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using FireSharp.Config;
using FireSharp.Interfaces;
using FireSharp.Response;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PagedList;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        private JP_ShopThoitrangEntities db = new JP_ShopThoitrangEntities();
        public ActionResult Index()
        {
         
            ViewBag.sanphambanchay = db.products.OrderByDescending(s=>s.quantity_sold).Take(12).ToList();
            ViewBag.sanphammoinhat = db.products.OrderByDescending(s=>s.created).Take(12).ToList();
            ViewBag.giamgiathapnhat = db.products.OrderByDescending(s=>s.discount).Take(3).ToList();
            return View(db.products.ToList().Take(12));
        }

        public ActionResult Product_Details(string id)
        {
            if(id == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                var item = db.products.Find(id);
                //Sẩn phẩm cùng loại
                ViewBag.sanphamtuongtu = db.products.Where(s=>s.catalog_id ==item.catalog_id).ToList().Take(6);
                ViewBag.sanphamkhacloai = db.products.Where(s => s.catalog_id != item.catalog_id).ToList().Take(6);

                return View(item);
            }
           
        }
        public ActionResult Login()
        {
            return View();
        }
        //Login
        [HttpPost]
        public JsonResult XLLogin(string gmail, string password)
        {
            if (gmail != "" || password != "")
            {
                var user_t = db.users.Where(s => s.gmail == gmail&& s.password ==password).FirstOrDefault();
                if(user_t != null)
                {
                    Session["user"] = u_temp("null.jpg", user_t.username, gmail, user_t.address, user_t.phone, "1");
                    return Json(new { code = 200, url = Url.Action("Index", "Home"), msg = "Thanh công",_user = user_t }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { code = 500, msg = "Tài khoản hoặc mật khẩu của bạn sai" }, JsonRequestBehavior.AllowGet);
                }
               


            }
            else
            {
                return Json(new { code = 500, msg = "Tài khoản hoặc mật khẩu của bạn bị thiếu" }, JsonRequestBehavior.AllowGet);
            }


        }
        public ActionResult Logout()
        {
            Session.Remove("user");
            return RedirectToAction("Index");
        }
        public user_temp u_temp(string _avatar, string _username, string _gmail, string _address, string _phone, string _checked)
        {

            user_temp tempp = new user_temp();
            tempp._avatar = _avatar;
            tempp._username = _username;
            tempp._gmail = _gmail;
            tempp._address = _address;
            tempp._phone = _phone;
            tempp._checked = _checked;

            return tempp;
        }
        //Sản phẩm cùng loại
        public ActionResult Product_View_Transaction(int? page,string id, string check, int? check_seach)
        {
            if (page == null) page = 1;
            int pageSize = 18;
            int pageNumber = (page ?? 1);
           
            Session["id_search"] = id;
            Session["check"] = check;
            int price_search_min = 0;
            int price_search_max = 2000000;
            if(check_seach!= null)
            {
                if(check_seach == 1)
                {
                    price_search_min = 0;
                    price_search_max = 50000;
                }else if(check_seach == 2)
                {
                    price_search_min = 50000;
                    price_search_max = 200000;
                }
                else if (check_seach == 3)
                {
                    price_search_min = 200000;
                }
            }

          
            var id_search = Session["id_search"];
            var id_check = Session["check"];

            System.Diagnostics.Debug.WriteLine("id tìm kiếm: " + id_search + "- Check: " + id_check + "- check_seach:" + check_seach);
            if (Session["check"] == null)
            {
                if (id_search == null)
                {
                    var pro = db.products.ToList();
                    // Xem toàm bộ sản phẩm
                    return View(pro.ToPagedList(pageNumber, pageSize));
                }
                else if(check == null && check_seach == null)
                {
                    var pro = db.products.Where(s => s.catalog_id == id_search.ToString()).ToList();
                    return View(pro.ToPagedList(pageNumber,pageSize));
                }
                else
                {
                    var pro = db.products.Where(s => s.catalog_id == id_search.ToString() && s.price > price_search_min && s.price <= price_search_max).ToList();
                    // Xem sản phẩm cùng loại
                    return View(pro.ToPagedList(pageNumber, pageSize));

                }
            }
            else
            {
                Session["check"] = check;
                var pro = db.products.Where(s => s.product_name.Contains(id_search.ToString())).ToList();
                return View(pro.ToPagedList(pageNumber, pageSize)); ;
            }
        }

        // Mua sản phẩm trong details
        [HttpPost]
        public JsonResult Buy_Product_Details(string id, string soluong)
        {
            try
            {
                if (Session["cart"] == null) // Nếu giỏ hàng chưa được khởi tạo
                {
                    Session["cart"] = new List<Carts>();  // Khởi tạo Session["giohang"] là 1 List<Giohang>
                }
                if (id!= null || soluong!= null)
                {
                    var product_item = db.products.Find(id);
                    if (product_item != null)
                    {
                        List<Carts> cart = Session["cart"] as List<Carts>;
                        if (cart.Where(s => s._product_id == id).FirstOrDefault() == null) // ko co sp nay trong gio hang
                        {
                            product sanpham = db.products.Find(id);  // tim sp theo sanPhamID

                            Carts newItem = new Carts()
                            {
                                _product_id = id.ToString(),
                                _product_name = sanpham.product_name,

                                _quantity_max = (int)sanpham.quantity,
                                _image_main = sanpham.image_main,
                                _price = (int)sanpham.price,
                                _quantity = int.Parse(soluong)

                            };  // Tạo ra 1 CartItem mới

                            cart.Add(newItem);  // Thêm CartItem vào giỏ 
                        }
                        else
                        {
                            // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                            Carts cardItem = cart.FirstOrDefault(m => m._product_id == id);
                            cardItem._quantity+= int.Parse(soluong);
                        }
                    }
                    return Json(new { code = 200, url = Url.Action("ViewCartShopping", "Home"), msg = "Mua thành công" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { code = 500, msg = "Không thành công" }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Mua lỗi" + ex }, JsonRequestBehavior.AllowGet);
            }
        }

        // Add cart
        public ActionResult ViewCartShopping()//Hiển trị giỏ hàng
        {
            // Xóa Session["cart_temp"]
            Session["cart_temp"] = null;
            List<Carts> Cart = Session["cart"] as List<Carts>;
            ViewBag.Cart = Cart;
            return View();
        }
        public ActionResult AddCartItem(string id)//Thêm sản phẩm vào giỏ hàng
        {
            if (Session["cart"] == null) // Nếu giỏ hàng chưa được khởi tạo
            {
                Session["cart"] = new List<Carts>();  // Khởi tạo Session["giohang"] là 1 List<Giohang>
            }
          
          if(id == null)
            {
                return View("error");
            }
            else
            {
                List<Carts> cart = Session["cart"] as List<Carts>;
                if (cart.Where(s=>s._product_id == id).FirstOrDefault()==null) // ko co sp nay trong gio hang
                {
                    product sanpham = db.products.Find(id);  // tim sp theo sanPhamID

                    Carts newItem = new Carts()
                    {
                        _product_id = id.ToString(),
                        _product_name = sanpham.product_name,

                        _quantity_max = (int)sanpham.quantity,
                        _image_main = sanpham.image_main,
                        _price = (int)sanpham.price,
                        _quantity = 1
                      
                    };  // Tạo ra 1 CartItem mới

                    cart.Add(newItem);  // Thêm CartItem vào giỏ 
                }
                else
                {
                    // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                    Carts cardItem = cart.FirstOrDefault(m => m._product_id == id);
                    cardItem._quantity++;
                }
            
                return RedirectToAction("Index");
            }
        } 
        public ActionResult UpdateCartItem(string id, int? quantity)
        {

            List<Carts> cart = Session["cart"] as List<Carts>;
            Carts cardItem = cart.Where(m => m._product_id == id).FirstOrDefault();
            if(cardItem == null)
            {
                return View("error");
            }
            else
            {
                cardItem._quantity =(int) quantity;
            }
            
            return RedirectToAction("ViewCartShopping");
        }
        public ActionResult DeleteCartItem(string id)
        {
            List<Carts> cart = Session["cart"] as List<Carts>;

            Carts cartItem = cart.FirstOrDefault(s => s._product_id == id);
            if (cartItem != null)
            {
                cart.Remove(cartItem);
            }
            return RedirectToAction("ViewCartShopping");
        }

        // Gửi tin nhắn về gmail
        public JsonResult SendGmailtoUser(string gmail_user, string tieude, string content)
        {
            //bool result = SendEmail("nguyenvannam.nvn842000@gmail.com", "Test guibgmail", "Xin chao toi la nguyn van nam");
            bool result = SendEmail(gmail_user, tieude, content);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public bool SendEmail(string toEmail, string Subject, string EmailBody)
        {
            try
            {
                string senderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString(); //"webnamjp.nvn@gmail.com";
                string senderPassword = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString(); //"idkzhfvlwvfwtbbo";


                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(senderEmail, senderPassword);

                MailMessage mailMessage = new MailMessage(senderEmail, toEmail, Subject, EmailBody);

                mailMessage.IsBodyHtml = true;
                mailMessage.BodyEncoding = System.Text.Encoding.UTF8;
                client.Send(mailMessage);
                return true;

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Sản phẩm: " + ex + "-");
                return false;
            }
        }



        // Sử lý mua hàng
        public ActionResult testView()
        {
            ChatReatime();
            return View(db.products.ToList());
        }
        [HttpPost]
        public JsonResult Buyproduct(string[] id, string username, string gmail, string address, string phone, string check)
        {
            string msg = "";
            try
            {
                if (Session["cart_temp"] == null) // Nếu giỏ hàng chưa được khởi tạo
                {
                    Session["cart_temp"] = new List<Cart_Temp>();  // Khởi tạo Session["giohang"] là 1 List<Giohang>
                }
                // Add Product => Cart_Temp
               

                if(id != null)
                {
                    foreach (var item in id)
                    {
                        System.Diagnostics.Debug.WriteLine("Sản phẩm: " + item + "-");
                        // Kiểm tra sản phảm đã đc chọn mua
                        List<Cart_Temp> cart_temp = Session["cart_temp"] as List<Cart_Temp>;


                        var prod_item = cart_temp.Where(s => s._product_id == item).FirstOrDefault();


                        if (prod_item == null) // nếu chưa đc chọn
                        {
                            List<Carts> cart = Session["cart"] as List<Carts>;
                            var cart_item = cart.Where(s => s._product_id == item).FirstOrDefault();
                            Cart_Temp cart_temp_item = new Cart_Temp()
                            {
                                _product_id = cart_item._product_id,
                                _image_main = cart_item._image_main,
                                _product_name = cart_item._product_name,
                                _price = (int)cart_item._price,
                                _quantity = (int)cart_item._quantity
                            };
                            cart_temp.Add(cart_temp_item);
                        }
                        else
                        {
                            msg = "Bạn đã chọn mua sản phẩm này rồi.";
                        }
                    }
                }
                else
                {
                }

                // Create accout
                if (check == "yes") // Tạo tài khoản
                {
                    // Kiểm tra tài khoản đã tồn tại chưa
                    var check_user = db.users.Where(s => s.gmail == gmail).FirstOrDefault();

                    if(check_user == null)
                    {
                        RandomPassword randomPassword = new RandomPassword();

                        string _password = randomPassword.RD_Password(6);
                        var new_user = new user();
                        new_user.gmail = gmail;
                        new_user.username = username;
                        new_user.address = address;
                        new_user.phone = phone;
                        new_user.password = _password;
                        new_user.created = DateTime.Now;

                        if (ModelState.IsValid)
                        {
                            db.users.Add(new_user);
                            db.SaveChanges();
                        }
                        // Gửi password cho người dùng
                        string content = "Mật khẩu của bạn là:" + _password;
                        SendEmail(gmail, "Bạn đã đăng ký tài khoản ShopJP:" + DateTime.Now.ToString("ss:mm:hh,MM/dd/yyyy") + "", content);
                        Session["user"] = u_temp("null.jpg", username, gmail, address, phone, "1");
                    }
                    else
                    {
                        Session["user"] = u_temp("null.jpg", check_user.username, check_user.gmail, check_user.address, check_user.phone, "1");
                    }
                  

                }
                else
                {
                    Session["user"] = u_temp("null.jpg", username, gmail, address, phone, "0");
                }
              



                return Json(new { code = 200, url = Url.Action("Transaction", "Home"), msg = "Chon mua thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Chon mua That bai" + ex }, JsonRequestBehavior.AllowGet);
            }
        }
     
      



        public ActionResult Transaction() // Giao dịch
        {
            return View(db.products.ToList());
        }
        // Xử lý giao dịch
        public JsonResult Xuly_Transaction(string checkgiaohang, string note, string hinhthucgiaohang)
        {
            try
            {
                int _code = 1;
                string _url = Url.Action("Order", "Home");
                string _msg = "";
                int shipping = 0;
                int price_shipping = 22000;
             
                List<Cart_Temp> cart_temp = Session["cart_temp"] as List<Cart_Temp>;
                int total_price = cart_temp.Select(s => s._sum).Sum();
                user_temp user = Session["user"] as user_temp;
                order db_order = new order();
                if (checkgiaohang == "giaohangthuong")
                {
                    total_price += 22000;
                   
                }
                else
                {
                    total_price += 50000;
                    price_shipping = 50000;
                    shipping = 1; // Nếu chọn giao hàng nhanh
                }

                string transactions_id = DateTime.Now.Millisecond.ToString() + DateTime.Now.ToString("yyyyMMddHHmmss") + "transactions";
                string username = user._username;
                string phonenumber = user._phone;
                string gmail = user._gmail;
                string address = user._address;

               

              

                // Thêm Giao dịch
                List<transaction_temp> lis_transactions = new List<transaction_temp>();
                transaction_temp transaction_item = new transaction_temp()
                {
                    _transactions_id = transactions_id,
                    _username = username,
                    _address = address,
                    _phonenumber = phonenumber,
                    _gmail = gmail,
                    _total_price = total_price,
                    _message = note,
                    _payment = hinhthucgiaohang,
                    _payment_info = "Thanh toán bằng cổng "+ hinhthucgiaohang,
                    _security = "080156",
                    _status = 0,
                    _shipping = shipping
                    
                };
                lis_transactions.Add(transaction_item);
                Session["lis_transactions"] = lis_transactions;

                transaction db_transaction = new transaction();
                db_transaction.transactions_id = transactions_id;
                db_transaction.username = username;
                db_transaction.address = address;
                db_transaction.phonenumber = phonenumber;
                db_transaction.gmail = gmail;
                db_transaction.total_price = total_price;
                db_transaction.message = note;
                db_transaction.status = 0;
                db_transaction.payment = hinhthucgiaohang;
                db_transaction.payment_info = "Thanh toan bang: "+hinhthucgiaohang;
                db_transaction.security = "080156";
                db_transaction.created = DateTime.Now;
                db_transaction.shipping = shipping;
                if (ModelState.IsValid)
                {
                    db.transactions.Add(db_transaction);
                    db.SaveChanges();
                }





                //Add Đơn hàng =>Csdl ( 1 giao dịch chứa nhiều đơn hàng)
                var sp = new product();
                List<Carts> cart_remor = Session["cart"] as List<Carts>;
                List<Order_temp> order_Temps = new List<Order_temp>();
                foreach (var item in cart_temp)
                {
                    var order_item = new Order_temp()
                    {
                        _transactions_id = transactions_id,
                        _product_id = item._product_id,
                        _total_price = item._price,
                        _quantity = item._quantity,
                        _data = "data_order",
                        _status = 0
                    };
                    order_Temps.Add(order_item);
                    db_order.transactions_id = transactions_id;
                    db_order.product_id = item._product_id;
                    db_order.total_price = item._price;
                    db_order.quantity = item._quantity;



                     // Giam quantity product
                     sp = db.products.Where(s=>s.product_id == item._product_id).FirstOrDefault();
                        sp.quantity -= item._quantity;
                        if(sp.quantity_sold == null)
                        {
                            sp.quantity_sold = item._quantity;
                        }
                        else
                        {
                            sp.quantity_sold += item._quantity;
                        }

                    // Xoa product in cart
                    Carts car = cart_remor.Where(s => s._product_id == item._product_id).FirstOrDefault();
                    if (ModelState.IsValid)
                    {
                        db.orders.Add(db_order);
                        cart_remor.Remove(car);
                        db.SaveChanges();
                    }
                }
                Session["Order"] = order_Temps;

                StyleContenSendEmail styleContenSendEmail = new StyleContenSendEmail();

                // Gửi thông tin gmail cho người dùng
                //string content = contenSengmail(username, phonenumber, address, "", total_price.ToString("n0"), DateTime.Now.ToString(), DateTime.Now.AddDays(10).ToString(), note);
                string content = styleContenSendEmail.ContenSendEmail(username, gmail, phonenumber, address, cart_temp, total_price, price_shipping, DateTime.Now,note);
                //SenamailToUser(gmail, "Thông tin thanh toán", content);
                bool a = SendEmail(gmail, "Thông tin đặt hàng ngày:"+DateTime.Now.ToString("ss:mm:HH,MM/dd/yyyy") +"", content);
                Session["Thongbao"] = "";
                if (a == true)
                {
                    Session["Thongbao"] = " Đặt hàng thành công, gmail ok";
                    _code = 200;
                    _msg = "Đặt hàng thành công, gmail ok";
                }
                else
                {
                    Session["Thongbao"] = "Đặt hàng thất bại, kiểm tra gmail của bạn!";
                    _code = 500;
                    _msg = "Đặt hàng thất bại, kiểm tra gmail của bạn!";
                }
                return Json(new { code = _code, url = _url, msg = _msg, _lis_transactions = lis_transactions,_list_order = order_Temps }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Mua lỗi" + ex }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult Xuly_BuyProduct(string checkgiaohang, string note)
        {
            try
            {
                return Json(new { code = 200, url = Url.Action("Order", "Home"), msg = "Thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Mua lỗi" + ex }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Order()
        {
            user_temp user = Session["user"] as user_temp;
            if(Session["user"] != null){
                // tim tong tin nguoi dung
                var id_user = db.users.Where(s => s.gmail == user._gmail).FirstOrDefault();
                // hien thi don hang cua nguoi dung
                ViewBag.transactions = db.transactions.Where(s => s.gmail == user._gmail).OrderByDescending(s => s.created).ToList();
                ViewBag.orders = db.orders.ToList();
                ViewBag.products = db.products.ToList();
                return View();
            }
            else
            {
                return RedirectToAction("Index");
            }


            //// Hiển thị đơn hàng của người dùng
            //var donhang = db.transactions.ToList();
            //var _orders = db.orders.ToList();
            //var new_order = new List<order>();
            //if (donhang != null)
            //{
            //    System.Diagnostics.Debug.WriteLine("Sản phẩm: " );
            //}

        }

        // Đã nhận hàng
        public ActionResult CheckNhanHang(string id, string check)
        {
            if(id ==null||check ==null||id == "" || check == "")
            {
                return View("error");
            }
            else
            {
                var tr = db.transactions.Where(s => s.transactions_id == id).FirstOrDefault();
                if (tr != null && check == "200")
                {
                    tr.status = 1; // Xác nhận đơn hàng
                }
                else if (tr != null && check == "300")
                {
                    tr.status = -1; //Hủy
                }
                else if (tr != null && check == "400")
                {
                    tr.status = 2; // Giao hàng Thành công
                }
                else if (tr != null && check == "500")
                {
                    tr.status = -2; // Giao Thất Bại
                }
                else if (tr != null && check == "000")
                {
                    tr.status = 0; //Mua lại
                }
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
                return RedirectToAction("Order");
               
            }
            
        }




        public ActionResult Detail_Order(string id)
        {
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
            _transaction_temp._transactions_id = id.Remove(10);
            _transaction_temp._username = _transaction.username;
            _transaction_temp._address = _transaction.address;
            _transaction_temp._phonenumber = _transaction.phonenumber;
            _transaction_temp._total_price = (int)_transaction.total_price;
            _transaction_temp._payment = _transaction.payment;
            _transaction_temp._create = (DateTime)_transaction.created;
            _transaction_temp._status = (int)_transaction.status;
            _transaction_temp._shipping = (int)_transaction.shipping;

            ViewBag.transaction_temps = _transaction_temp;
            return View(_Order);
        }


        // Char reatime // https://jpshopcharuser-default-rtdb.firebaseio.com/
        // pass: 5olMpYf4mWwFN5yAjdt7G6FDv3UAJptjOYwc8Lq1

        public bool ChatReatime()
        {
            string basePath = "https://jpshopcharuser-default-rtdb.firebaseio.com/";
            string authSecret  = "5olMpYf4mWwFN5yAjdt7G6FDv3UAJptjOYwc8Lq1";
            IFirebaseClient client;
            IFirebaseConfig config = new FirebaseConfig
            {
                AuthSecret = authSecret,
                BasePath = basePath
            };

            client = new FireSharp.FirebaseClient(config);
            if (client != null && !string.IsNullOrEmpty(basePath) &&!string.IsNullOrEmpty(authSecret)) {

                var data = new
                {   
                    Id_user="111111",
                    Name = "Test",
                    Msg = "Hello World",
                    Create = DateTime.Now
                };
                client.Push("Chat/Idnguoidung", data);
            
            }
            return true;
        }

        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "5olMpYf4mWwFN5yAjdt7G6FDv3UAJptjOYwc8Lq1",
            BasePath = "https://jpshopcharuser-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;
        [HttpPost]
        public JsonResult UpData(string gmail, string chatcontent)
        {
            int _code = 200;
            string msg = "";
            try
            {
                if (Session["user"]!=null)
                {
                    user_temp user = Session["user"] as user_temp;
                    ChatUser chatUser = new ChatUser()
                    {
                        //Chat_id = DateTime.Now.ToString("yyyyMMddHHmmss") + "chatuser",
                        Chat_user_id = user._gmail,
                        Chat_name = user._username,
                        Chat_content = chatcontent,
                        Chat_create = DateTime.Now.ToString(),
                        Chat_gmail = gmail,
                        Chat_check = "0",
                        Chat_phone = user._phone
                    };
                    client = new FireSharp.FirebaseClient(config);
                    PushResponse response = client.Push("User/"+user._phone, chatUser);
                    chatUser.Chat_id = response.Result.name;
                    SetResponse setResponse = client.Set("User/" + user._phone + "/" + chatUser.Chat_id, chatUser);

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
            if (Session["user"] != null)
            {
                user_temp user = Session["user"] as user_temp;


                client = new FireSharp.FirebaseClient(config);
                FirebaseResponse response = client.Get("User/"+user._phone);
                dynamic data = JsonConvert.DeserializeObject<dynamic>(response.Body);
              
                if (data != null)
                {
                    foreach (var item in data)
                    {
                        list.Add(JsonConvert.DeserializeObject<ChatUser>(((JProperty)item).Value.ToString()));
                    }
                }
            }
            return Json(new { code = 200, msg = "Load tin nhắn thành công", _dulieu = list}, JsonRequestBehavior.AllowGet);
        }




        public ActionResult ThongtinUser()
        {
            return View();
        }
        public ActionResult ChangePassword(string id, string currentPassword, string newPassword, string confirmPassword)
        {
            Session["thongbao_password"] = "";
            string thongbao = "";
            if(currentPassword == null || newPassword == null)
            {
                thongbao = "Bạn chưa nhập thông tin";
            }

            if(newPassword == confirmPassword)
            {
                var user = db.users.Where(s=>s.gmail == id&& s.password ==currentPassword).FirstOrDefault();
                if (user != null)
                {
                    user.password = newPassword;
                    if (ModelState.IsValid)
                    {
                        db.SaveChanges();
                        thongbao = "Đã thay đổi mật khẩu";
                    }
                }
                else
                {
                    thongbao = "Mật khẩu sai";
                }
              

            }
            else
            {
                thongbao = "Mật khẩu không giống nhau";
            }
            TempData["thongbao_password"] = thongbao;
            return RedirectToAction("ThongtinUser");
        }









        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }







        // Cart Ajax test
        //Start Test Cart
        public JsonResult DsSanpham()
        {
            try
            {
                var dssanpham = (from l in db.products.Where(x => x.id != 1)
                                 select new
                                 {
                                     Id = l.id,
                                     Name = l.product_name,
                                     gia = l.price
                                 }).ToList();

                return Json(new { code = 200, dssanpham = dssanpham, msg = "Thanh cong" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(new { code = 200, msg = "That bai" }, JsonRequestBehavior.AllowGet);

            }
        }
        public ActionResult viewCart()
        {

            return View();

        }
        // View cart
        public JsonResult loadCart()
        {
            try
            {
                List<Carts> giohang = Session["cart"] as List<Carts>;
                var dssanpham = (from l in giohang
                                 select new
                                 {
                                     Product_id = l._product_id,
                                     Product_name = l._product_name,
                                     Image = l._image_main,
                                     Price = l._price,
                                     Quantity = l._quantity,
                                     Quantity_max = l._quantity_max,
                                     Sum = l._sum,
                                     Check = l._check
                                 }).ToList();

                return Json(new { code = 200, dssanpham = dssanpham, msg = "Thanh cong" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(new { code = 200, msg = "That bai" }, JsonRequestBehavior.AllowGet);

            }
        }
        [HttpPost]
        public JsonResult deleteCartsItem(string id)
        {
            try
            {
                List<Carts> giohang = Session["cart"] as List<Carts>;

                Carts cartItem = giohang.FirstOrDefault(s => s._product_id == id);
                if (cartItem != null)
                {
                    giohang.Remove(cartItem);
                }


                return Json(new { code = 200, msg = "Delete Thanh cong" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(new { code = 500, msg = "Delete That bai" }, JsonRequestBehavior.AllowGet);

            }
        }
        [HttpPost]
        public JsonResult updateCartsItem(string id, int quantity)
        {
            try
            {
                List<Carts> giohang = Session["cart"] as List<Carts>;
                Carts cartItem = giohang.FirstOrDefault(s => s._product_id == id);
                if (cartItem != null)
                {
                    cartItem._quantity = quantity;
                }


                return Json(new { code = 200, msg = "Update thanh cong" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Update that bai" + ex }, JsonRequestBehavior.AllowGet);
            }

        }


        //End Test Cart
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}