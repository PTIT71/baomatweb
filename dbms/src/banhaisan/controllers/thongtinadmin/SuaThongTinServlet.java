package banhaisan.controllers.thongtinadmin;

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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "SuaThongTinServlet" ,urlPatterns = {"/Admin/EditProfile"})
public class SuaThongTinServlet extends HttpServlet {
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
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/Profile");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String idNguoiDung = session.getAttribute("idcurrentSession").toString();
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }
        NguoiDung admin = null;
        NguoiDungAdminService service = new NguoiDungAdminService();
        try {
            admin= service.get(idNguoiDung);
            ArrayList<DanhMuc> danhMucs= DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(admin == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("admin", admin);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChinhSuaThongTinCaNhan.jsp");
        dispatcher.forward(request, response);
    }
}
