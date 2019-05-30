package banhaisan.controllers.nguoidungadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.NguoiDungAdminService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
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
import java.util.ArrayList;

@WebServlet(name = "XoaAdminServlet" , urlPatterns = {"/Admin/XoaAdmin"})
public class XoaAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idNguoiDung = request.getParameter("txtMaNguoiDung").trim();
        String mes = "";
        if (idNguoiDung.isEmpty()) {
            response.setStatus(400);
            return;
        }
        NguoiDung nd = new NguoiDung();
        nd.setMaNguoiDung(idNguoiDung);
        mes += idNguoiDung;
        NguoiDungAdminService adminService = new NguoiDungAdminService();
        try {
            adminService.delete(nd);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            mes += " " + e.toString();
        }
        HttpSession session = request.getSession();
        session.setAttribute("debug", mes);
        response.sendRedirect("/Admin/NguoiDungAdmin");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<DanhMuc> danhMucs = null;
        try {
            danhMucs = DanhMucService.getInstance().getData();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("danhMucs",danhMucs);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/QlyAdmin.jsp");
        dispatcher.forward(request,response);
    }
}
