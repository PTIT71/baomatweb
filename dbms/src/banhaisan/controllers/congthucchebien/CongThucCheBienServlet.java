package banhaisan.controllers.congthucchebien;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datamodels.BaiViet;

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


@WebServlet(name = "CongThucCheBienServlet",urlPatterns = {"/DSBaiViet"})
public class CongThucCheBienServlet extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      try {
          ArrayList<BaiViet> baiViets = BaiVietService.getInstance().getData();
          request.setAttribute("baiViets",baiViets);

      }catch (SQLException | ClassNotFoundException e)
      {
          e.printStackTrace();
      }
      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DSCongthucchebien.jsp");
      dispatcher.forward(request,response);
    }
}
