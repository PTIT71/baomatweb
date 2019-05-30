<!--
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
-->
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thêm mới người dùng</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
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
    <div class="container">
        <div class="row-fluid">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Thêm mới người dùng</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <!-- BEGIN FORM-->
                        <form action="/Admin/TMNguoiDung" id="form_sample_1" class="form-horizontal" style="width:70%;margin:0 auto;" method="post">
                            <div class="control-group">
                                <div style="float:left;width:50%;">
                                    <label class="control-label">Họ tên(bắt buộc)<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="txt-ten" type="text" name="txt-ten" data-required="1"
                                               class="span6 m-wrap"
                                               style="width:500px !important;"/>
                                        <br>
                                        <small class="text-danger" id="validate-txt-ten"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Giới tính<span class="required">*</span></label>
                                <div class="controls">
                                    <select class="span6 m-wrap" name="txt-gioi-tinh" style="width:500px !important;">
                                        <option value="1">Nam</option>
                                        <option value="0">Nữ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Địa chỉ email(bắt buộc):<span
                                        class="required">*</span></label>
                                <div class="controls">
                                    <input id="txt-email" name="txt-email" type="txt-email" class="span6 m-wrap"
                                           style="width:500px !important;"/>
                                    <br>
                                    <small class="text-danger" id="validate-txt-email"></small>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Số điện thoại(bắt buộc)<span
                                        class="required">*</span></label>
                                <div class="controls">
                                    <input id="txt-dien-thoai" type="text" name="txt-dien-thoai" data-required="1"
                                           class="span6 m-wrap"
                                           style="width:500px !important;"/>
                                    <br>
                                    <small class="text-danger" id="validate-txt-dien-thoai"></small>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Địa chỉ<span class="required">*</span></label>
                                <div class="controls">
                                    <input id="txt-dia-chi" type="text" name="txt-dia-chi" data-required="1"
                                           class="span6 m-wrap"
                                           style="width:500px !important;"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Ngày sinh<span class="required">*</span></label>
                                <div class="controls">
                                    <input id="dt-ngay-sinh" name="dt-ngay-sinh" type="date"
                                           class="input-xlarge datepicker" id="date01"
                                           style="width:486px !important;">
                                    <br>
                                    <small class="text-danger" id="validate-dt-ngay-sinh"></small>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Mật khẩu(bắt buộc)<span class="required">*</span></label>
                                <div class="controls">
                                    <input id="txt-mat-khau" type="password" name="txt-mat-khau" data-required="1"
                                           class="span6 m-wrap"
                                           style="width:500px !important;"/>
                                    <br>
                                    <small class="text-danger" id="validate-txt-mat-khau"></small>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Xác nhận mật khẩu<span class="required">*</span></label>
                                <div class="controls">
                                    <input id="txt-xac-nhan-mat-khau" type="password" name="txt-xac-nhan-mat-khau"
                                           data-required="1"
                                           class="span6 m-wrap" style="width:500px!important;"/>
                                    <br>
                                    <small class="text-danger" id="validate-txt-xac-nhan-mat-khau"></small>
                                </div>
                            </div>
                            <div style="text-align:center;">
                                <button type="submit" id="btn-them" class="btn btn-primary">Thêm người dùng</button>
                                <a href="/Admin/NguoiDungThongThuong?page=1" type="button" class="btn">Hủy bỏ</a>
                            </div>
                        </form>

                        <!-- END FORM-->
                    </div>
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
<%--</div>--%>
<script>
    function kiemTraTxtTen() {
        let value = $("#txt-ten").val();
        if (value === "") {
            $("#validate-txt-ten").html("Bạn chưa nhập tên");
            $("#txt-ten").css("border", "solid 1px red");
            return false;
        }
        $("#validate-txt-ten").html("");
        $("#txt-ten").css("border", "solid 1px #ccc");
        return true;
    }

    function kiemTraTxtEmail() {
        let reg = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;
        let value = $("#txt-email").val();
        if (value === "") {
            $("#validate-txt-email").html("Bạn chưa nhập email");
            $("#txt-email").css("border", "solid 1px red");
            return false;
        }
        if (!reg.test(value)) {
            $("#validate-txt-email").html("Email không hợp lệ");
            $("#txt-email").css("border", "solid 1px red");
            return false;
        }
        $("#validate-txt-email").html("");
        $("#txt-email").css("border", "solid 1px #ccc");
        return true;
    }

    function KiemTraTxtDienThoai() {
        let reg = /^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/;
        let value = $("#txt-dien-thoai").val();
        if (value === "") {
            $("#validate-txt-dien-thoai").html("Bạn chưa nhập số điện thoại");
            $("#txt-dien-thoai").css("border", "solid 1px red");
            return false;
        }
        if (!reg.test(value)) {
            $("#validate-txt-dien-thoai").html("Số điện thoại không hợp lệ");
            $("#txt-dien-thoai").css("border", "solid 1px red");
            return false;
        }
        $("#validate-txt-dien-thoai").html("");
        $("#txt-dien-thoai").css("border", "solid 1px #ccc");
        return true;
    }

    function kiemTraTxtNgaySinh() {
        let value = $("#dt-ngay-sinh").val();
        if (value === "") {
            $("#validate-dt-ngay-sinh").html("Bạn chưa chọn ngày tháng năm sinh");
            $("#dt-ngay-sinh").css("border", "solid 1px red");
            return false;
        }
        $("#validate-dt-ngay-sinh").html("");
        $("#dt-ngay-sinh").css("border", "solid 1px #ccc");
        return true;
    }

    function kiemTraTxtMatKhau() {
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
        let kq = kiemTraTxtTen() & kiemTraTxtEmail() & KiemTraTxtDienThoai() & kiemTraTxtNgaySinh() & kiemTraTxtMatKhau() & kiemTraTxtXacNhanMatKhau();
    if (kq === 0) {
        return false;
    }
    return true;
    })
    ;
</script>
</body>

</html>