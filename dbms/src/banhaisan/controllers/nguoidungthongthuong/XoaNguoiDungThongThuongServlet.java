package banhaisan.controllers.nguoidungthongthuong;

import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XoaNguoiDungThongThuongServlet", urlPatterns = {"/Admin/XoaNguoiDung"})
public class XoaNguoiDungThongThuongServlet extends HttpServlet {
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
        try {
            NguoiDungThongThuongService.getInstance().delete(nd);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            mes += " " + e.toString();
        }
        HttpSession session = request.getSession();
        session.setAttribute("debug", mes);
        response.sendRedirect("/Admin/NguoiDungThongThuong");
    }

}
