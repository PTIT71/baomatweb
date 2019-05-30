<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chi tiết bài viết</title>
    <link rel="stylesheet" type="text/css" href="vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="/libraries/ckeditor/ckeditor.js"></script>
    <script src="/libraries/ckfinder/ckfinder.js"></script>
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
                        <div class="muted pull-left">Chi tiết bài viết</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <!-- BEGIN FORM-->
                            <form action="/Admin/XemCTBaiViet" id="form_sample_1" class="form-horizontal" style="width:100%;margin:0 auto;">
                                <div class="control-group">
                                    <label class="control-label">Mã bài viết(bắt buộc)<span class="required">*</span></label>
                                    <div class="controls">
                                        <input disabled id="txt-ma-bai-viet" type="text" name="name" data-required="1" class="span6 m-wrap" style="width:96% !important;" value="${baiViet.maBaiViet}" />
                                        <br><small class="text-danger" id="validate-txt-ma-bai-viet"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Tiêu đề bài viết<span class="required">*</span></label>
                                    <div class="controls">
                                        <input disabled id="txt-tieu-de" name="email" type="text" class="span6 m-wrap" style="width:96% !important;" value="${baiViet.tieuDe}" />
                                        <br><small class="text-danger" id="validate-txt-tieu-de"></small>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Danh mục<span class="required">*</span></label>
                                    <div class="controls">
                                        <select disabled class="span6 m-wrap" id="cb-danh-muc" name="cbdanhmuc" style="width:500px !important;" onchange="run()">
                                            <c:forEach var="danhMuc" items="${requestScope.danhMucs}">
                                                <option href="QLSanPham?idDM=${danhMuc.maDanhmuc}" value="${danhMuc.maDanhmuc}">${danhMuc.tenDanhmuc}</option>
                                            </c:forEach>
                                        </select>
                                        <input id="ma-danh-muc" name="txtMaDanhMuc" value="${sanPham.maDanhMuc}" type="hidden">
                                        <script>function  run() {
                                            document.getElementById("ma-danh-muc").value=document.getElementById("cb-danh-muc").value;
                                        }</script>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Nội dung<span class="required">*</span></label>
                                    <div class="controls" style="margin-top: -25px;">
                                        <div class="block-content collapse in">
                                            <textarea disabled id="editor" placeholder="Enter text ..." style="width:670px;height:500px;">${baiViet.noiDung}</textarea>
                                            <br><small class="text-danger" id="validate-bootstrap-editor"></small>
                                        </div>
                                    </div>
                                </div>
                                <div style="text-align:center;">
                                    <a href="/Admin/QlyBaiViet?page=1" type="button" class="btn btn-success btn-large">Quay về trang chủ</a>
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
    </div>
    <script>
        var editor= CKEDITOR.replace('editor');
        CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/libraries/ckfinder/');
    </script>
    <!--/.fluid-container-->
    <script src="vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

    <script src="vendors/ckeditor/ckeditor.js"></script>
    <script src="vendors/ckeditor/adapters/jquery.js"></script>

    <script type="text/javascript" src="vendors/tinymce/js/tinymce/tinymce.min.js"></script>

    <script src="assets/scripts.js"></script>
    <script>
        $(function () {
            // Bootstrap
            $('#bootstrap-editor').wysihtml5();

            // Ckeditor standard
            $('textarea#ckeditor_standard').ckeditor({
                width: '98%', height: '150px', toolbar: [
                    { name: 'document', items: ['Source', '-', 'NewPage', 'Preview', '-', 'Templates'] },	// Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
                    ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'],			// Defines toolbar group without name.
                    { name: 'basicstyles', items: ['Bold', 'Italic'] }
                ]
            });
            $('textarea#ckeditor_full').ckeditor({ width: '98%', height: '150px' });

        function KiemTraMaBaiViet(){
            let value = $("#txt-ma-bai-viet").val();
            if (value === "") {
             $("#validate-txt-ma-bai-viet").html("Bạn chưa nhập mã bài viết");
                $("#txt-ma-bai-viet").css("border", "solid 1px red");
                return false;
            }
        $("#validate-txt-ma-bai-viet").html("");
        $("#txt-ma-bai-viet").css("border", "solid 1px #ccc");
        return true;
    }
    function kiemTraNoiDung() {
        let value = $("#bootstrap-editor").val();
        if (value === "") {
            $("#validate-bootstrap-editor").html("Bạn chưa nhập nội dung");
            $("#bootstrap-editor").css("border", "solid 1px red");
            return false;
        }
        $("#validate-bootstrap-editor").html("");
        $("#bootstrap-editor").css("border", "solid 1px #ccc");
        return true;
    }
    function kiemTraTieuDe() {
        let value = $("#txt-tieu-de").val();
        if (value === "") {
            $("#validate-txt-tieu-de").html("Bạn chưa nhập tiêu đề");
            $("#txt-tieu-de").css("border", "solid 1px red");
            return false;
        }
        $("#validate-txt-tieu-de").html("");
        $("#txt-tieu-de").css("border", "solid 1px #ccc");
        return true;
    }
    $("#btn-them").click(() => {
        let kq = KiemTraMaBaiViet() & kiemTraTieuDe() & kiemTraNoiDung();
        if (kq === 0) {
            return false;
        }
        return true;
    });
        });

        // Tiny MCE
        tinymce.init({
            selector: "#tinymce_basic",
            plugins: [
                "advlist autolink lists link image charmap print preview anchor",
                "searchreplace visualblocks code fullscreen",
                "insertdatetime media table contextmenu paste"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
        });

        // Tiny MCE
        tinymce.init({
            selector: "#tinymce_full",
            plugins: [
                "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                "searchreplace wordcount visualblocks visualchars code fullscreen",
                "insertdatetime media nonbreaking save table contextmenu directionality",
                "emoticons template paste textcolor"
            ],
            toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
            toolbar2: "print preview media | forecolor backcolor emoticons",
            image_advtab: true,
            templates: [
                { title: 'Test template 1', content: 'Test 1' },
                { title: 'Test template 2', content: 'Test 2' }
            ]
        });

    </script>
</body>

</html>