package banhaisan.controllers.nguoidungthongthuong;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.NguoiDung;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "XemNguoiDungThongThuongServlet", urlPatterns = {"/Admin/ChiTietNguoiDung"})
public class XemNguoiDungThongThuongServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idNguoiDung = request.getParameter("id");
        if(idNguoiDung == null){
            response.setStatus(400);
            return;
        }
        ArrayList<DanhMuc> danhMucs = null;
        NguoiDung nd = null;
        try {
            danhMucs = DanhMucService.getInstance().getData();
            nd = NguoiDungThongThuongService.getInstance().get(idNguoiDung);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(nd == null){
            response.setStatus(400);
            return;
        }
        request.setAttribute("nguoiDung", nd);
        request.setAttribute("danhMucs",danhMucs);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChiTietNguoiDung.jsp");
        dispatcher.forward(request, response);
    }
}
