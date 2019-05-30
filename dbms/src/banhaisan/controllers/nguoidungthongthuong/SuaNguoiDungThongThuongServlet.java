package banhaisan.controllers.nguoidungthongthuong;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "SuaNguoiDungThongThuongServlet",urlPatterns = { "/Admin/ChinhSuaNguoiDung" })
public class SuaNguoiDungThongThuongServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        NguoiDung nguoiDung= new NguoiDung();
        nguoiDung.setMaNguoiDung(request.getParameter("txtMaNguoiDung").trim());
        nguoiDung.setHoTen(request.getParameter("txt-ten").substring(0,request.getParameter("txt-ten").length()-1));
        nguoiDung.setGioiTinh(request.getParameter("txt-gioi-tinh").trim().equals("1"));
        nguoiDung.setEmail(request.getParameter("txt-email").substring(0,request.getParameter("txt-email").length()-1));
        nguoiDung.setSdt(request.getParameter("txt-dien-thoai").trim());
        nguoiDung.setDiaChi(request.getParameter("txt-dia-chi").trim());
        Date ngaySinh = null;
        if (request.getParameter("dt-ngay-sinh") != null) {
            try {
                ngaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dt-ngay-sinh"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        nguoiDung.setNgaySinh(new java.sql.Date(ngaySinh.getTime()));
        nguoiDung.setMatKhau(request.getParameter("txt-mat-khau").substring(0,request.getParameter("txt-mat-khau").length()-1));

        try {
            NguoiDungThongThuongService.getInstance().modify(nguoiDung);
            NguoiDungThongThuongService.getInstance().DoiMatKhau(nguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/NguoiDungThongThuong");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idNguoiDung = request.getParameter("id");
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }

        NguoiDung nd = null;
        ArrayList<DanhMuc> danhMucs = null;
        try {
            nd = NguoiDungThongThuongService.getInstance().get(idNguoiDung);
            danhMucs = DanhMucService.getInstance().getData();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(nd == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("danhMucs",danhMucs);
        request.setAttribute("nguoiDung", nd);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChinhSuaNguoiDung.jsp");
        dispatcher.forward(request, response);
    }
}
