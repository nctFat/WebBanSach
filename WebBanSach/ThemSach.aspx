<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="WebBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>TRANG THÊM SÁCH MỚI</h2>
    <hr />
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label style="display: block;">Tên sách</label>
                <asp:TextBox ID="txtTenSach" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqTenHoa" CssClass="text-danger" runat="server" ControlToValidate="txtTenSach" ErrorMessage="Tên sách không được bỏ trống"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label style="display: block;">Đơn giá</label>
            <asp:TextBox ID="txtDonGia" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqGia" CssClass="text-danger" runat="server" ControlToValidate="txtDonGia" ErrorMessage="Đơn giá không được bỏ trống"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="regGia" CssClass="text-danger" runat="server" ControlToValidate="txtDonGia" ErrorMessage="Đơn giá phải là kiểu số" ValidationExpression="^\d+$"></asp:RegularExpressionValidator><br />
            <asp:CompareValidator ID="compGia" runat="server" ErrorMessage="Đơn giá phải lớn hơn 0" ControlToValidate="txtDonGia" Type="Currency" ValueToCompare="0" Operator="GreaterThan" CssClass="text-danger"></asp:CompareValidator>
        </div>
        <div class="form-group">
            <label style="display: block;">Ngày cập nhật</label>
            <asp:TextBox ID="txtNgayCapNhat" type="date" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqNgayCapNhat" CssClass="text-danger" runat="server" ControlToValidate="txtNgayCapNhat" ErrorMessage="Ngày cập nhật không được bỏ trống"></asp:RequiredFieldValidator>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label style="display: block;">Hình</label>
                <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file"></asp:FileUpload>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label style="display: block;">Danh mục sách</label>
                <asp:DropDownList ID="ddlChuDe" CssClass="text-center" runat="server" DataSourceID="dsChuDe" DataTextField="TenCD" DataValueField="MaCD"></asp:DropDownList>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label style="display: block;">Nhà Xuất Bản</label>
                <asp:DropDownList ID="ddlNXB" CssClass="text-center" runat="server" DataSourceID="dsNXB" DataTextField="TenNXB" DataValueField="MaNXB" ></asp:DropDownList>
            </div>
        </div>
        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Thêm" OnClick="btnSave_Click" />
        <asp:Label ID="lblketqua" runat="server" Text=""></asp:Label>
    </div>
    <asp:SqlDataSource ID="dsChuDe" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNXB" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [NhaXuatBan]"></asp:SqlDataSource>
</asp:Content>