package banhaisan.controllers.danhmucadmin;

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

@WebServlet(name = "DanhMucServlet",urlPatterns = "/Admin/QLDanhMuc")
public class DanhMucServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();

            request.setAttribute("danhMucs",danhMucs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/QLyDanhMuc.jsp");
        dispatcher.forward(request,response);
    }
}
