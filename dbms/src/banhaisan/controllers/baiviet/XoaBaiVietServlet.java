package banhaisan.controllers.baiviet;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.BaiViet;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XoaBaiVietServlet" , urlPatterns = "/Admin/XoaBaiViet")
public class XoaBaiVietServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idBaiViet = request.getParameter("txtMaBaiViet").trim();
        String mes = "";
        if (idBaiViet.isEmpty()) {
            response.setStatus(400);
            return;
        }
        BaiViet baiViet = new BaiViet();
        baiViet.setMaBaiViet(idBaiViet);
        mes += idBaiViet;
        try {
            BaiVietService.getInstance().delete(baiViet);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            mes += " " + e.toString();
        }
        HttpSession session = request.getSession();
        session.setAttribute("debug", mes);
        response.sendRedirect("/Admin/QlyBaiViet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
