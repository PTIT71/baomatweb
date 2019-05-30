package banhaisan.controllers.Webpages;

import banhaisan.models.datahandle.LienHeService;
import banhaisan.models.datamodels.LienHe;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LienHeServlet",urlPatterns = {"/LienHe"})
public class LienHeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LienHe.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        LienHe lienHe = new LienHe();
        lienHe.setTenNguoiDung(request.getParameter("name"));
        lienHe.setEmail(request.getParameter("email"));
        lienHe.setSdt(request.getParameter("phone"));
        lienHe.setNoiDung(request.getParameter("message"));

        try {
            LienHeService.getInstance().add(lienHe);
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LienHe.jsp");
        dispatcher.forward(request,response);
    }
}
