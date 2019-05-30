<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="active">
                        <a href="/Admin/Profile"><i class="icon-chevron-right"></i>Hồ sơ</a>
                    </li>
                    <li>
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
                                    <div class="muted pull-left">Thông tin cá nhân</div>
                                </div>
                                <div class="block-content collapse in">
                                    <!-- BEGIN FORM-->
                                    <form action="" method="post" id="form_sample_1" class="form-horizontal" style="width:70%;margin:0 auto;">
                                        <div class="control-group">
                                            <div style="float:left;width:50%;">
                                                <label class="control-label">Họ tên<span class="required">*</span></label>
                                                <div class="controls">
                                                    <input disabled id="txt-ten" type="text" name="name" data-required="1"
                                                           class="span6 m-wrap" style="width:500px !important;" value= "${admin.hoTen} "/>
                                                    <br><small class="text-danger" id="validate-txt-ten"></small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Giới tính<span class="required">*</span></label>
                                            <div class="controls">
                                                <c:choose>
                                                    <c:when test="${admin.gioiTinh}">
                                                        <input disabled id="txt-gioi-tinh" type="text" name="name" data-required="1" class="span6 m-wrap"
                                                               style="width:500px !important;"  value="Nam"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input disabled id="txt-gioi-tinh" type="text" name="name" data-required="1" class="span6 m-wrap"
                                                               style="width:500px !important;"  value="Nữ"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Địa chỉ email<span class="required">*</span></label>
                                            <div class="controls">
                                                <input disabled id="txt-email" name="email" type="text" class="span6 m-wrap" style="width:500px !important;"
                                                       value="${admin.email}" />
                                                <br><small class="text-danger" id="validate-txt-email"></small>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Số điện thoại<span class="required">*</span></label>
                                            <div class="controls">
                                                <input disabled id="txt-dien-thoai" type="text" name="name" data-required="1"
                                                       class="span6 m-wrap" style="width:500px !important;" value="${admin.sdt} " />
                                                <br><small class="text-danger" id="validate-txt-dien-thoai"></small>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Địa chỉ<span class="required">*</span></label>
                                            <div class="controls">
                                                <input disabled id="txt-dia-chi" type="text" name="name" data-required="1"
                                                       class="span6 m-wrap" style="width:500px !important;" value="${admin.diaChi}" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Ngày sinh<span class="required">*</span></label>
                                            <div class="controls">
                                                <input disabled type="text" class="input-xlarge datepicker" id="date01" value="${admin.ngaySinh}"
                                                       style="width:486px !important;">
                                                <br><small class="text-danger" id="validate-dt-ngay-sinh"></small>
                                            </div>
                                        </div>
                                        <div style="text-align: right;">
                                            <a href="/Admin/EditProfile" class="btn btn-primary"><i class="icon-pencil icon-white"></i>
                                            Edit</a>
                                            <a href="TrangChuAdminServlet" type="button" class="btn">Trở về</a>
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


</body>

</html>