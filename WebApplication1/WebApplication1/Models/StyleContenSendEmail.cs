using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class StyleContenSendEmail
    {
        public string ContenSendEmail(string tenkhachhang,string gmail, string sdt, string diachi, List<Cart_Temp> cart_temp,int tongtien, int phivanvhuyen, DateTime thoigiannhanhang, string content)
        {
            SetDateVietNam setDateVietNam = new SetDateVietNam();
            string dukien1 = setDateVietNam.Thu_VN(thoigiannhanhang.AddDays(6).ToString("dddd")) + ", " + thoigiannhanhang.AddDays(6).ToString("dd/MM/yyyy");
            int toltal = tongtien+phivanvhuyen;
            // Hiển thị danh sách sản phẩm
            string list_product = "";
            foreach (var item in cart_temp)
            {
                list_product +=
                    "<tr>" +
                      "<td>" +item._product_name+"</td>" +
                      "<td>" +item._quantity+"</td>" +
                      "<td class='text-end'>" + item._sum.ToString("n0")+"đ</td>" +
                    "</tr>";
                //toltal += (int)item._sum;
            }

            string a = "" +
                "<!DOCTYPE html>" +
                "<html lang='en'>" +
                "<meta http-equiv='content-type' content='text/html;charset=UTF-8' />" +
                "<head>" +
                "<meta charset='utf-8'>" +
                "<meta http-equiv='X-UA-Compatible' content='IE=edge'>" +
                "<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>" +
                "<link rel='preconnect' href='https://fonts.gstatic.com/'>" +
                "<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css'>" +
                "<link href='https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&amp;display=swap' rel='stylesheet'>" +
                "</head>" +
                "<body data-theme='default' data-layout='fluid' data-sidebar-position='left' data-sidebar-layout='default'>" +
                "<div class='wrapper'>" +
                "<div class='main'>" +
                "<main class='content'>" +
                "<div class='container-fluid p-0'>" +
                "<h1 class=''>Thông tin đặt hàng</h1>" +
                "<div class='row'>" +
                "<div class='col-12'>" +
                "<div class='card'>" +
                "<div class='card-body m-sm-3 m-md-5'>" +
                "<div class='mb-4'>" +
                "Xin chào <strong>"+tenkhachhang+"</strong>," +
                "<br />Đây là thông tin mua hàng của bạn:" +
                " </div>" +
                "<div class='row'>" +
                "<div class='col-md-6'>" +
                "<div class='text-muted'>Payment No: <strong>741037024</strong></div>" +
                "</div>" +
                "<div class='col-md-6 text-md-end'>" +
                "<div class='text-muted'>Thời gian nhận hàng(Dự tính):<strong>" + dukien1 + "</strong></div>" +
                "</div>" +
                "</div>" +
                "<hr class='my-4' />" +
                "<div class='row mb-4'>" +
                "<div class='col-md-6'>" +
                "<p>"+
                "Họ tên người nhận:" + "<strong>" + tenkhachhang + "</strong><br>" +
                "Gmail:" + "<a href='#'>" + gmail + "</a><br>" +
                "Địa chỉ:" + diachi + "<br>" +
                "Số điện thoại:" + sdt + "<br>"+
                "</p>" +
                "</div>" +
                "<div class='col-md-6 text-md-end'>" +
                "<div class='text-muted'></div>" +
                "</div></div>" +
                "<table class='table table-sm'style='text-align: left;width: 100%;'>" +
                "<thead>" +
                "<tr>" +
                "<th>Tên sản phẩm</th><th>Số lượng</th><th class='text-end'>Đơn giá</th>" +
                "</tr>" +
                "</thead>" +
                " <tbody>" +

                list_product+

                "<tr>" +
                "<th>&nbsp;</th>" +
                " <th>Tạm tính </th>" +
                " <th class='text-end'>"+tongtien.ToString("n0")+"đ</th>" +
                "</tr><tr>" +
                "<th>&nbsp;</th>" +
                "<th>Phí vận chuyển </th>" +
                "<th class='text-end'>"+phivanvhuyen.ToString("n0")+"đ</th>" +
                "</tr><tr>" +
                " <th>&nbsp;</th>" +
                "<th>Giảm giá </th>" +
                " <th class='text-end'>"+0+"</th>" +
                " </tr><tr>" +
                " <th>&nbsp;</th>" +
                "<th>Tổng tiền: </th>" +
                "<th class='text-end'> <p style='font-size: 17px;color: red;'>" + toltal.ToString("n0")+"đ</p></th>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "<div class='text-center'>" +
                " <p class='text-sm'>" +
                " <strong>Ghi chú:</strong>" +
                content +
                "</p>" +
                "<a href='#' class='btn btn-primary'>" +
                "Xem Shop" +
                "</a>" +
                "</div>" +
                "</div></div></div></div></div>" +
                "</main></div></div>" +
                "<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js'></script>" +
                "</body>" +
                "</html>" +
                "";
            return a;

        }
    }
}