package banhaisan.controllers.Webpages;

import banhaisan.models.datahandle.DonHangService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.DonHang;
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
import java.util.List;

@WebServlet(name = "ThanhToanServlet",urlPatterns = {"/ThanhToanDonHang"})
public class ThanhToanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("idcurrentSession") != null) {
            String ghiChu = session.getAttribute("deliverynote").toString();
            Double TongTien = Double.parseDouble(request.getParameter("txtTongTien"));
            if (TongTien < 500000)
                TongTien += 50000;
            DonHang donHang = new DonHang();
            donHang.setDiaChiGiaoHang(request.getParameter("billing_address"));
            donHang.setGhiChu(ghiChu);
            donHang.setHinhThucThanhToan(request.getParameter("payment_method_id").trim().equals("1"));
            donHang.setMaNguoiDung(session.getAttribute("idcurrentSession").toString());
            donHang.setTongTien(TongTien);
            try {
                DonHangService.getInstance().add(donHang);
                List<SanPham_GioHang> cart = (List<SanPham_GioHang>) session.getAttribute("cart");
                for (int i = 0; i < cart.size(); i++) {
                    DonHangService.getInstance().addCTDonHang(cart.get(i));
                }
                session.removeAttribute("cart");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/HoaDon");
        }
        else{
            response.sendRedirect("/ShoppingCart?action=checkout");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("idcurrentSession") != null) {
            String idNguoiDung = session.getAttribute("idcurrentSession").toString();
            NguoiDung nd = null;
            try {
                nd = NguoiDungThongThuongService.getInstance().get(idNguoiDung);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            if (nd == null) {
                response.setStatus(400);
                return;
            }
            request.setAttribute("nguoiDung", nd);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Thanhtoandonhang.jsp");
            dispatcher.forward(request,response);
        }else {
            response.sendRedirect("/ShoppingCart?action=checkout");
        }
    }
}
