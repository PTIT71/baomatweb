package banhaisan.controllers.sanphamnguoidung;

import banhaisan.models.datahandle.*;
import banhaisan.models.datamodels.*;

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

@WebServlet(name = "XemCTSanPhamUserServlet",urlPatterns = {"/CTSanPham"})
public class XemCTSanPhamUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        DanhGia danhGia = new DanhGia();
        danhGia.setDanhGia(Integer.parseInt(request.getParameter("stars")));
        danhGia.setBinhLuan(request.getParameter("txtBinhLuan"));
        danhGia.setMaSP(request.getParameter("idSP"));
        danhGia.setMaNguoiDung(session.getAttribute("idcurrentSession").toString());

        try {
            DanhGiaService.getInstance().add(danhGia);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect(getServletContext().getContextPath());
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
            sp= SanPhamService.getInstance().get(idSanPham);
            ArrayList<HinhAnh> hinhAnhsSP = HinhAnhService.getInstance().LayTatCaHinhAnhSanPham(idSanPham);
            ArrayList<SanPham> sanPhamLQ = SanPhamService.getInstance().getDataCategoryIndex(sp.getMaDanhMuc());
            ArrayList<DanhGia> danhGias = DanhGiaService.getInstance().LayDanhSachBinhLuanSP(sp);
            request.setAttribute("sanPhamLQ",sanPhamLQ);
            request.setAttribute("danhGias",danhGias);
            request.setAttribute("hinhAnhSP",hinhAnhsSP);
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

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ChiTietSP.jsp");
        dispatcher.forward(request,response);
    }
}
