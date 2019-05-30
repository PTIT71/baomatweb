package banhaisan.controllers.nguoidungadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.NguoiDungAdminService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.NguoiDung;

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

@WebServlet(name = "XemAdminServlet", urlPatterns = { "/Admin/ChiTietAdmin" })
public class XemAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String manguoiDung = request.getParameter("id");
            if (manguoiDung == null) {
                response.setStatus(400);
                return;
            }
            manguoiDung = manguoiDung.trim();
            NguoiDungAdminService service = new NguoiDungAdminService();
            NguoiDung admin = service.get(manguoiDung);
            request.setAttribute("admin", admin);
            ArrayList<DanhMuc> danhMucs= DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChiTietAdmin.jsp");
        dispatcher.forward(request, response);
    }
}