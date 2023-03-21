using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Carts
    {
        public string _product_id { get; set; }
        public string _product_name { get; set; }
        public string _image_main { get; set; }
        public int _price { get; set; }
        public int _quantity { get; set; }
        public int _quantity_max { get; set; }
        public int _sum
        {
            get
            {
                return _price * _quantity;
            }
        }
        public bool _check { get; set; }
    }
}