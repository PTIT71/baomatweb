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
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "NguoiDungAdminServlet", urlPatterns = { "/Admin/NguoiDungAdmin" })
public class NguoiDungAdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        int ipage = 1;
        if(page != null)
            ipage=Integer.parseInt(page);
        try {
            NguoiDungAdminService service= new NguoiDungAdminService();
            //ArrayList<NguoiDung> nguoiDungs= service.getData();
            List<NguoiDung> nguoiDungs= service.getNguoiDungAdmin((ipage-1)*10);
            int numRecord = service.getNumOfRecord();
            request.setAttribute("numOfRecord",numRecord);

            request.setAttribute("nguoiDungs" , nguoiDungs);

            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);

        } catch (SQLException | ClassNotFoundException e){

            e.printStackTrace();
        }

        RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Admin/QlyAdmin.jsp?page=" + ipage);
        dispatcher.forward(request,response);
    }
}
