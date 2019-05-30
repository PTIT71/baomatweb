<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thông tin</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Quản lý Người dùng <b class="caret"></b>
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
        <div class="row-fluid">
            <div class="span3" id="sidebar" style="width: 200px;">
                <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                    <li >
                        <a href="/Admin/Profile"><i class="icon-chevron-right"></i>Hồ sơ</a>
                    </li>
                    <li class="active">
                        <a href="/Admin/DoiMatKhau"><i class="icon-chevron-right"></i>Đổi mật khẩu</a>
                    </li>
                </ul>
            </div>
            <!--/span-->
            <div class="span9">
                <div class="container-fluid">
                    <div class="container">
                        <div class="row-fluid">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Đổi mật khẩu</div>
                                </div>
                                <div class="block-content collapse in">
                                    <!-- BEGIN FORM-->
                                    <form action="/Admin/DoiMatKhau" id="form_sample_1" class="form-horizontal" style="width:70%;margin:0 auto;" method="post">
                                        <div class="control-group">
                                            <label class="control-label">Mật khẩu cũ:<span class="required">*</span></label>
                                            <div class="controls">
                                                <input id="txt-mat-khau-cu" type="password" name="txt-mk-cu" data-required="1"
                                                    class="span6 m-wrap" style="width:500px !important;"  />
                                                <c:choose>
                                                    <c:when test="${pwIsValid == false}">
                                                        <div class="alert1">
                                                            <span class="exitbtn" onclick="this.parentElement.style.display='none';">&times;</span>
                                                            Mật khẩu cũ không trùng khớp !!
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${pwIsValid == null}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="alert1">
                                                            <span class="exitbtn" onclick="this.parentElement.style.display='none';">&times;</span>
                                                            Đã cập nhật mật khẩu thành công!!
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <br><small class="text-danger" id="validate-txt-mat-khau-cu"></small>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Mật khẩu mới<span class="required">*</span></label>
                                            <div class="controls">
                                                <input id="txt-mat-khau" type="password" name="txt-mk-moi" data-required="1"
                                                    class="span6 m-wrap" style="width:500px !important;"  />
                                                <br><small class="text-danger" id="validate-txt-mat-khau"></small>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Xác nhận mật khẩu<span class="required">*</span></label>
                                            <div class="controls">
                                                <input id="txt-xac-nhan-mat-khau" type="password" name="name"
                                                    data-required="1" class="span6 m-wrap" style="width:500px!important;"/>
                                                <br><small class="text-danger" id="validate-txt-xac-nhan-mat-khau"></small>
                                            </div>
                                        </div>
                                        <div style="text-align: right">
                                            <button type="submit" id="btn-them" class="btn btn-primary">Hoàn tất</button>
                                            <a href="Admin/TrangChuAdmin"><button type="button" class="btn">Hủy bỏ</button></a>
                                        </div>
                                    </form>

                                    <!-- END FORM-->
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <p>&copy; TieuDanSeaFood 2018</p>
    </footer>
    </div>
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
    <script src="assets/scripts.js"></script>
    <script>
        $(function () {
            // Easy pie charts
            $('.chart').easyPieChart({ animate: 1000 });
        });
    </script>
    <script>
        function kiemTraTxtMatKhauCu() {
            let value = $("#txt-mat-khau").val();
            if (value === "") {
                $("#validate-txt-mat-khau-cu").html("Bạn chưa nhập mật khẩu");
                $("#txt-mat-khau-cu").css("border", "solid 1px red");
                return false;
            }
            if (value.length <= 8) {
                $("#validate-txt-mat-khau-cu").html("Mật khẩu phải lớn hơn 8 ký tự");
                $("#txt-mat-khau-cu").css("border", "solid 1px red");
                return false;
            }
            $("#validate-txt-mat-khau-cu").html("");
            $("#txt-mat-khau-cu").css("border", "solid 1px #ccc");
            return true;
        }
        function kiemTraTxtMatKhauMoi() {
            let value = $("#txt-mat-khau").val();
            if (value === "") {
                $("#validate-txt-mat-khau").html("Bạn chưa nhập mật khẩu");
                $("#txt-mat-khau").css("border", "solid 1px red");
                return false;
            }
            if (value.length <= 8) {
                $("#validate-txt-mat-khau").html("Mật khẩu phải lớn hơn 8 ký tự");
                $("#txt-mat-khau").css("border", "solid 1px red");
                return false;
            }
            $("#validate-txt-mat-khau").html("");
            $("#txt-mat-khau").css("border", "solid 1px #ccc");
            return true;
        }
        function kiemTraTxtXacNhanMatKhau() {
            let mk = $("#txt-mat-khau").val();
            let value = $("#txt-xac-nhan-mat-khau").val();
            if (value !== mk) {
                $("#validate-txt-xac-nhan-mat-khau").html("Mật khẩu không chính xác");
                $("#txt-xac-nhan-mat-khau").css("border", "solid 1px red");
                return false;
            }
            $("#validate-txt-xac-nhan-mat-khau").html("");
            $("#txt-xac-nhan-mat-khau").css("border", "solid 1px #ccc");
            return true;
        }
        $("#btn-them").click(() => {
            let kq = kiemTraTxtMatKhauMoi() & kiemTraTxtXacNhanMatKhau() & kiemTraTxtMatKhauCu();
            if (kq === 0) {
                return false;
            }
            return true;
        });
    </script>


</body>

</html>