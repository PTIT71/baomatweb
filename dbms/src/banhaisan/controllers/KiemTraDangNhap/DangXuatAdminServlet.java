package banhaisan.controllers.KiemTraDangNhap;

import banhaisan.models.datahandle.DangNhapService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DangXuatAdminServlet",urlPatterns = {"/LogoutAdmin"})
public class DangXuatAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("idcurrentSession");
        session.removeAttribute("currentSessionUser");
        try {
            DangNhapService.getInstance().LoginDB("sa","12345","localhost");
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect("/Index");
    }
}
