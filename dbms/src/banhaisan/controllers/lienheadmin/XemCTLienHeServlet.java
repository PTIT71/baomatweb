package banhaisan.controllers.lienheadmin;

import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.LienHeService;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.LienHe;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

@WebServlet(name = "XemCTLienHeServlet", urlPatterns = {"/Admin/XemCTLienHe"})
public class XemCTLienHeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String toEmail = request.getParameter("txtemail");
        String toMessage = request.getParameter("txtphanhoi");
        String fromMessage = request.getParameter("txtnoidung");
        final String username = "16110291@student.hcmute.edu.vn";
        final String password = "dieu01886060734";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("16110291@student.hcmute.edu.vn"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));
            ((MimeMessage) message).setSubject("Phản hồi từ website Tiêu Dân Seafood với thắc mắc của bạn có nội dung:'" + fromMessage + "'", "UTF-8");
            ((MimeMessage) message).setText(toMessage, "UTF-8");

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/Admin/QLLienHe");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LienHe lienHe = new LienHe();
        String idLienHe = request.getParameter("idLH");
        if (idLienHe == null) {
            response.setStatus(400);
            return;
        }
        lienHe.setMaLienHe(idLienHe);
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
            lienHe = LienHeService.getInstance().get(lienHe);
            request.setAttribute("CTLienHe", lienHe);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (lienHe == null) {
            response.setStatus(400);
            return;
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ChiTietLienHe.jsp");
        dispatcher.forward(request, response);
    }
}
