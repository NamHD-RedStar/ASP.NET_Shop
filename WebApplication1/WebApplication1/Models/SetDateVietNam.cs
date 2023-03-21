using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class SetDateVietNam
    {
        public string Thu_VN(string thu_E)
        {
            string thu_V = "";
            if (thu_E.Equals("Monday"))
            {
                thu_V = "Thứ hai";
            }
            else if (thu_E.Equals("Tuesday"))
            {
                thu_V = "Thứ ba";
            }
            else if (thu_E.Equals("Wednesday"))
            {
                thu_V = "Thứ tư";
            }
            else if (thu_E.Equals("Thursday"))
            {
                thu_V = "Thứ năm";
            }
            else if (thu_E.Equals("Friday"))
            {
                thu_V = "Thứ sáu";
            }
            else if (thu_E.Equals("Saturday"))
            {
                thu_V = "Thứ bảy";
            }
            else if (thu_E.Equals("Sunday"))
            {
                thu_V = "Chủ nhật";
            }
            return thu_V;
        }
    }
}