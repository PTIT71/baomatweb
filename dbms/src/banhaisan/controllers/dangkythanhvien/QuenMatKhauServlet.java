package banhaisan.controllers.dangkythanhvien;

import banhaisan.models.datahandle.DangNhapService;
import banhaisan.models.datahandle.NguoiDungThongThuongService;
import banhaisan.models.datamodels.NguoiDung;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

@WebServlet(name = "QuenMatKhauServlet",urlPatterns = {"/QuenMatKhau"})
public class QuenMatKhauServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String toEmail = request.getParameter("email");
        try {
            if(DangNhapService.getInstance().IsExisting(toEmail)!=null) {
                String newPassWord = generate_password(10).toString();
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
                    ((MimeMessage) message).setSubject("Mật khẩu mới cho website Tiêu Dân Seafood!","UTF-8");
                    ((MimeMessage) message).setText("Mật khẩu mới của bạn là " + newPassWord
                            + "\n\nGiá trên đã bao gồm phí ship, khi nhận hàng quý khách không cần thanh toán thêm bất cứ chi phí nào\n" +
                            "Đây là mail tự động, vui lòng không reply mail này!" + "\n\n Không gửi mật khẩu này cho bất kỳ ai, Cảm ơn!","UTF-8");

                    Transport.send(message);
                    NguoiDung nguoiDung = new NguoiDung();
                    nguoiDung.setEmail(toEmail);
                    nguoiDung.setMatKhau(newPassWord);
                    NguoiDungThongThuongService.getInstance().DoiMatKhau(nguoiDung);
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                response.sendRedirect("/Index");
            }
            else {
                response.sendRedirect("/Index");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
    static char[] generate_password (int len){
        String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String Small_chars = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String symbols = "!@#$%^&*_=+-/.?<>)";

        String values = Capital_chars + Small_chars + numbers + symbols;

        Random random = new Random();
        char[] password = new char[len];
        for (int i=0;i<len;i++)
        {
            password[i] = values.charAt(random.nextInt(values.length()));
        }
        return password;
    }
}
