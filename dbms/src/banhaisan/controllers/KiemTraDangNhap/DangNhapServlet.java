package banhaisan.controllers.KiemTraDangNhap;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.DangNhapService;
import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "DangNhapServlet", urlPatterns = "/Login")
public class DangNhapServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String backrefresh = request.getHeader("referer");
        response.setContentType("text/html;charset=utf-8");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        try {
            DangNhap_KetNoi user = new DangNhap_KetNoi();
            user.setEmail(request.getParameter("email"));
            user.setPassWord(request.getParameter("password"));
            user.setIpAddress(request.getParameter("ipaddress"));
            DangNhapService.getInstance().IsLogin(user);

            if(user.isValid())
            {
                DangNhapService.getInstance().LoginDB(user.getEmail(),request.getParameter("password"),user.getIpAddress());
                if(user.isAdmin())
                {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentSessionAdmin",user);
                    session.setAttribute("idcurrentSession",user.getMaNguoiDung());
                    request.setAttribute("loginResult",true);
                    response.sendRedirect("/Admin/TrangChuAdmin");
                }
                else
                {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentSessionUser",user);
                    session.setAttribute("idcurrentSession",user.getMaNguoiDung());
                    request.setAttribute("loginResult",true);
                    response.sendRedirect(request.getContextPath()+backrefresh);
                }
            }
            else {
                DangNhapService.getInstance().LoginDB("sa","12345","localhost");
                response.sendError(400);
                return;
            }
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
            response.sendError(500);
           // return;
        }
    }
}