package banhaisan.controllers.Webpages;

import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.SanPham;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShoppingCartServlet",urlPatterns = {"/ShoppingCart"})
public class ShoppingCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String ghiChu = request.getParameter("note");
        HttpSession session = request.getSession();
        session.setAttribute("deliverynote",ghiChu);
//        ThanhToanServlet thanhToanServlet = new ThanhToanServlet();
//        thanhToanServlet.doGet(request,response);
        response.sendRedirect("/ThanhToanDonHang");
//        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Thanhtoandonhang.jsp");
//        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String backrefresh = request.getHeader("referer");
        Integer soluong;
        if(request.getParameter("quantity")==null)
        {
            soluong=1;
        }
        else {
            soluong=Integer.parseInt(request.getParameter("quantity"));
        }
        if(action.equals("checkout"))
        {
            List<SanPham_GioHang> cart = (List<SanPham_GioHang>)session.getAttribute("cart");
            session.setAttribute("cart",cart);
            request.getRequestDispatcher("Cart.jsp").forward(request,response);
        }
        else if (action.equals("delete"))
        {
            List<SanPham_GioHang> cart = (List<SanPham_GioHang>) session.getAttribute("cart");
            cart.size();
            int index = isExisting(request.getParameter("idSP"),cart);
            cart.remove(index);
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("Cart.jsp").forward(request,response);
        }
        else if(action.equals("order")){
            try {
                if (session.getAttribute("cart") == null) {
                    List<SanPham_GioHang> cart = new ArrayList<SanPham_GioHang>();
                    cart.add(new SanPham_GioHang(SanPhamService.getInstance().get(request.getParameter("idSP")), soluong));
                    session.setAttribute("cart", cart);
                } else {
                    List<SanPham_GioHang> cart = (List<SanPham_GioHang>) session.getAttribute("cart");
                    int index = isExisting(request.getParameter("idSP"),cart);
                    if(index==-1)
                        cart.add(new SanPham_GioHang(SanPhamService.getInstance().get(request.getParameter("idSP")), soluong));
                    else
                    {
                        int soLuong = cart.get(index).getSlSanPham() +soluong;
                        cart.get(index).setSlSanPham(soLuong);
                    }
                    session.setAttribute("cart", cart);
                }
            }catch (SQLException | ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            response.sendRedirect(getServletContext().getContextPath()+backrefresh);
        }
    }
    private int isExisting (String idSP,List<SanPham_GioHang> cart)
    {
        for (int i=0;i<cart.size();i++)
            if(cart.get(i).getSp().getMaSP().equals(idSP))
                return i;
            return -1;
    }
}
