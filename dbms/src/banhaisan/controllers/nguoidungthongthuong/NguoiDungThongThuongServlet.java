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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "NguoiDungThongThuongServlet", urlPatterns = { "/Admin/NguoiDungThongThuong" })
public class NguoiDungThongThuongServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        int ipage = 1;
        if(page != null)
            ipage=Integer.parseInt(page);
        try {
            //ArrayList<NguoiDung> nguoiDungs= NguoiDungThongThuongService.getInstance().getData();
            List<NguoiDung> nguoiDungs= NguoiDungThongThuongService.getInstance().getData();

            request.setAttribute("nguoiDungs" , nguoiDungs);

            int numRecord = NguoiDungThongThuongService.getInstance().getNumOfRecord();
            request.setAttribute("numOfRecord",numRecord);

            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);

        } catch (SQLException | ClassNotFoundException e){

            e.printStackTrace();
        }

        RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Admin/QlyNguoiDungThongThuong.jsp?page=" + ipage);
        dispatcher.forward(request,response);
    }
}

