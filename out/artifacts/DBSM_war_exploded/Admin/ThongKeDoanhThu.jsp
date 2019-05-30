<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
              pageEncoding="utf-8"%> -->
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="banhaisan.models.datahandle.ThongKeService"%>
<%
    Map<String, Integer> mapDT = ThongKeService.getInstance().getDoanhThu();


    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

    for(Map.Entry m : mapDT.entrySet()){
        map = new HashMap<Object,Object>(); map.put("label", "Tháng " + m.getKey()); map.put("y", m.getValue()); list.add(map);
    }

    String dataPoints = gsonObj.toJson(list);
%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thống kê doanh thu</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>


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
    <script type="text/javascript">
        window.onload = function() {

            var chart = new CanvasJS.Chart("chartContainer", {
                title: {
                    text: ""
                },
                axisX: {
                    title: "Biểu đồ thể hiện doanh thu trong năm nay"
                },
                axisY: {
                    title: ""
                },
                data: [{
                    type: "column",
                    yValueFormatString: ",##0.0# vnd",
                    dataPoints: <%out.print(dataPoints);%>
                }]
            });
            chart.render();

        }
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
                    <div class="muted pull-left">Thống kê doanh thu</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <div id="chartContainer" style="height: 370px; width: 100%;"></div>

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

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>

</html>