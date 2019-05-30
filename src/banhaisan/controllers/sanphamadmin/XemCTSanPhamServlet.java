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
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "XemCTSanPhamServlet", urlPatterns = "/Admin/CTSanPham")
public class XemCTSanPhamServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSanPham = request.getParameter("idSP");
        if(idSanPham==null)
        {
            response.setStatus(400);
            return;
        }
        SanPham sp = null;
        try {
            sp=SanPhamService.getInstance().get(idSanPham);
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(sp==null)
        {
            response.setStatus(400);
            return;
        }
        request.setAttribute("sanPham",sp);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChiTietSanPham.jsp");
        dispatcher.forward(request,response);
    }
}
