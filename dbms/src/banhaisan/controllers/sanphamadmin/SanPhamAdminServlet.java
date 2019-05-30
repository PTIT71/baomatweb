package banhaisan.controllers.sanphamadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.SanPham;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SanPhamAdminServlet", urlPatterns = {"/Admin/QLSanPham"})
public class SanPhamAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idDanhMuc = request.getParameter("idDM");
        String page = request.getParameter("page");

        int ipage = 1;
        if(page != null)
             ipage=Integer.parseInt(page);
        if(idDanhMuc==null)
        {
            response.setStatus(400);
            return;
        }
        //ArrayList<SanPham> sanPhams = null;
        List<SanPham> sanPhams = null;
        try {
            //sanPhams = SanPhamService.getInstance().getDataCategory(idDanhMuc);
            sanPhams = SanPhamService.getInstance().getSanPham((ipage-1)*10, idDanhMuc);
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
            int numRecord = SanPhamService.getInstance().getNumOfRecord(idDanhMuc);
            request.setAttribute("numOfRecord",numRecord);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(sanPhams==null)
        {
            response.setStatus(400);
            return;
        }
        request.setAttribute("sanPhams",sanPhams);
        HttpSession session = request.getSession();
        session.setAttribute("maDanhMuc",idDanhMuc);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/QLySanPham.jsp?idDM=" + idDanhMuc + "&page=" + ipage);
        dispatcher.forward(request,response);
    }
}
