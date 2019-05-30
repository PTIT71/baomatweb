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

@WebServlet(name = "ThemDanhMucServlet",urlPatterns = "/Admin/THMDanhMuc")
public class ThemDanhMucServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            DanhMuc danhMuc = new DanhMuc();
            danhMuc.setMaDanhmuc(request.getParameter("txtMaDanhMuc"));
            danhMuc.setTenDanhmuc(request.getParameter("txtTenDanhMuc"));

            DanhMucService.getInstance().add(danhMuc);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/QLDanhMuc");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/TMDanhMuc.jsp");
        dispatcher.forward(request,response);
    }
}
