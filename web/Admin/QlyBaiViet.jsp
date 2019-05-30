<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bài Viết</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="/Admin/vendors/jquery-1.9.1.min.js"></script>
    <script src="/Admin/bootstrap/js/bootstrap.min.js"></script>
    <script>
        function confirmDelete(obj) {
            if (confirm("Bạn có chắc chắn muốn xóa bài viết này không?")) {
                $.post("/Admin/XoaBaiViet",{ txtMaBaiViet : $(obj).attr("maBaiViet").trim() }, content => location.href="/Admin/QlyBaiViet");
            }
        }
    </script>
    <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
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
                        <div class="muted pull-left">QUẢN LÍ BÀI VIẾT</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="table-toolbar">
                                <div>
                                    <div style="float:left;">
                                        <a href="/Admin/TMBaiViet"><button class="btn btn-success">Thêm mới <i class="icon-plus icon-white"></i></button></a>
                                    </div>
                                    <div style="float:right;">
                                        <label>Search: <input id="myInput" type="text" aria-controls="example2"></label>
                                    </div>
                                </div>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                                id="example2">
                                <thead>
                                    <tr>
                                        <th>Mã bài viết</th>
                                        <th>Ngày đăng bài</th>
                                        <th>Tiêu đề bài viết</th>
                                        <th width="75">Chi tiết</th>
                                        <th width="70">Chỉnh sửa</th>
                                        <th width="85">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                <c:forEach var="baiViet" items="${requestScope.baiViet}">
                                    <tr class="odd gradeX">
                                        <td>${baiViet.maBaiViet}</td>
                                        <td>${baiViet.ngayDang}</td>
                                        <td>${baiViet.tieuDe}</td>
                                        <td>
                                            <a href="/Admin/XemCTBaiViet?idBV=${baiViet.maBaiViet}" class="btn"><i class="icon-eye-open"></i>
                                                View</a>
                                        </td>
                                        <td>
                                            <a href="/Admin/ChinhSuaBaiViet?idBV=${baiViet.maBaiViet}" class="btn btn-primary"><i class="icon-pencil icon-white"></i>
                                                Edit</a>
                                        </td>
                                        <td>
                                            <button class="btn btn-danger" maBaiViet="${baiViet.maBaiViet}" onclick="confirmDelete(this);"><i
                                                    class="icon-remove icon-white"></i>
                                                Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <fmt:formatNumber var = "totalPage" value = "${requestScope.numOfRecord/10}" minFractionDigits="0" maxFractionDigits="0"/>
                            <c:if test="${(requestScope.numOfRecord mod 10) != 0}">

                                <fmt:formatNumber var = "totalPage" type = "number" value = "${(requestScope.numOfRecord/10 + 1)- ((requestScope.numOfRecord/10 + 1) % 1 == 0 ? 0 : 0.5)}" minFractionDigits="0" maxFractionDigits="0"/>
                            </c:if>
                            <div class="dataTables_paginate paging_bootstrap pagination" style="text-align:center">
                                <ul>
                                    <c:if test="${param.page != 1}">
                                        <li class="prev"><a href="/Admin/QlyBaiViet?page=${param.page - 1}">← Previous</a></li>
                                    </c:if>
                                    <c:forEach var="j" begin="1" end="${totalPage}">
                                        <c:if test="${param.page == j}">
                                            <li class="active"><a href="/Admin/QlyBaiViet?page=${j}">${j}</a></li>
                                        </c:if>
                                        <c:if test="${param.page != j}">
                                            <li><a href="/Admin/QlyBaiViet?page=${j}">${j}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${param.page < totalPage}">
                                        <li class="next"><a href="/Admin/QlyBaiViet?page=${param.page + 1}">Next → </a></li>
                                    </c:if>
                                </ul>
                            </div>
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


</body>

</html>