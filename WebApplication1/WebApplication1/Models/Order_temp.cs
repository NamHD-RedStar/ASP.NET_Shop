using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Order_temp
    {
        public string _transactions_id { get; set; }
        public string _product_id { get; set; }
        public int _quantity { get; set; }
        public int _total_price { get; set; }
        public string _data { get; set; }
        public int _status { get; set; }
    }
}