package banhaisan.controllers.donhang;

import banhaisan.models.datahandle.DonHangService;
import banhaisan.models.datamodels.DonHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XoaDonHangServlet",urlPatterns = {"/Admin/XoaDonHang"})
public class XoaDonHangServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DonHang donHang = new DonHang();
            donHang.setMaDonHang(request.getParameter("idDH"));

            DonHangService.getInstance().delete(donHang);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/QLHonHang");
    }
}
