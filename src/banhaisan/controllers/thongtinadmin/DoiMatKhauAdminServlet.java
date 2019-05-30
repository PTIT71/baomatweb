package banhaisan.controllers.thongtinadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.DangNhap_KetNoi;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.NguoiDung;
import sun.security.provider.MD5;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "DoiMatKhauAdminServlet",urlPatterns = "/Admin/DoiMatKhau")
public class DoiMatKhauAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        DangNhap_KetNoi user = (DangNhap_KetNoi) session.getAttribute("currentSessionAdmin");

        String email = user.getEmail();
        try {
            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.setEmail(email);
            nguoiDung.setMatKhau(request.getParameter("txt-mk-cu"));

            String CorrectPW = user.getPassWord().trim().replaceAll("[\uFEFF-\uFFFF]", "");
            String InvalidPW = MD5Convert(nguoiDung.getMatKhau().trim().replaceAll("[\uFEFF-\uFFFF]", ""));
            if(CorrectPW.equals(InvalidPW)) {
                nguoiDung.setMatKhau(request.getParameter("txt-mk-moi"));
                NguoiDungThongThuongService.getInstance().DoiMatKhau(nguoiDung);
                request.setAttribute("pwIsValid", true);
                RequestDispatcher rd = request.getRequestDispatcher("/Admin/DoiMatKhau.jsp");
                rd.forward(request,response);
            }
            else{
                request.setAttribute("pwIsValid",false);
                RequestDispatcher rd = request.getRequestDispatcher("/Admin/DoiMatKhau.jsp");
                rd.forward(request,response);
            }
        }catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/DoiMatKhau.jsp");
        dispatcher.forward(request,response);
    }
    public String MD5Convert (String string) throws NoSuchAlgorithmException {
        MessageDigest messageDigest=MessageDigest.getInstance("MD5");
        messageDigest.update(string.getBytes());
        byte[] digest=messageDigest.digest();
        StringBuffer sb = new StringBuffer();
        for (byte b : digest) {
            sb.append(Integer.toHexString((int) (b & 0xff)));
        }
        return sb.toString().toUpperCase();
    }
}
