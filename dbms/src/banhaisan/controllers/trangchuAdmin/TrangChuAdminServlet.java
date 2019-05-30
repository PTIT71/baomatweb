package banhaisan.controllers.trangchuAdmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datamodels.DanhMuc;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "TrangChuAdminServlet",urlPatterns = "/Admin/TrangChuAdmin")
public class TrangChuAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<DanhMuc> danhMucs = null;
        try {
            danhMucs = DanhMucService.getInstance().getData();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("danhMucs",danhMucs);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/index.jsp");
        dispatcher.forward(request,response);
    }
}
