package banhaisan.controllers.Webpages;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.HinhAnhService;
import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.BaiViet;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.HinhAnh;
import banhaisan.models.datamodels.SanPham;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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

@WebServlet(name = "TrangChuServlet",urlPatterns = {"/Index"})
public class TrangChuServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        session.removeAttribute("username");
//        response.sendRedirect(request.getContextPath());
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<SanPham> sanPhamCa = null;
        ArrayList<SanPham> sanPhamTom =null;
        ArrayList<SanPham> sanPhamMuc = null;
        ArrayList<SanPham> sanPhamCua = null;
        ArrayList<SanPham> sanPhamNgaoSoOc = null;
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            ArrayList<BaiViet> baiViets = BaiVietService.getInstance().getTop4BaiViet();
            ArrayList<BaiViet> baiVietNoiBat = BaiVietService.getInstance().getTop4BaiViet();
            HttpSession session= request.getSession();
            session.setAttribute("danhMucs",danhMucs);
            session.setAttribute("baiVietNoiBat",baiVietNoiBat);
            request.setAttribute("baiViets",baiViets);

            sanPhamCa = SanPhamService.getInstance().getDataCategoryIndex(danhMucs.get(0).getMaDanhmuc());
            sanPhamCua = SanPhamService.getInstance().getDataCategoryIndex(danhMucs.get(1).getMaDanhmuc());
            sanPhamMuc= SanPhamService.getInstance().getDataCategoryIndex(danhMucs.get(2).getMaDanhmuc());
            sanPhamNgaoSoOc= SanPhamService.getInstance().getDataCategoryIndex(danhMucs.get(3).getMaDanhmuc());
            sanPhamTom= SanPhamService.getInstance().getDataCategoryIndex(danhMucs.get(4).getMaDanhmuc());

        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(sanPhamCa==null | sanPhamCua ==null | sanPhamMuc == null | sanPhamNgaoSoOc == null | sanPhamTom == null)
        {
            response.setStatus(400);
            return;
        }

        request.setAttribute("sanPhamCa",sanPhamCa);
        request.setAttribute("sanPhamTom",sanPhamTom);
        request.setAttribute("sanPhamCua",sanPhamCua);
        request.setAttribute("sanPhamMuc",sanPhamMuc);
        request.setAttribute("sanPhamNgaoSoOc",sanPhamNgaoSoOc);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index-Login.jsp");
        dispatcher.forward(request,response);
    }
}
