<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Giỏ hàng của bạn - Tiêu Dân Seafood</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" id="bootstrap-css">
    <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="resources/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- //font-awesome icons -->
    <link href="resources/css/JiSlider.css" rel="stylesheet">
    <!--stylesheets-->
    <link href="resources/css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//stylesheets-->
    <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <script src="resources/js/jquery-2.2.3.min.js"></script>
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/move-top.js"></script>
</head>

<body>
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
                                        <p><a href="/Logout">Thoát</a></p>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="hedder-up row">
                        <div style="max-width:18%" class="col-lg-3 col-md-3 logo-head">
                            <li>
                                <a class="navbar-brand" href="/Index" style="margin-left: 31%">
                                    <div class="logo"><img src="resources/images/CrabICO.png" alt=""> </div>
                                </a>
                                <h4 style="display:inline-block"><strong><a href="/Index">Tiêu Dân Seafood</a></strong></h4>
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
                                        <p style="padding-bottom: 15pt"><strong><a href="/DSBaiViet">CÔNG THỨC</a></strong></p>
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
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                        <ul class="navbar-nav ">
                            <li class="nav-item">
                                <a class="nav-link" href="/Index">Trang chủ <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="GioiThieu" class="nav-link">Giới thiệu</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:forEach var="danhMuc" items="${sessionScope.danhMucs}">
                                        <a class="nav-link" href="/Products?action=checkout&idDM=${danhMuc.maDanhmuc}">${danhMuc.tenDanhmuc}</a>
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
    <!-- Banner -->
    <div class="inner_page-banner one-img">
    </div>
    <!-- Banner -->
<!-- Modal 1-->
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="LoginModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="LoginModalLabel">Đăng nhập</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="register-form">
                        <form action="/Login" onsubmit="return checkForm(this)">
                            <div class="fields-grid">
                                <div class="styled-input">
                                    <input type="text" placeholder="Nhập Ip Address" name="ipaddress" required="" value="localhost">
                                </div>
                                <div class="styled-input">
                                    <input type="email" placeholder="Email của bạn" name="email" required="">
                                </div>
                                <div class="styled-input">
                                    <input type="password" placeholder="Nhập password" name="password" required="">
                                </div>
                                <button type="submit" class="btn subscrib-btnn">Đăng nhập</button>
                            </div>
                        </form>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                    </div>
                </div>
                <div class="container" style="padding: 11px; background-color:beige">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <span style="padding-top: 5px; float: right">Forgot <a data-toggle="modal" data-target="#ForgetPasswordModal">password?</a></span>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ForgetPasswordModal" role="dialog" aria-labelledby="ForgetPasswordModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <form action="#" method="post">
                    <div class="modal-header" style="display: block;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" id="ForgetPasswordModalLabel">Quên mật khẩu?</h2>
                        <span>Vui lòng cung cấp email hoặc số điện thoại đăng nhập để lấy lại mật khẩu.</span>
                    </div>
                    <div class="modal-body">
                        <input type="email" name="email" id="email-forgot" class="form-control" value="" placeholder="Nhập email hoặc số điện thoại"
                            data-bv-field="email" required>
                    </div>
                    <div class="modal-footer">
                        <a onclick="location.href='/QuenMatKhau?email='+document.getElementById('email-forgot').value"><button type="button" class="btn btn-secondary" onclick="forgotPW()">Gửi</button></a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- //Modal 1-->
    <ul class="breadcrumb">
        <div class="container">
            <li><a href="/Index">Trang chủ</a></li>
            <li>Giỏ hàng</li>
        </div>
    </ul>

    <div class="gap-element" style="display:block; height:auto; padding-top:30px"></div>
    <main class="page-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-md-10 col-lg-push-1 col-md-push-1 col-sm-12 col-xs-12">
                    <div class="main-product container-fluid">
                        <div class="row cate-title">
                            <span class="title-r">Giỏ hàng của bạn</span>
                        </div>
                        <div class="row user-wrapper">
                            <!--Form cart-->
                            <c:choose>
                                <c:when test="${sessionScope.cart.size()==0 or sessionScope.cart ==null}">
                                    <p>Bạn chưa có sản phẩm nào trong giỏ hàng! <a href="/Index">Tiếp tục mua hàng</a></p>
                                </c:when>
                                <c:otherwise>
                                    <form action="" method="post">
                                        <div class="table-responsive">
                                            <table class="cart table">
                                                <tbody>
                                                <tr>
                                                    <th colspan="2">Tên sản phẩm</th>
                                                    <th class="text-center" width="150px">Giá</th>
                                                    <th class="text-center" width="100px">Số lượng</th>
                                                    <th class="text-center" width="100px">Tổng</th>
                                                </tr>
                                                <c:set var="s" value="0"></c:set>
                                                <c:forEach var="it" items="${sessionScope.cart}">
                                                    <c:set var="s" value="${s+ it.sp.giaSP * it.slSanPham}"></c:set>
                                                    <tr class="line_item" style="">
                                                        <td class="item-image" colspan="2">
                                                            <img src=${it.sp.urlHinhAnh}>
                                                            <div class="item-title">
                                                                <a href=/Products?idSP=${it.sp.maSP}>
                                                                    <strong>${it.sp.tenSP}</strong>

                                                                </a>
                                                                <p class="item-delete">
                                                                    <a href="/ShoppingCart?idSP=${it.sp.maSP}&action=delete" onclick="return confirm('Bạn có chắc chứ?')">
                                                                        <img class="delete-cart" src="resources/images/icon-delelte.png">
                                                                        Bỏ sản phẩm
                                                                    </a>
                                                                </p>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="item-one-price">${it.sp.giaSP}</div>
                                                        </td>
                                                        <td class="text-center">
                                                            <span class="btn_quan btn_minus">-</span>
                                                            <input type="text" min="1" data-price="${it.sp.giaSP}" data-id="1033641790"
                                                                   class="quantity" name="updates[]" id="updates_1033641790" value="${it.slSanPham}">
                                                            <span class="btn_quan btn_plus">+</span>
                                                        </td>
                                                        <td class="item-price">${it.sp.giaSP * it.slSanPham}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <c:if test="${s >= 500000}">
                                                <p class="cart_freeship">
                                                    <img src="resources/images/icon_free.png" width="50">
                                                    <span>MIỄN PHÍ giao hàng nội thành TPHCM cho đơn hàng 500,000đ.</span>
                                                </p>
                                            </c:if>
                                            <div class="clearfix">
                                                <div class="col-lg-6 col-xs-12">
                                                    <div class="cart_note text-left">
                                                        <label class="control-label" for="note">Chú Thích</label>
                                                        <textarea name="note" id="note" placeholder="Viết ghi chú" class="form-control"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 pull-right">
                                                    <div class="total-price-modal text-right">
                                                        Thành tiền : <span class="item-total">${s}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row_alert_warning" style="margin-top: 10px">

                                                <p class="note_cart alert-info">Tiêu Dân Seafood chỉ nhận đơn hàng có địa chỉ tại
                                                    TPHCM. Nếu khách hàng ở các tỉnh thành khác vui lòng liên hệ số Hotline
                                                    1900.0098 để được phục vụ!</p>
                                            </div>
                                            <div class="clearfix">
                                                <div class="col-lg-6 col-xs-12">
                                                    <div class="col-lg-6 col-xs-12">
                                                        <div class="comeback pull-left">
                                                            <a href="/Index">
                                                                <i class="fa fa-caret-left" aria-hidden="true"></i>Tiếp tục mua
                                                                hàng
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-xs-12">
                                                        <div class="buttons btn-modal-cart">
                                                            <input type="submit" class="buttonorange"
                                                               id="modal-checkout-button" name="checkout" style="float:right"
                                                                value="Tiến hành thanh toán">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                            <!--/Form cart-->
                            <div class="gap-element" style="display:block; height:auto; padding-top:30px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
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
    <!--js working-->

    <script src="resources/js/minicart.js"></script>
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
    <!-- //here ends scrolling icon -->
    <!--bootstrap working-->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- //bootstrap working-->

    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <script>
        function forgotPW() {
            alert("Vui lòng check mail để nhận mật khẩu mới!");
        }
    </script>
</body>

</html>