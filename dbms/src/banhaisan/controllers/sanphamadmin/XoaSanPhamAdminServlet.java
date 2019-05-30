package banhaisan.controllers.sanphamadmin;

import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XoaSanPhamAdminServlet",urlPatterns = {"/Admin/XoaSanPham"})
public class XoaSanPhamAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            SanPham sanPham = new SanPham();
            sanPham.setMaSP(request.getParameter("idSP"));

            SanPhamService.getInstance().delete(sanPham);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        HttpSession session = request.getSession(false);
        response.sendRedirect("/Admin/QLSanPham?idDM="+session.getAttribute("maDanhMuc"));
    }
}
