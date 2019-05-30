<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thanh toán đơn hàng</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--//meta tags ends here-->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- font-awesome icons -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--//Shoping cart-->
    <link rel="stylesheet" href="resources/css/checkout.css" type="text/css" />
    <link rel="stylesheet" href="resources/css/style.css" type="text/css" />

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
                                    <li class="float-md-right">
                                        <span class="fas fa-user"></span>
                                        <p>Chào <a href="/Profile">${currentSessionUser.hoTen}</a></p>
                                        <p>|</p>
                                        <p><a href="/LogoutAdmin">Thoát</a></p>
                                    </li>
                        </ul>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="hedder-up row">
                        <div style="max-width:20%" class="col-lg-3 col-md-3 logo-head">
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
                                <a href="/GioiThieu" class="nav-link">Giới thiệu</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:forEach var="danhMuc" items="${sessionScope.danhMucs}">
                                        <a class="nav-link" href="/Products?idDM=${danhMuc.maDanhmuc}">${danhMuc.tenDanhmuc}</a>
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
    <ul class="breadcrumb">
        <div class="container">
            <li><a href="/Index">Trang chủ</a></li>
            <li><a href="/ShoppingCart?action=checkout">Giỏ hàng</a></li>
            <li>Thông tin giao hàng</li>
        </div>
    </ul>
    <div class="content">
        <div class="wrap">
            <form id="form_next_step" accept-charset="UTF-8" method="post" action="">
            <div class="sidebar">
                <div class="sidebar-content">
                    <div class="order-summary order-summary-is-collapsed">
                        <h2 class="visually-hidden">Thông tin đơn hàng</h2>
                        <div class="order-summary-sections">
                            <div class="order-summary-section order-summary-section-product-list"
                                data-order-summary-section="line-items">
                                <table class="product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col"><span class="visually-hidden">Hình ảnh</span></th>
                                            <th scope="col"><span class="visually-hidden">Mô tả</span></th>
                                            <th scope="col"><span class="visually-hidden">Số lượng</span></th>
                                            <th scope="col"><span class="visually-hidden">Giá</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="s" value="0"></c:set>
                                    <c:forEach var="it" items="${sessionScope.cart}">
                                    <c:set var="s" value="${s+ it.sp.giaSP * it.slSanPham}"></c:set>
                                        <tr class="product" data-product-id="1017420107" data-variant-id="1033641790">
                                            <td class="product-image">
                                                <div class="product-thumbnail">
                                                    <div class="product-thumbnail-wrapper">
                                                        <img class="product-thumbnail-image" alt="${it.sp.tenSP}"
                                                            src="${it.sp.urlHinhAnh}">
                                                    </div>
                                                    <span class="product-thumbnail-quantity" aria-hidden="true">${it.slSanPham}</span>
                                                </div>
                                            </td>
                                            <td class="product-description">
                                                <span class="product-description-name order-summary-emphasis">${it.sp.tenSP}</span>

                                                <span class="product-description-variant order-summary-small-text">
                                                    ${it.slSanPham}kg
                                                </span>

                                            </td>
                                            <td class="product-quantity visually-hidden">${it.slSanPham}</td>
                                            <td class="product-price">
                                                <span class="order-summary-emphasis">${s} đ</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="order-summary-section order-summary-section-total-lines"
                                data-order-summary-section="payment-lines">
                                <table class="total-line-table">
                                    <thead>
                                        <tr>
                                            <th scope="col"><span class="visually-hidden">Mô tả</span></th>
                                            <th scope="col"><span class="visually-hidden">Giá</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="total-line total-line-subtotal">
                                            <td class="total-line-name">Tạm tính</td>
                                            <td class="total-line-price">
                                                <span class="order-summary-emphasis"
                                                    data-checkout-subtotal-price-target="${s}">
                                                    ${s} đ
                                                </span>
                                                <input value="${s}" name="txtTongTien" id="TongTien" hidden>
                                            </td>
                                        </tr>

                                        <tr class="total-line total-line-shipping">
                                            <td class="total-line-name">Phí vận chuyển</td>
                                            <td class="total-line-price">
                                                <c:if test="${s>=500000}">
                                                <span class="order-summary-emphasis"
                                                    data-checkout-total-shipping-target="0">
                                                    Miễn phí
                                                </span>
                                                </c:if>
                                                <c:if test="${s<500000}">
                                                <span class="order-summary-emphasis"
                                                      data-checkout-total-shipping-target="50000">
                                                    50000 đ
                                                </span>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="total-line-table-footer">
                                        <tr class="total-line">
                                            <td class="total-line-name payment-due-label">
                                                <span class="payment-due-label-total">Tổng cộng</span>
                                            </td>
                                            <td class="total-line-name payment-due">
                                                <span class="payment-due-currency">VND</span>
                                                <c:if test="${s>=500000}">
                                                <span class="payment-due-price" data-checkout-payment-due-target="${s}">
                                                    ${s} đ
                                                </span>
                                                </c:if>
                                                <c:if test="${s<500000}">
                                                <span class="payment-due-price" data-checkout-payment-due-target="${s+50000}">
                                                    ${s+50000} đ
                                                </span>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main">
                <div class="main-content">
                    <div class="step">
                        <div class="step-sections steps-onepage" step="1">
                            <div class="section">
                                <div class="section-header">
                                    <h2 class="section-title">Thông tin giao hàng</h2>
                                </div>
                                <div class="section-content section-customer-information no-mb">
                                    <div class="fieldset">
                                        <div class="field    field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="billing_address_full_name">Họ và tên</label>
                                                <input placeholder="Họ và tên" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" type="text" id="billing_address_full_name"
                                                    name="billing_address[full_name]" value="${nguoiDung.hoTen}" readonly>
                                            </div>
                                        </div>
                                        <div class="field  field-two-thirds   field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="checkout_user_email">Email</label>
                                                <input placeholder="Email" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" type="email" id="checkout_user_email"
                                                    name="checkout_user[email]" value="${nguoiDung.email}" readonly>
                                            </div>
                                        </div>
                                        <div class="field field-required field-third   field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="billing_address_phone">Số điện thoại</label>
                                                <input placeholder="Số điện thoại" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" maxlength="11" type="tel" id="billing_address_phone"
                                                    name="billing_address[phone]" value="${nguoiDung.sdt}" readonly>
                                            </div>
                                        </div>
                                        <div class="field field-required   field-show-floating-label">
                                            <div class="field-input-wrapper">
                                                <label class="field-label" for="billing_address_address1">Địa chỉ</label>
                                                <input placeholder="Địa chỉ" autocapitalize="off" spellcheck="false"
                                                    class="field-input" size="30" type="text" id="billing_address_address1"
                                                    name="billing_address" value="${nguoiDung.diaChi}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <div id="change_pick_location_or_shipping">
                                    <div id="section-shipping-rate" style="padding-top: 3em">
                                        <div class="section-header">
                                            <h2 class="section-title">Phương thức vận chuyển</h2>
                                        </div>
                                        <div class="section-content">
                                            <div class="content-box">
                                                <div class="content-box-row">
                                                    <div class="radio-wrapper">
                                                        <label class="radio-label" for="shipping_rate">
                                                            <c:if test="${s >=500000}">
                                                            <div class="radio-input">
                                                                <input id="shipping_rate" class="input-radio"
                                                                    type="radio" name="shipping_rate"
                                                                       checked="" disabled value="0">
                                                            </div>
                                                            </c:if>
                                                            <c:if test="${s < 500000}">
                                                                <div class="radio-input">
                                                                    <input id="shipping_rate" class="input-radio"
                                                                           type="radio" name="shipping_rate" disabled value="50000">
                                                                </div>
                                                            </c:if>
                                                            <span class="radio-label-primary">Freeship từ 500,000đ. Nội
                                                                thành &amp; giờ hành chính</span>
                                                            <c:if test="${s >=500000}">
                                                            <span class="radio-accessory content-box-emphasis">
                                                                0 đ
                                                            </span>
                                                            </c:if>
                                                            <c:if test="${s <500000}">
                                                            <span class="radio-accessory content-box-emphasis">
                                                                50000 đ
                                                            </span>
                                                            </c:if>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="section-payment-method" class="section">
                                        <div class="section-header">
                                            <h2 class="section-title">Phương thức thanh toán</h2>
                                        </div>
                                        <div class="section-content">
                                            <div class="content-box">
                                                <div class="radio-wrapper content-box-row">
                                                    <label class="radio-label" for="payment_method_direct">
                                                        <div class="radio-input">
                                                            <input id="payment_method_direct" class="input-radio"
                                                                   name="payment_method_id" type="radio" value="1"
                                                                   checked="">
                                                        </div>
                                                        <span class="radio-label-primary">Thanh toán khi giao hàng
                                                            (COD)</span>
                                                    </label>
                                                </div>
                                                <div class="radio-wrapper content-box-row content-box-row-secondary"
                                                     for="payment_method_direct">
                                                    <div class="blank-slate">
                                                        Tiêu Dân Seafood sẽ giao hàng và thu tiền tận nơi ngay khi bạn
                                                        nhận
                                                        được hàng tại khu vực TPHCM
                                                    </div>
                                                </div>
                                                <div class="radio-wrapper content-box-row">
                                                    <label class="radio-label" for="payment_method_banking">
                                                        <div class="radio-input">
                                                            <input id="payment_method_banking" class="input-radio"
                                                                   name="payment_method_id" type="radio" value="0">
                                                        </div>
                                                        <span class="radio-label-primary">Chuyển khoản qua ngân hàng</span>
                                                    </label>
                                                </div>

                                                <div class="radio-wrapper content-box-row content-box-row-secondary hidden"
                                                     for="payment_method_banking">
                                                    <div class="blank-slate">
                                                        Nếu bạn muốn thanh toán trước có thể chuyển khoản cho Tiêu Dân
                                                        Seafood qua tài khoản:
                                                        Ngân hàng : BIDV - CN Đông Sài Gòn,phường Bình Thọ, quận Thủ
                                                        Đức, Tp. Hồ Chí Minh.
                                                        Số TK : 01xxxxxxxxxxxx
                                                        Chủ TK : Nguyễn Thanh Tân.
                                                        Sau khi chuyển khoản vui lòng thông báo cho chúng tôi biết qua
                                                        Hotline : 1900.0098
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="step-footer">
                                <input name="utf8" type="hidden" value="✓">
                                <input type="submit" class="btn step-footer-continue-btn btn" value="Hoàn tất đơn hàng">
                                    <i class="btn-spinner icon icon-button-spinner"></i>
                            <a class="step-footer-previous-link" href="/ShoppingCart?action=checkout">
                                <svg class="previous-link-icon icon-chevron icon" xmlns="http://www.w3.org/2000/svg"
                                    width="6.7" height="11.3" viewBox="0 0 6.7 11.3">
                                    <path d="M6.7 1.1l-1-1.1-4.6 4.6-1.1 1.1 1.1 1 4.6 4.6 1-1-4.6-4.6z"></path>
                                </svg>
                                Giỏ hàng
                            </a>
                        </div>

                    </div>
                </div>
                <div class="main-footer">
                </div>
            </form>
            </div>
        </div>
    </div>

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
    <script src="resources/js/jquery-2.2.3.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <!-- start-smoth-scrolling -->
    <script src="resources/js/move-top.js"></script>
    <script src="resources/js/easing.js"></script>
    <!--bootstrap working-->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- //bootstrap working-->
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
    <script type="text/javascript">
        var parseQueryString = function (url) {

            var str = url;
            var objURL = {};

            str.replace(
                new RegExp("([^?=&]+)(=([^&]*))?", "g"),
                function ($0, $1, $2, $3) {

                    if ($3 != undefined && $3 != null)
                        objURL[$1] = decodeURIComponent($3);
                    else
                        objURL[$1] = $3;
                });

            return objURL;
        };
    </script>
    <script type="text/javascript">
        var isInit = false;

        function funcFormOnSubmit(e) {
            if (!isInit) {
                isInit = true;

                $.fn.tagName = function () {
                    return this.prop("tagName").toLowerCase();
                };
            }
            if (typeof (e) == 'string') {
                var element = $(e);
                var formData = e;
            } else {
                var element = this;
                var formData = this;
                e.preventDefault();
            }
            var formId = $(element).attr('id'), replaceElement = [], funcCallback;
            if (formId == undefined || formId == null || formId == '')
                return;

            if (formId == 'form_next_step') {
                formData = '.step-sections';
                replaceElement.push('.step-sections');
            }

            else if (
                formId == 'form_discount_add'
                || formId == 'form_discount_remove'
                || formId == 'form_update_location'
                || formId == 'section-shipping-rate'
            ) {
                replaceElement.push('#form_update_location');
                replaceElement.push('#change_pick_location_or_shipping');
                replaceElement.push('.inventory_location_data');
                replaceElement.push('.order-summary-toggle-inner .order-summary-toggle-total-recap');
                replaceElement.push('.order-summary-sections');
                replaceElement.push('#section-shipping-rate');
            }

            if (!$(formData) || $(formData).length == 0) {
                window.location.reload();
                return false;
            }

            var inputurl = '';

            if (($(formData).tagName() != 'form' && $(formData).tagName() != 'input' && $(formData).tagName() != 'div')
                || ($(formData).tagName() == 'input' || $(formData).tagName() == 'div')) {

                formData += ' :input';
            }
            try {
                var listparameters = new URLSearchParams($(formData).serialize());
                var provincetmp = $('body').find('input[name$="selected_customer_shipping_province"]').val();
                if (provincetmp != '') listparameters.set('customer_shipping_province', provincetmp);

                var districttmp = $('body').find('input[name$="selected_customer_shipping_district"]').val();
                if (districttmp != '') listparameters.set('customer_shipping_district', districttmp);

                var wardtmp = $('body').find('input[name$="selected_customer_shipping_ward"]').val();
                if (wardtmp != '') listparameters.set('customer_shipping_ward', wardtmp);

                listparameters.delete('selected_customer_shipping_province');
                listparameters.delete('selected_customer_shipping_district');
                listparameters.delete('selected_customer_shipping_ward');
                inputurl = listparameters.toString();

            } catch (err) {

                // Older Browser URLSearchParams not support
                var listparameters = parseQueryString($(formData).serialize());
                var provincetmp = $('body').find('input[name$="selected_customer_shipping_province"]').val();
                if (provincetmp != '' && listparameters.customer_shipping_province) listparameters.customer_shipping_province = provincetmp;

                var districttmp = $('body').find('input[name$="selected_customer_shipping_district"]').val();
                if (districttmp != '' && listparameters.customer_shipping_district) listparameters.customer_shipping_district = districttmp;

                var wardtmp = $('body').find('input[name$="selected_customer_shipping_ward"]').val();
                if (wardtmp != '' && listparameters.customer_shipping_ward) listparameters.customer_shipping_ward = wardtmp;

                delete listparameters.selected_customer_shipping_province;
                delete listparameters.selected_customer_shipping_district;
                delete listparameters.selected_customer_shipping_ward;

                var listObject = '';
                for (var key in listparameters) {
                    listObject += '&' + key + '=' + encodeURIComponent(listparameters[key]);
                };
                inputurl = listObject.substring(1);

            }

            return false;
        };
        function funcSetEvent() {
            var effectControlFieldClass = '.field input, .field select, .field textarea';

            $('body')
                .on('focus', effectControlFieldClass, function () {
                    funcFieldFocus($(this), true);
                })
                .on('blur', effectControlFieldClass, function () {
                    funcFieldFocus($(this), false);
                    funcFieldHasValue($(this), true);
                })
                .on('keyup input paste', effectControlFieldClass, function () {
                    funcFieldHasValue($(this), false);
                })


            $('body')
                .on('change', '#section-payment-method input:radio', function () {
                    $('#section-payment-method .content-box-row.content-box-row-secondary').addClass('hidden');

                    var id = $(this).attr('id');

                    if (id) {
                        var sub = $('body').find('.content-box-row.content-box-row-secondary[for=' +    id + ']')

                        if (sub && sub.length > 0) {
                            $(sub).removeClass('hidden');
                        }
                    }
                });
        };
        function funcFieldFocus(fieldInputElement, isFocus) {
            if (fieldInputElement == undefined)
                return;

            var fieldElement = $(fieldInputElement).closest('.field');

            if (fieldElement == undefined)
                return;

            if (isFocus)
                $(fieldElement).addClass('field-active');
            else
                $(fieldElement).removeClass('field-active');
        };
        function funcFieldHasValue(fieldInputElement, isCheckRemove) {
            if (fieldInputElement == undefined)
                return;

            var fieldElement = $(fieldInputElement).closest('.field');

            if (fieldElement == undefined)
                return;

            if ($(fieldElement).find('.field-input-wrapper-select').length > 0) {
                var value = $(fieldInputElement).find(':selected').val();

                if (value == 'null')
                    value = undefined;
            } else {
                var value = $(fieldInputElement).val();
            }

            if (!isCheckRemove) {
                if (value != $(fieldInputElement).attr('value'))
                    $(fieldElement).removeClass('field-error');
            }

        };
        function funcInit() {
            funcSetEvent();
        }
        $(document).ready(function () {
            funcInit();
        });
    </script>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
</body>

</html>