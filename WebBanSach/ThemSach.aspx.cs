using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            //Tạo sql để thêm nhân viên
            string sql = "insert into sach(tensach,macd,manxb,dongia,hinh,ngaycapnhat)" +
                " values(@tensach,@macd,@manxb,@dongia,@hinh,@ngaycapnhat)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //Truyền giá trị cho các tham số truyền vào
            cmd.Parameters.AddWithValue("@tensach", txtTenSach.Text);
            cmd.Parameters.AddWithValue("@dongia", txtDonGia.Text);
            if (FHinh.HasFile)
            {
                string duong_dan = Server.MapPath("~/Bia_sach/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@ngaycapnhat", txtNgayCapNhat.Text);
            cmd.Parameters.AddWithValue("@macd", ddlChuDe.SelectedValue);
            cmd.Parameters.AddWithValue("@manxb", ddlNXB.SelectedValue);
            //Thực hiện câu lệnh truy vấn sql
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("XemSach.aspx");
            else
                lblketqua.Text = "Thêm sách thất bại";
        }
    }
 }