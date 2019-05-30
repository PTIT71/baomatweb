package banhaisan.controllers.thongtinuser;

import banhaisan.models.datahandle.DonHangService;
import banhaisan.models.datamodels.DonHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "QuanLyDonHangServlet",urlPatterns = {"/QuanLyDonHangCaNhan"})
public class QuanLyDonHangServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String idNguoiDung = session.getAttribute("idcurrentSession").toString();
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }
        ArrayList<DonHang> dh = null;
        try {
            dh = DonHangService.getInstance().LayDanhSachDonHangCaNhan(idNguoiDung);
            request.setAttribute("DonHangCaNhan",dh);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(dh.size()==0){
            String message = "Bạn chưa có đơn hàng nào cả!!";
            request.setAttribute("message",message);
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Profile_BillManagement.jsp");
        dispatcher.forward(request,response);
    }
}
