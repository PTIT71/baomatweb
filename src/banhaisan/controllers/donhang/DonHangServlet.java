package banhaisan.controllers.donhang;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.DonHangService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.DonHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DonHangServlet", urlPatterns = {"/Admin/QLDonHang"})
public class DonHangServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        int ipage = 1;
        if(page != null)
            ipage=Integer.parseInt(page);
        try{
            //ArrayList<DonHang> donHangs = DonHangService.getInstance().getData();
            List<DonHang> donHangs = DonHangService.getInstance().getDonHang((ipage-1)*10);
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            int numRecord = DonHangService.getInstance().getNumOfRecord();
            request.setAttribute("danhMucs",danhMucs);
            request.setAttribute("donHangs",donHangs);
            request.setAttribute("numOfRecord",numRecord);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher =getServletContext().getRequestDispatcher("/Admin/QlyDonHang.jsp?page=" + ipage);
        dispatcher.forward(request,response);
    }
}
