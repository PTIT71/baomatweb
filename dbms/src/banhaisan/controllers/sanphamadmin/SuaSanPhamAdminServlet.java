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

@WebServlet(name = "SuaSanPhamAdminServlet",urlPatterns = {"/Admin/ChinhSuaSanPham"})
public class SuaSanPhamAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try{
            SanPham sanPham = new SanPham();
            sanPham.setMaSP(request.getParameter("txtMaSP"));
            sanPham.setTenSP(request.getParameter("txtTenSP"));
            sanPham.setGiaSP(Double.parseDouble(request.getParameter("txtGiaSP")));
            sanPham.setPhanTramKhuyenMai(Float.parseFloat(request.getParameter("txtPhanTramKhuyenMai")));
            sanPham.setXuatXu(request.getParameter("txtXuatXu"));
            sanPham.setMoTa(request.getParameter("txtMoTa"));
            sanPham.setMaDanhMuc(request.getParameter("txtMaDanhMuc"));

            SanPhamService.getInstance().modify(sanPham);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        HttpSession session = request.getSession(false);
        response.sendRedirect("/Admin/QLSanPham?idDM="+session.getAttribute("maDanhMuc"));
    }

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

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChinhSuaSanPham.jsp");
        dispatcher.forward(request,response);
    }
}
