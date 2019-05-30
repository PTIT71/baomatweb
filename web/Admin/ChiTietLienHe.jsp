<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Xem Liên Hệ</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/Admin/TrangChuAdmin">TieuDanSeaFood</a>
            <div class="nav-collapse collapse">
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>${currentSessionAdmin.hoTen}<i class="caret"></i>

                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a tabindex="-1" href="/Admin/Profile">Thông tin cá nhân</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a tabindex="-1" href="/LogoutAdmin">Đăng xuất</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Quản lý Người dùng <b
                                class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu2">
                            <li>
                                <a href="/Admin/NguoiDungThongThuong?page=1">Người dùng thông thường</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/Admin/NguoiDungAdmin?page=1">Admin</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="/Admin/QLSanPham" data-toggle="dropdown" class="dropdown-toggle">Quản lý Sản phẩm
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu1">
                            <c:forEach var="danhMuc" items="${requestScope.danhMucs}">
                                <li>
                                    <a href="/Admin/QLSanPham?idDM=${danhMuc.maDanhmuc}&page=1">${danhMuc.tenDanhmuc}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <a href="/Admin/QlyBaiViet?page=1">Quản lý Bài Viết</a>
                    </li>
                    <li>
                        <a href="/Admin/QLDanhMuc?page=1">Quản lý Danh mục</a>
                    </li>
                    <li>
                        <a href="/Admin/QLDonHang?page=1">Quản lý Đơn hàng</a>
                    </li>
                    <li>
                        <a href="/Admin/QLLienHe?page=1">Quản lý Liên hệ</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Thống kê <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu3">
                            <li>
                                <a href="ThongKeDoanhThu.jsp">Doanh thu</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="ThongKeDonHang.jsp">Đơn hàng</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/Admin/XuatFilePdf">Xuất file Pdf</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="container">
        <div class="row-fluid">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header" style="text-align:center">
                    <div class="muted pull-left">QUẢN LÍ ĐƠN HÀNG</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <form id="form_sample_1" class="form-horizontal" style="width:80%;margin:0 auto;"
                              method="post">
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Mã liên hệ:</label>
                                    <div class="controls">
                                        <input readonly id="txt-ma-lien-he" type="text" name="txtmalienhe"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:285px !important;" value="${CTLienHe.maLienHe}"/>

                                    </div>
                                </div>
                                <div style="float: right;width:50%;">
                                    <label class="control-label">Tên người dùng:</label>
                                    <div class="controls">
                                        <input readonly id="txt-ten-nguoi-dung" type="text" name="txttennguoidung"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:250px !important;" value="${CTLienHe.tenNguoiDung}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Số điện thoại:</label>
                                    <div class="controls">
                                        <input readonly id="txt-sdt" type="text" name="txtsdt" data-required="1"
                                               class="span6 m-wrap"
                                               style="width:285px !important;" value="${CTLienHe.sdt}"/>
                                    </div>
                                </div>
                                <div style="float: right;width:50%;">
                                    <label class="control-label">Email người gửi:</label>
                                    <div class="controls">
                                        <input readonly id="txt-eamil" type="text" name="txtemail"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:250px !important;"
                                               value="${CTLienHe.email}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Nội dung:</label>
                                    <div class="controls">
                                        <textarea readonly id="noi-dung" type="text" name="txtnoidung" data-required="1"
                                                  class="span6 m-wrap"
                                                  style="width:707px !important;">${CTLienHe.noiDung}</textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Gửi phản hồi cho Người dùng:</label>
                                    <div class="controls">
                                        <textarea id="phan-hoi" type="text" name="txtphanhoi" data-required="1"
                                                  class="span6 m-wrap" style="width:707px !important;"></textarea>
                                        <br><small class="text-danger" id="validate-phan-hoi"></small>
                                    </div>
                                </div>
                            </div>
                            <div style="text-align: center">
                                <button type="submit" id="btn-gui" class="btn btn-primary">Gửi phản hồi</button>
                                <a href="/Admin/QLLienHe?page=1" type="button" class="btn btn-success">Hủy bỏ</a>
                            </div>
                            <%--<div style="text-align: center">--%>
                                <%--<button type="submit" class="btn btn-danger btn-large">Gửi</button>--%>
                            <%--</div>--%>

                            <%--<div style="text-align: center">--%>
                                <%--<a href="/Admin/QLLienHe?page=1" type="button" class="btn btn-success btn-large">Quay về--%>
                                    <%--trang chủ</a>--%>
                            <%--</div>--%>
                        </form>
                    </div>
                </div>
                <!-- /block -->
            </div>
        </div>
    </div>
    <hr>
    <footer>
        <p>&copy; TieuDanSeaFood 2018</p>
    </footer>
    <script>
        function kiemTraGuiLienHe() {
            let value = $("#phan-hoi").val();
            if (value === "") {
                $("#validate-phan-hoi").html("Bạn chưa nhập phản hồi cho người dùng");
                $("#phan-hoi").css("border", "solid 1px red");
                return false;
            }
            $("#validate-phan-hoi").html("");
            $("#phan-hoi").css("border", "solid 1px #ccc");
            return true;
        }

        $("#btn-gui").click(() => {
            let kq = kiemTraGuiLienHe();
            return kq !== false;

        });
    </script>
</div>


</body>

</html>