<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Xem Đơn hàng</title>
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
                                    <label class="control-label">Tình trạng:</label>
                                    <div class="controls">
                                        <input readonly id="txt-tinh-trang" type="text" name="txt-tinh-trang"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:285px !important;"
                                               value="<c:choose><c:when test="${requestScope.donHangs.tinhTrang}">Đã xong</c:when><c:otherwise>Đang tiến hành</c:otherwise></c:choose>"/>
                                    </div>
                                </div>
                                <div style="float: right;width:50%;">
                                    <label class="control-label">Ngày đặt hàng:</label>
                                    <div class="controls">
                                        <input readonly id="txt-ngay-dat-hang" type="text" name="txt-ngay-dat-hang"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:250px !important;" value="${donHangs.ngayDatHang} "/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Mã người mua:</label>
                                    <div class="controls">
                                        <input readonly id="txt-ma" type="text" name="txt-ma" data-required="1"
                                               class="span6 m-wrap"
                                               style="width:285px !important;" value="${donHangs.maNguoiDung} "/>
                                    </div>
                                </div>
                                <div style="float: right;width:50%;">
                                    <label class="control-label">Hình thức thanh toán:</label>
                                    <div class="controls">
                                        <input readonly id="txt-hinh-thuc" type="text" name="txt-hinh-thuc"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:250px !important;"
                                               value="<c:choose><c:when test="${requestScope.donHangs.hinhThucThanhToan}">Trả trước</c:when><c:otherwise>Thanh toán khi nhận hàng</c:otherwise></c:choose>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Địa chỉ giao hàng:</label>
                                    <div class="controls">
                                        <input readonly id="txt-dia-chi" type="text" name="txt-dia-chi"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:707px !important;" value="${donHangs.diaChiGiaoHang} "/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Ghi chú:</label>
                                    <div class="controls">
                                        <textarea readonly id="ghi-chu" type="text" name="ghi-chu" data-required="1"
                                                  class="span6 m-wrap"
                                                  style="width:707px !important;" >${donHangs.ghiChu}</textarea>
                                    </div>
                                </div>
                            </div>
                            <h4 style="text-align:center">Danh sách sản phẩm đã đặt mua</h4>
                            <table class="table" id="example">
                                <thead>
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th width="200px">Đơn giá</th>
                                </tr>
                                </thead>
                                <c:forEach var="donHangs" items="${requestScope.donHang}">
                                    <tr>
                                        <td>${donHangs.tenSP}</td>
                                        <td>${donHangs.soLuong}</td>
                                        <td>${donHangs.gia} VND</td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="control-group">
                                <div style="float: right;width:43%;">
                                    <label class="control-label">Tổng tiền:</label>
                                    <div class="controls">
                                        <input readonly id="txt-tong-tien" type="text" name="txt-tong-tien"
                                               data-required="1" class="span6 m-wrap"
                                               style="width:180px !important;" value="${requestScope.tongTien} VND"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div style="text-align: center">
                        <a href="/Admin/QLDonHang?page=1" type="button" class="btn btn-success btn-large">Quay về trang chủ</a>
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
</div>


</body>

</html>