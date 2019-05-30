package banhaisan.controllers.nguoidungthongthuong;

import banhaisan.models.datahandle.NguoiDungThongThuongService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "KichHoatServlet",urlPatterns = "/Admin/KichHoat")
public class KichHoatServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idNguoiDung = request.getParameter("txtMaNguoiDung").trim();
        Boolean check = Boolean.parseBoolean(request.getParameter("check"));
        if (idNguoiDung.isEmpty()) {
            response.setStatus(400);
            return;
        }
        try {
            NguoiDungThongThuongService.getInstance().KichHoat(idNguoiDung,check);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
