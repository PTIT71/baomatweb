package banhaisan.controllers.Webpages;

import banhaisan.models.datahandle.DonHangService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.DonHang;
import banhaisan.models.datamodels.DonHang_SanPham;
import banhaisan.models.datamodels.NguoiDung;
import banhaisan.models.datamodels.SanPham_GioHang;

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

@WebServlet(name = "HoaDonServlet",urlPatterns = {"/HoaDon"})
public class HoaDonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        try {
            DonHang donHang = DonHangService.getInstance().getDonHangMoiNhat();
            DonHangService.getInstance().delete(donHang);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Hoadon-Abort.jsp");
        dispatcher.forward(request,response);
        session.removeAttribute("donHang");
        session.removeAttribute("sanPhams");
        session.removeAttribute("nguoiDung");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            DonHang donHang = DonHangService.getInstance().getDonHangMoiNhat();
            ArrayList<DonHang_SanPham> sanphams = DonHangService.getInstance().getDSDonHang(donHang.getMaDonHang());

            NguoiDung nguoiDung = NguoiDungThongThuongService.getInstance().get(donHang.getMaNguoiDung());

            session.setAttribute("donHang",donHang);
            session.setAttribute("sanPhamshd",sanphams);
            session.setAttribute("nguoiDung",nguoiDung);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Hoadon.jsp");
        dispatcher.forward(request,response);
    }
}
