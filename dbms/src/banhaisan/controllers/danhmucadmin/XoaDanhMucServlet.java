package banhaisan.controllers.danhmucadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datamodels.DanhMuc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "XoaDanhMucServlet",urlPatterns = "/Admin/XoaDanhMuc")
public class XoaDanhMucServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DanhMuc danhMuc = new DanhMuc();
            danhMuc.setMaDanhmuc(request.getParameter("idDM"));

            DanhMucService.getInstance().delete(danhMuc);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/QLDanhMuc");
    }
}
