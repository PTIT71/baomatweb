package banhaisan.controllers.sanphamnguoidung;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.SanPhamService;
import banhaisan.models.datamodels.BaiViet;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.SanPham;

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

@WebServlet(name = "SanPhamUserServlet", urlPatterns = {"/Products"})
public class SanPhamUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setAttribute("action",action);
        if(action.equals("checkout"))
        {
        String idDanhMuc = request.getParameter("idDM");
        if(idDanhMuc==null)
        {
            response.setStatus(400);
            return;
        }
        ArrayList<SanPham> sanPhams = null;
        try {
            sanPhams = SanPhamService.getInstance().getDataCategory(idDanhMuc);
            Double giaCaoNhat = SanPhamService.getInstance().layGiaCaoNhat(idDanhMuc);
            request.setAttribute("giaCaoNhat",giaCaoNhat);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(sanPhams==null)
        {
            response.setStatus(400);
            return;
        }
        request.setAttribute("sanPhams",sanPhams);
        HttpSession session = request.getSession();
        session.setAttribute("maDanhMuc",idDanhMuc);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Products.jsp");
        dispatcher.forward(request,response);
        }
        else if (action.equals("filter")){
            Double maxGia = Double.parseDouble(request.getParameter("max"));
            HttpSession session = request.getSession();
            String maDanhMuc = session.getAttribute("maDanhMuc").toString();
            if (maxGia == null)
            {
                response.setStatus(400);
                return;
            }
            ArrayList<SanPham> sanPhams = null;
            try {
                sanPhams = SanPhamService.getInstance().locSanPham(maxGia,maDanhMuc);
            }catch (SQLException | ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            if(sanPhams==null)
            {
                response.setStatus(400);
                return;
            }
            request.setAttribute("sanPhams",sanPhams);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Products.jsp");
            dispatcher.forward(request,response);
        }
        else if (action.equals("sorting")){
            HttpSession session = request.getSession();
            String maDanhMuc = session.getAttribute("maDanhMuc").toString();
            String getsorttype = request.getParameter("type");
            String sorttype;
            String sortattribute;
            if(getsorttype.equals("price-ascending")) {
                sorttype = "ASC";
                sortattribute = "giaSP";
            }
            else if(getsorttype.equals("price-descending")){
                sorttype="DESC";
                sortattribute="giaSP";
            }
            else {
                sorttype="DESC";
                sortattribute="ngayNhap";
            }
            ArrayList<SanPham> sanPhams = null;
            try {
                sanPhams = SanPhamService.getInstance().getSanPhamSorting(sorttype,sortattribute,maDanhMuc);
            }catch (SQLException | ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            if(sanPhams == null)
            {
                response.setStatus(400);
                return;
            }
            request.setAttribute("sanPhams",sanPhams);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Products.jsp");
            dispatcher.forward(request,response);
        }
    }
}
