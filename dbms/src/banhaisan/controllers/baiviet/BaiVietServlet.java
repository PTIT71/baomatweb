package banhaisan.controllers.baiviet;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datamodels.BaiViet;
import banhaisan.models.datamodels.DanhMuc;

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

@WebServlet(name = "BaiVietServlet" , urlPatterns = "/Admin/QlyBaiViet")
public class BaiVietServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        int ipage = 1;
        if(page != null)
            ipage=Integer.parseInt(page);
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);

            //ArrayList<BaiViet> baiViets= BaiVietService.getInstance().getData();
            List<BaiViet> baiViets= BaiVietService.getInstance().getBaiViet((ipage-1)*10);

            request.setAttribute("baiViet", baiViets);

            int numRecord = BaiVietService.getInstance().getNumOfRecord();
            request.setAttribute("numOfRecord",numRecord);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Admin/QlyBaiViet.jsp?page=" + ipage);
        dispatcher.forward(request,response);


    }
}
