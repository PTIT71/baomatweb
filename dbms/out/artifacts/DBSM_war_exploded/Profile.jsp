<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
-->
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Tài khoản của tôi - Tiêu Dân Seafood</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--//meta tags ends here-->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    <!--  -->
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="resources/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- //font-awesome icons -->
    <!--Shoping cart-->
    <link rel="stylesheet" href="resources/css/shop.css" type="text/css"/>
    <!--//Shoping cart-->
    <!--stylesheets-->
    <link href="resources/css/style.css" rel='stylesheet' type='text/css' media="all">
    <link rel="stylesheet" href="resources/css/account.css" type="text/css" media="all">
    <!--//stylesheets-->
    <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!--js working-->

    <!-- //here ends scrolling icon -->
</head>

<body class="account">
<header>
    <div class="header-outs" id="home">
        <div class="header-bar">
            <div class="info-top-grid">
                <div class="info-contact-agile">
                    <ul>
                        <li>
                            <span class="fas fa-phone-volume"></span>
                            <p>+(058) 606 0734</p>
                        </li>
                        <li>
                            <span class="fas fa-envelope"></span>
                            <p><a href="mailto:info@example.com">tieudanseafood@gmail.com</a></p>
                        </li>
                        <c:choose>
                            <c:when test="${currentSessionUser == null}">
                                <li class="float-md-right">
                                    <span class="fas fa-user"></span>
                                    <p><a data-toggle="modal" href="#LoginModal">Đăng nhập</a></p>
                                    <p>|</p>
                                    <p><a href="/DangKyThanhVien">Đăng ký</a></p>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="float-md-right">
                                    <span class="fas fa-user"></span>
                                    <p>Chào <a href="/Profile">${currentSessionUser.hoTen}</a></p>
                                    <p>|</p>
                                    <p><a href="/LogoutAdmin">Thoát</a></p>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
            <div class="container-fluid">
                <div class="hedder-up row">
                    <div style="width:70%" class="col-lg-3 col-md-3 logo-head">
                        <li>
                            <a class="navbar-brand" href="/Index" style="margin-left: 31%">
                                <div class="logo"><img src="resources/images/CrabICO.png" alt=""></div>
                            </a>
                            <h4 style="display:inline-block"><strong><a href="/Index">Tiêu Dân Seafood </a></strong>
                            </h4>
                        </li>
                    </div>
                    <div class="col-lg-5 col-md-6 search-right">
                        <form style="padding-top:6%" class="form-inline my-lg-0">
                            <input name="product-search" id="product-search" class="form-control mr-sm-2" type="search" placeholder="Bạn muốn tìm kiếm...">
                            <a href="" onclick="this.href='/TimKiem?search='+document.getElementById('product-search').value" class="btn">Search</a>
                        </form>
                    </div>
                    <div class="col-lg-4 col-md-3 right-side-cart">
                        <div style="margin-top:2%" class="cart-icons">
                            <ul style="text-align:start">
                                <li style="padding-right: 15pt">
                                    <p style="padding-bottom: 15pt"><strong><a href="tel:+01269220162">0168 xxxx
                                        xxx</a></strong></p>
                                    <p>Tổng đài miễn phí</p>
                                </li>
                                <li style="padding-right: 15pt">
                                    <p style="padding-bottom: 15pt"><strong><a href="/DSBaiViet">CÔNG THỨC</a></strong>
                                    </p>
                                    <p>Đảm đang - Khéo léo</p>
                                </li>
                                <li style="position:relative" class="toyscart toyscart2 cart cart box_1">
                                    <form action="" class="last">
                                        <p style="display:inline-block"><strong><a href="/ShoppingCart?action=checkout">GIỎ HÀNG</a></strong></p>
                                        <button class="top_toys_cart" type="submit" name="submit" onclick="window.location.href='/ShoppingCart?action=checkout'">
                                            <span class="fas fa-cart-arrow-down"></span>
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <ul class="navbar-nav ">
                        <li class="nav-item">
                            <a class="nav-link" href="/Index">Trang chủ <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a href="/GioiThieu" class="nav-link">Giới thiệu</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="/ShoppingCart?action=checkout" id="navbarDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Sản phẩm
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:forEach var="danhMuc" items="${sessionScope.danhMucs}">
                                    <a class="nav-link"
                                       href="/Products?idDM=${danhMuc.maDanhmuc}">${danhMuc.tenDanhmuc}</a>
                                </c:forEach>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="/DSBaiViet" class="nav-link">Công thức chế biến</a>
                        </li>
                        <li class="nav-item">
                            <a href="/LienHe" class="nav-link">Liên hệ</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
<!-- banner -->
<div class="inner_page-banner one-img">
</div>
<!-- banner -->
<ul class="breadcrumb">
    <div class="container">
        <li><a href="/Index">Trang chủ</a></li>
        <li>Thông tin tài khoản</li>
    </div>
</ul>

<div class="gap-element" style="display:block; height:auto; padding-top:15px"></div>
<div class="wrap">
    <div class="container">
        <div class="row">
            <div class="side-bar col-md-3">
                <div class="menu-left">
                    <div class="profiles">
                        <p class="image"><img src="resources/images/userICO.png" alt="" width="45" height="45"></p>
                        <p class="name" style="text-align: left">Tài khoản của</p>
                        <strong>
                            <h6>${currentSessionUser.hoTen}</h6>
                        </strong>
                    </div>
                    <ul class="list-group margin-bottom-25 sidebar-menu">
                        <li class="list-group-item clearfix"><a href="/Profile"><i class="fa fa-angle-right"></i>
                            Thông
                            tin tài khoản</a></li>
                        <li class="list-group-item clearfix"><a href="/DoiMatKhau"><i class="fa fa-angle-right"></i>
                            Đổi mật
                            khẩu</a></li>
                        <li class="list-group-item clearfix"><a href="/QuanLyDonHangCaNhan"><i
                                class="fa fa-angle-right"></i>
                            Quản lý
                            đơn
                            hàng</a></li>
                        <li class="list-group-item clearfix"><a href="/LogoutAdmin"><i class="fa fa-angle-right"></i>
                            Thoát
                            tài
                            khoản</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <!-- <div class="alert alert-success">Thông tin tài khoản của bạn đã được cập nhật.</div> -->
                <h1 class="have-margin">Thông tin tài khoản</h1>
                <div class="account-profile">
                    <form class="content" method="post" action="" id="edit-account">

                        <div class="form-group">
                            <label class="control-label" for="full_name">Họ tên </label>
                            <div class="input-wrap">
                                <input type="text" name="txt-hoten" class="form-control" id="full_name"
                                       value="${nguoiDung.hoTen}"
                                       placeholder="Họ tên">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="phone_number">Số điện thoại</label>
                            <div class="input-wrap">
                                <input type="text" readonly="" value="${nguoiDung.sdt}" class="form-control"
                                       name="txt-phone"
                                       id="phone_number" placeholder="Số điện thoại">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="form_email">Email</label>
                            <div class="input-wrap">
                                <input type="email" readonly="" value="${nguoiDung.email}" class="form-control"
                                       name="txt-email" id="form_email" placeholder="Email">
                            </div>
                        </div>

                        <div class="form-group gender-select-wrap" id="register_name">
                            <label class="control-label" for="gender">Giới tính</label>
                            <div class="input-wrap">
                                <div class="row" id="gender">
                                    <c:choose>
                                        <c:when test="${nguoiDung.gioiTinh==true}">
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="1" id="gender_male"
                                                       class="gender"
                                                       checked="">Nam
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="0" id="gender_female"
                                                       class="gender">Nữ
                                            </label>
                                        </c:when>
                                        <c:otherwise>
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="1" id="gender_male"
                                                       class="gender"
                                                >Nam
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="0" id="gender_female"
                                                       class="gender" checked="">Nữ
                                            </label>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="date01">Ngày sinh</label>
                            <div class="input-wrap">
                                <input name="customer_birthdate" type="date" class="input-xlarge datepicker" id="date01"
                                       value="${nguoiDung.ngaySinh}"
                                       style="width:120px !important;">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-wrap margin">
                                <input type="hidden" name="txtMaNguoiDung" value="${nguoiDung.maNguoiDung}">
                                <input type="hidden" name="txt-dia-chi" value="${nguoiDung.diaChi}">
                                <input type="hidden" name="txt-mat-khau" value="${nguoiDung.matKhau}">
                                <button type="submit" class="btn btn-info btn-block btn-update">Cập nhật</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("form").submit(function () {
            alert("Thông tin tài khoản của bạn đã được cập nhật!");
        });
    });
</script>

<!-- footer -->
<div class="gap-element" style="display:block; height:auto; padding-top:15px"></div>
<footer class="page-footer font-small mdb-color pt-4">

    <!-- Footer Links -->
    <div class="container text-center text-md-left">

        <!-- Footer links -->
        <div class="row text-center text-md-left mt-3 pb-3">

            <!-- Grid column -->
            <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Tiêu Dân</h6>
                <p>Hân hạnh phục vụ bạn.</p>
            </div>
            <!-- Grid column -->

            <hr class="w-100 clearfix d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">MENU</h6>
                <p>
                    <a href="/Index">Trang chủ</a>
                </p>
                <p>
                    <a href="/GioiThieu">Giới thiệu</a>
                </p>
                <p>
                    <a href="/LienHe">Liên hệ</a>
                </p>
                <p>
                    <a href="/DSBaiViet">Món ngon</a>
                </p>
            </div>
            <!-- Grid column -->

            <hr class="w-100 clearfix d-md-none">

            <!-- Grid column -->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Thông tin hữu ích</h6>
                <p>
                    <a href="">Giao nhận hàng</a>
                </p>
                <p>
                    <a href="#!">Chính sách đổi trả hàng</a>
                </p>
                <p>
                    <a href="#!">Chính sách Giải quyết khiếu nại</a>
                </p>
                <p>
                    <a href="#!">Cam kết chất lượng</a>
                </p>
            </div>

            <!-- Grid column -->
            <hr class="w-100 clearfix d-md-none">

            <!-- Grid column -->
            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                <p>
                    <i class="fa fa-home mr-3"></i> 01 Võ Văn Ngân</p>
                <p>
                    <i class="fa fa-envelope mr-3"></i> tieudanseafood@gmail.com</p>
                <p>
                    <i class="fa fa-phone mr-3"></i> + 01 234 567 88</p>
                <p>
                    <i class="fa fa-print mr-3"></i> + 01 234 567 89</p>
            </div>
            <!-- Grid column -->

        </div>
        <!-- Footer links -->

        <hr>

        <!-- Grid row -->
        <div class="row d-flex align-items-center">

            <!-- Grid column -->
            <div class="col-md-7 col-lg-8">

                <!--Copyright-->
                <p class="text-center text-md-left">© 2018 Copyright:
                    <strong> tieudanseafood</strong>
                    </a>
                </p>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-5 col-lg-4 ml-lg-0">

                <!-- Social buttons -->
                <div class="text-center text-md-right">
                    <ul class="list-unstyled list-inline">
                        <li class="list-inline-item">
                            <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                <i class="fab fa-facebook-square"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                <i class="fab fa-google-plus-g"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a class="btn-floating btn-sm rgba-white-slight mx-1">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Grid column -->
        </div>
        <!-- Grid row -->
    </div>
    <!-- Footer Links -->
</footer>
<!-- footer -->
<script src="resources/js/jquery.js"></script>
<script src="resources/js/woocommerce.js"></script>
<script src="resources/js/minicart.js"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/widget.js"></script>
<!--bootstrap working-->
<script src="resources/js/bootstrap.min.js"></script>
<!-- //bootstrap working-->
<!-- //cart-js -->
<!-- start-smoth-scrolling -->
<script src="resources/js/move-top.js"></script>
<script src="resources/js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 900);
        });
    });
</script>
<!-- start-smoth-scrolling -->
<!-- here stars scrolling icon -->
<script>
    $(document).ready(function () {

        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
</body>

</html>