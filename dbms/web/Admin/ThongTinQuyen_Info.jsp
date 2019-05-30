<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
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
    <link href="assets/styles.css" rel="stylesheet" media="screen">
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
                <a class="brand" href="index.html">TieuDanSeaFood</a>
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
                    <li>
                        <a href="ThongTinCaNhan.jsp"><i class="icon-chevron-right"></i>Hồ sơ</a>
                    </li>
                    <li>
                        <a href="DoiMatKhau.jsp"><i class="icon-chevron-right"></i>Đổi mật khẩu</a>
                    </li>
                    <li  class="active">
                        <a href="ThongTinQuyen_Info.jsp"><i class="icon-chevron-right"></i>Quyền</a>
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
                                    <div class="muted pull-left">Thông tin quyền hạn cá nhân</div>
                                </div>
                                <div class="block-content collapse in">
                                    <!-- BEGIN FORM-->
                                    <form action="#" id="form_sample_1" class="form-horizontal" style="width:70%;margin:0 auto;">                                      
                                        <div class="control-group">
                                            <label class="control-label">Chọn nghiệp vụ</label>
                                            <div class="controls">
                                                <select class="span6 m-wrap" name="category" style="width:500px !important;">
                                                    <option value="">chọn nghiệp vụ</option>
                                                    <option value="Category 1">Quản lí người dùng thông thường</option>
                                                    <option value="Category 1">Quản lí admin</option>
                                                    <option value="Category 1">Quản lí sản phẩm</option>
                                                    <option value="Category 1">Quản lí bài viết</option>
                                                    <option value="Category 1">Quản lí danh mục</option>
                                                    <option value="Category 1">Quản lí đơn hàng</option>
                                                    <option value="Category 1">Quản lí quyền</option>
                                                </select>
                                            </div>
                                        </div>
                                        <h4 style="text-align: center">Danh sách quyền hạn</h4>
                                        <div class="control-group" style="margin-left: 43%;">
                                            <label class="uniform">
                                                <br>
                                                <input disabled class="uniform_on" type="checkbox" id="optionsCheckbox1" value="option1"
                                                    checked>Xem
                                                thông tin
                                            </label>
                                            <label class="uniform">
                                                <input disabled class="uniform_on" type="checkbox" id="optionsCheckbox2" value="option1"
                                                    checked>Thêm
                                                mới
                                            </label>
                                            <label class="uniform">
                                                <input disabled class="uniform_on" type="checkbox" id="optionsCheckbox3" value="option1"
                                                    checked>Chỉnh
                                                sửa
                                            </label>
                                            <label class="uniform">
                                                <input disabled class="uniform_on" type="checkbox" id="optionsCheckbox4" value="option1">Xóa
                                                <br>
                                            </label>
                                            <label class="uniform">
                                                <input disabled class="uniform_on" type="checkbox" id="optionsCheckbox5" value="option1">Phân
                                                quyền
                                            </label>
                                        </div>
                                        <div style="text-align: center">
                                            <button type="button" class="btn btn-success btn-large">Quay về trang chủ</button>
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
    <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
    <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
    <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

    <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

    <script src="vendors/jquery-1.9.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/jquery.uniform.min.js"></script>
    <script src="vendors/chosen.jquery.min.js"></script>
    <script src="vendors/bootstrap-datepicker.js"></script>

    <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
    <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

    <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

    <script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="assets/form-validation.js"></script>

    <script src="assets/scripts.js"></script>
    <script>

        jQuery(document).ready(function () {
            FormValidation.init();
        });


        $(function () {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({
                onTabShow: function (tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index + 1;
                    var $percent = ($current / $total) * 100;
                    $('#rootwizard').find('.bar').css({ width: $percent + '%' });
                    // If it's the last tab then hide the last button and show the finish instead
                    if ($current >= $total) {
                        $('#rootwizard').find('.pager .next').hide();
                        $('#rootwizard').find('.pager .finish').show();
                        $('#rootwizard').find('.pager .finish').removeClass('disabled');
                    } else {
                        $('#rootwizard').find('.pager .next').show();
                        $('#rootwizard').find('.pager .finish').hide();
                    }
                }
            });
            $('#rootwizard .finish').click(function () {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
        });
    </script>

</body>

</html>