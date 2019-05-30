<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quyền</title>
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
            <a class="brand" href="index.html">TieuDanSeaFood</a>
            <div class="nav-collapse collapse">
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> Tan Nguyen <i class="caret"></i>

                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a tabindex="-1" href="ThongTinCaNhan.jsp">Thông tin cá nhân</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a tabindex="-1" href="login.jsp">Đăng xuất</a>
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
    <div class="container">
        <div class="row-fluid">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header" style="text-align:center">
                    <div class="muted pull-left">QUẢN LÍ QUYỀN</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <div class="table-toolbar">
                            <div>
                                <div style="float:left;">
                                    <a href="/Admin/TMQuyen">
                                        <button class="btn btn-success">Thêm mới <i class="icon-plus icon-white"></i>
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                               id="example2">
                            <thead>
                            <tr>
                                <th >Mã quyền</th>
                                <th>Tên quyền</th>
                                <th>Tên nghiệp vụ</th>
                                <th width="70">Chỉnh sửa</th>
                                <th width="85">Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="quyen" items="${requestScope.quyens}">
                                <tr class="odd gradeX">
                                    <td>${quyen.maQuyen}</td>
                                    <td>${quyen.tenQuyen} </td>
                                    <td>${quyen.tenNghiepVu} </td>
                                    <td>
                                        <a href="/Admin/ChinhSuaQuyen?id=${quyen.maQuyen} " class="btn btn-primary"><i
                                                class="icon-pencil icon-white"></i>
                                            Edit</a>
                                    </td>
                                    <td>
                                        <a href="/Admin/XoaQuyen?id=${quyen.maQuyen}" class="btn btn-danger"><i class="icon-remove icon-white"></i>
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="dataTables_paginate paging_bootstrap pagination" style="text-align:center">
                            <ul>
                                <li class="prev"><a href="#">← Previous</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li class="next"><a href="#">Next → </a></li>
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