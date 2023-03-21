using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class ChatUser
    {
        public string Chat_id { get; set; }
        public string Chat_user_id { get; set; }
        public string Chat_gmail { get; set; }
        public string Chat_name { get; set; }
        public string Chat_content { get; set; }
        public string Chat_phone { get; set; }
        public string Chat_create { get; set; }
        public string Chat_check { get; set; }  //Kiểm tra ai nhắn
            
    }
}