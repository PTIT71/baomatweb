<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<!DOCTYPE html>
<html lang="vi">

<head>
  <title>Liên hệ</title>
  <!--meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--//meta tags ends here-->
  <!--booststrap-->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
  <!--//booststrap end-->
  <!-- font-awesome icons -->
  <link href="resources/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
  <!-- //font-awesome icons -->
  <!-- For Clients slider -->
  <link rel="stylesheet" href="resources/css/flexslider.css" type="text/css" media="all" />
  <!--flexs slider-->
  <link href="resources/css/JiSlider.css" rel="stylesheet">
  <!--Shoping cart-->
  <link rel="stylesheet" href="resources/css/shop.css" type="text/css" />
  <!--//Shoping cart-->
  <!--stylesheets-->
  <link href="resources/css/style.css" rel='stylesheet' type='text/css' media="all">
  <!--//stylesheets-->
  <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
  <title>Liên Hệ</title>
  <script type="text/javascript" src="resources/js/jquery-2.2.3.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="resources/js/parallax.min.js"></script>
  <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="resources/css/global.css">
  <link rel="stylesheet" href="resources/css/style.trang-chu.css">
  <link rel="stylesheet" href="resources/style.lien-he.css">
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
            <div style="width:70%" class="col-lg-3 col-md-3 logo-head">
              <li>
                <a class="navbar-brand" href="/Index" style="margin-left: 31%">
                  <div class="logo"><img src="resources/images/CrabICO.png" alt=""> </div>
                </a>
                <h4 style="display:inline-block"><strong><a href="/Index">Tiêu Dân Seafood </a></strong></h4>
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
                    <p style="padding-bottom: 15pt"><strong><a href="tel:+01269220162">0168 xxxx xxx</a></strong></p>
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
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">
                  Sản phẩm
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <c:forEach var="danhMuc" items="${sessionScope.danhMucs}">
                    <a class="nav-link" href="/Products?action=checkout&idDM=${danhMuc.maDanhmuc}">${danhMuc.tenDanhmuc}</a>
                  </c:forEach>
                </div>
              </li>
              <li class="nav-item">
                <a href="/DSBaiViet" class="nav-link">Công thức chế biến</a>
              </li>
              <li class="nav-item active">
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
      <li>Liên hệ</li>
    </div>
  </ul>
  <div class="maincontent">
    <div class="container">
      <div class="gap-element" style="display:block; height:auto; padding-top:20px"></div>
      <div class="map col-sm-12">
        <div id="googleMap" style="width: 100%; height: 450px; position: relative; overflow: hidden;">
          <iframe src="https://maps.google.com/maps?q=Tr%C6%B0%E1%BB%9Dng%20%C4%90%E1%BA%A1i%20h%E1%BB%8Dc%20S%C6%B0%20ph%E1%BA%A1m%20K%E1%BB%B9%20thu%E1%BA%ADt&t=k&z=15&ie=UTF8&iwloc=&output=embed"
            width="1110" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <h2 style="margin-top: 29px">Thông tin liên hệ</h2>
            <h5 style="margin-bottom: 0px">Cửa hàng hải sản tiêu dân</h5>
            <p>Số 1, Võ Văn Ngân, Quận Thủ Đức, TPHCM</p>
            <h5 style="margin-bottom: 0px">Phone number</h5>
            <p>08280888**</p>
            <h5 style="margin-bottom: 0px">Email</h5>
            <p>Email: tieudanseafood@gmail.com</p>
            <h5 style="margin-bottom: 0px">Website</h5>
            <p>www.tieudanseafood.com.vn</p>
          </div>
          <div class="col-sm-6">
            <div class="nhanxet" style="margin-top: 30px">
              <h3>CONTACT US </h3>
              <hr>
              <form method="POST" action="" id="ContactForm" name="ContactForm">
                <fieldset>
                  <legend>Nếu bạn có thắc mắc gì, hãy gửi yêu cầu cho chúng tôi và chúng
                    tôi sẽ
                    liên lạc với bạn sớm nhất
                    có thể</legend>
                  <div class="form-group">
                    <label for="name">Tên (Điền ít nhất 2 ký tự)</label>
                    <input id="name" name="name" type="text" class="form-control" placeholder="Tên của bạn" required>
                  </div>
                  <div class="form-group">
                    <label for="email">Địa chỉ Email</label>
                    <input id="email" name="email" type="email" class="form-control" placeholder="Email của bạn" required>
                  </div>
                  <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input id="phone" name="phone" type="tel" class="form-control" placeholder="Số điện thoại" name="phone" required>
                  </div>
                  <div class="form-group">
                    <label for="message">Nội dung</label>
                    <textarea id="message" name="message" class="form-control" rows="4" placeholder="Viết bình luận" required></textarea>
                  </div>
                  <a onclick="return (phonenumber(document.ContactForm.phone))"><input onsubmit="sendContact()" type="submit" value="Gửi liên hệ" class="btn btn-danger" id="submit"></a>
                </fieldset>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="gap-element" style="display:block; height:auto; padding-bottom:20px"></div>
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

  <div class="modal fade" id="ForgetPasswordModal" role="dialog" aria-labelledby="ForgetPasswordModalLabel" aria-hidden="true">
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
  <div class="clearfix"></div>

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
  <script>
      addEventListener("load", function () {
          setTimeout(hideURLbar, 0);
      }, false);

      function hideURLbar() {
          window.scrollTo(0, 1);
      }
  </script>
  <script>
      // just for the demos, avoids form submit
      jQuery.validator.setDefaults({
          debug: true,
          success: "valid"
      });
      $("#ContactForm").validate({
          rules: {
              field: {
                  required: true,
                  email: true,
                  phonenumber: true
              }
          }
      });
  </script>
  <script>
      function phonenumber(inputtxt) {
          var phoneno = /(09|01[2|6|8|9])+([0-9]{8})\b/g;
          if (inputtxt.value.match(phoneno)) {
              return true;
          }
          else {
              alert("Vui lòng nhập lại số điện thoại");
              return false;
          }
      }
  </script>
  <script>
      function forgotPW() {
          alert("Vui lòng check mail để nhận mật khẩu mới!");
      }
  </script>
  <script>
      function sendContact() {
          alert("Cảm ơn bạn đã phản hồi về shop, bạn sẽ nhận được trả lời sớm nhất có thể!");
      }
  </script>
</body>

</html>