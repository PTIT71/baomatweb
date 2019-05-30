package banhaisan.controllers.congthucchebien;

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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

@WebServlet(name = "XemCTBaiVietServlet",urlPatterns = {"/XemCTBaiViet"})
public class XemCTBaiVietServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idBaiViet = request.getParameter("idBV");
        if(idBaiViet ==null)
        {
            response.setStatus(400);
            return;
        }
        BaiViet bv = null;
        try {
            bv = BaiVietService.getInstance().get(idBaiViet);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(bv==null)
        {
            response.setStatus(400);
            return;
        }

        Random randomGenerator = new Random();
        ArrayList<BaiViet> randomBV = (ArrayList<BaiViet>)session.getAttribute("baiVietNoiBat");
        int index = randomGenerator.nextInt(randomBV.size());
        request.setAttribute("randomBaiViet", randomBV.get(index).getMaBaiViet());
        request.setAttribute("baiViet",bv);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/congthucchebien.jsp");
        dispatcher.forward(request,response);
    }
}
