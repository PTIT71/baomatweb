package banhaisan.controllers.donhang;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.DonHangService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.DonHang;
import banhaisan.models.datamodels.DonHang_SanPham;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "XemCTDonHangServlet", urlPatterns = "/Admin/XemCTDonHang")
public class XemCTDonHangServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idDonHang = request.getParameter("idDH");
        if(idDonHang == null)
        {
            response.setStatus(400);
            return;
        }
        ArrayList<DonHang_SanPham> dh = null;
        try {
            double tongTien = 0;
            dh= DonHangService.getInstance().getDSDonHang(idDonHang);
            for (DonHang_SanPham item : dh) {
                tongTien += item.getGia();
            }
            request.setAttribute("tongTien", tongTien);

            DonHang donHangs = DonHangService.getInstance().get(idDonHang);
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
            request.setAttribute("donHangs",donHangs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(dh==null)
        {
            response.setStatus(400);
            return;
        }
        request.setAttribute("donHang",dh);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/XemDonHang.jsp");
        dispatcher.forward(request,response);
    }
}
