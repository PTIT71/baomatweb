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

@WebServlet(name = "ChinhSuaDanhMucServlet",urlPatterns = {"/Admin/ChinhSuaDanhMuc"})
public class ChinhSuaDanhMucServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            DanhMuc danhMuc = new DanhMuc();
            danhMuc.setMaDanhmuc(request.getParameter("txtMaDanhMuc"));
            danhMuc.setTenDanhmuc(request.getParameter("txtTenDanhMuc"));

            DanhMucService.getInstance().modify(danhMuc);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect("/Admin/QLDanhMuc");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idDanhMuc = request.getParameter("idDM");
        if(idDanhMuc==null)
        {
            response.setStatus(400);
            return;
        }
        DanhMuc dm = null;
        ArrayList<DanhMuc> danhMucs = null;
        try {
            danhMucs = DanhMucService.getInstance().getData();
            dm = DanhMucService.getInstance().get(idDanhMuc);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if (dm==null)
        {
            response.setStatus(400);
            return;
        }
        request.setAttribute("danhMuc",dm);
        request.setAttribute("danhMucs",danhMucs);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChinhSuaDanhMuc.jsp");
        dispatcher.forward(request,response);
    }
}
