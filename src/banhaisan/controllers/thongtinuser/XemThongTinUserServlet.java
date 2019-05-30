package banhaisan.controllers.thongtinuser;

import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.NguoiDung;
import javafx.scene.input.DataFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "XemThongTinUserServlet",urlPatterns = "/Profile")
public class XemThongTinUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String idNguoiDung = session.getAttribute("idcurrentSession").toString();
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }
        NguoiDung nd = null;
        try {
            nd= NguoiDungThongThuongService.getInstance().get(idNguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(nd == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("nguoiDung", nd);


        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Profile.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        NguoiDung nguoiDung= new NguoiDung();
        nguoiDung.setMaNguoiDung(request.getParameter("txtMaNguoiDung"));
        nguoiDung.setHoTen(request.getParameter("txt-hoten"));
        nguoiDung.setGioiTinh(request.getParameter("gender").trim().equals("1"));
        nguoiDung.setEmail(request.getParameter("txt-email"));
        nguoiDung.setSdt(request.getParameter("txt-phone"));
        nguoiDung.setDiaChi(request.getParameter("txt-dia-chi"));
        java.util.Date ngaySinh = null;
        if (request.getParameter("customer_birthdate") != null) {
            try {
                ngaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("customer_birthdate"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        nguoiDung.setNgaySinh(new java.sql.Date(ngaySinh.getTime()));
        nguoiDung.setMatKhau(request.getParameter("txt-mat-khau"));

        try {
            NguoiDungThongThuongService.getInstance().modify(nguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/Profile");
    }
}
