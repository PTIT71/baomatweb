package banhaisan.controllers.nguoidungadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.NguoiDungAdminService;
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

@WebServlet(name = "SuaNguoiDungAdminServlet",urlPatterns = "/Admin/ChinhSuaAdmin")
public class SuaNguoiDungAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        NguoiDung nguoiDung= new NguoiDung();
        nguoiDung.setMaNguoiDung(request.getParameter("txtMaNguoiDung"));
        nguoiDung.setHoTen(request.getParameter("txt-ten"));
        nguoiDung.setGioiTinh(request.getParameter("txt-gioi-tinh").trim().equals("1"));
        nguoiDung.setEmail(request.getParameter("txt-email"));
        nguoiDung.setSdt(request.getParameter("txt-dien-thoai"));
        nguoiDung.setDiaChi(request.getParameter("txt-dia-chi"));
        Date ngaySinh = null;
        if (request.getParameter("dt-ngay-sinh") != null) {
            try {
                ngaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dt-ngay-sinh"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        nguoiDung.setNgaySinh(new java.sql.Date(ngaySinh.getTime()));
        nguoiDung.setMatKhau(request.getParameter("txt-mat-khau"));

        NguoiDungAdminService nguoiDungAdmins= new NguoiDungAdminService();
        try {
            nguoiDungAdmins.modify(nguoiDung);
            nguoiDungAdmins.DoiMatKhau(nguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/NguoiDungAdmin");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idNguoiDung = request.getParameter("id");
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }

        NguoiDungAdminService nguoiDungAdmins= new NguoiDungAdminService();
        NguoiDung nd=null;
        ArrayList<DanhMuc> danhMucs = null;
        try {
            nd = nguoiDungAdmins.get(idNguoiDung);
            danhMucs = DanhMucService.getInstance().getData();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(nd == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("nguoiDung", nd);
        request.setAttribute("danhMucs",danhMucs);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChinhSuaAdmin.jsp");
        dispatcher.forward(request, response);
    }
}
