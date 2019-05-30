package banhaisan.controllers.dangkythanhvien;

import banhaisan.models.datahandle.NguoiDungAdminService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "DangKyThanhVienServlet", urlPatterns = {"/DangKyThanhVien"})
public class DangKyThanhVienServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        NguoiDung nguoiDung= new NguoiDung();
        nguoiDung.setHoTen(request.getParameter("txt-ten"));
        nguoiDung.setGioiTinh(request.getParameter("txt-gioi-tinh").trim().equals("1"));
        nguoiDung.setEmail(request.getParameter("txt-email"));
        nguoiDung.setSdt(request.getParameter("txt-dien-thoai"));
        nguoiDung.setDiaChi(request.getParameter("txt-dia-chi"));
        java.util.Date ngaySinh = null;
        if (request.getParameter("dt-ngay-sinh") != null) {
            try {
                ngaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dt-ngay-sinh"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        nguoiDung.setNgaySinh(new java.sql.Date(ngaySinh.getTime()));
        nguoiDung.setMatKhau(request.getParameter("txt-mat-khau"));

        NguoiDung nd=null;
        try {
            NguoiDungThongThuongService.getInstance().add(nguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            HttpSession error = request.getSession();
            error.setAttribute("error", e.toString());
            e.printStackTrace();
        }
        response.sendRedirect("/Index");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DangKi.jsp");
        dispatcher.forward(request,response);
    }
}
