package banhaisan.controllers.KiemTraDangNhap;

import banhaisan.models.datahandle.DangNhapService;
import sun.plugin.com.Dispatcher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DangXuatServlet",urlPatterns = "/Logout")
public class DangXuatServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getHeader("referer");
        HttpSession session = request.getSession();
        session.removeAttribute("idcurrentSession");
        session.removeAttribute("currentSessionUser");
        try {
            DangNhapService.getInstance().LoginDB("sa","12345","localhost");
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+url);
    }
}
