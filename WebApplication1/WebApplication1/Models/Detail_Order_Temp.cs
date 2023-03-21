using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Detail_Order_Temp
    {
        public string _transactions_id { get; set; }
        public string _product_id { get; set; }
        public string _product_name { get; set; }
        public string _product_image { get; set; }
        public int _product_price { get; set; }
        public int _quantity { get; set; }
        public int _sum
        {
            get
            {
                return _product_price * _quantity;
            }
        }
        public int _check { get; set; }
    }
}