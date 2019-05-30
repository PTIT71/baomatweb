package banhaisan.controllers.baiviet;

import banhaisan.models.datahandle.BaiVietService;
import banhaisan.models.datahandle.DanhMucService;
import banhaisan.models.datahandle.HinhAnhService;
import banhaisan.models.datamodels.BaiViet;
import banhaisan.models.datamodels.DanhMuc;
import banhaisan.models.datamodels.HinhAnh;
import banhaisan.models.datamodels.HinhAnhBV;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "ThemBaiVietServlet" , urlPatterns = "/Admin/TMBaiViet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ThemBaiVietServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static final String SAVE_DIRECTORY = "UploadFile";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String mabv = null;
        BaiViet baiViet= new BaiViet();
        baiViet.setMaBaiViet(request.getParameter("txt-ma-bai-viet"));
        baiViet.setTieuDe(request.getParameter("txt-tieu-de"));
        baiViet.setMaDanhMuc(request.getParameter("txtMaDanhMuc"));
        baiViet.setNoiDung(request.getParameter("text-noi-dung"));
        Date ngayDangBai= new Date();
        baiViet.setNgayDang(new java.sql.Date(ngayDangBai.getTime()));

        try {
            mabv =BaiVietService.getInstance().ThemBaiViet(baiViet);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        //hinh

        PrintWriter out = response.getWriter();
        try {
            // Đường dẫn tuyệt đối tới thư mục gốc của web app.
            String Path = "D:\\DATA-HK1-3\\LTWeb\\thietke\\FINAL-PROJECT-NHOM4-DBMS\\DBSMProject\\web\\";
            String appPath = request.getServletContext().getRealPath(""); //Lưu vào file out
            //String appPath = System.getProperty("user.dir");
            //String appPath=new File(".").getCanonicalPath();
            appPath = appPath.replace('\\', '/');
            Path = Path.replace('\\', '/');

            // Thư mục để save file tải lên.
            String fullSavePath = null;
            if (appPath.endsWith("/")) {
                fullSavePath = appPath + SAVE_DIRECTORY;
            } else {
                fullSavePath = appPath + "/" + SAVE_DIRECTORY;
            }


            String fullPath=null;
            if(Path.endsWith("/")){
                fullPath=Path+SAVE_DIRECTORY;
            }else {
                fullPath= Path + "/" + SAVE_DIRECTORY;
            }

            // Tạo thư mục nếu nó không tồn tại.
            File fileSaveDir = new File(fullSavePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            File fileNew= new File(fullPath);
            if (!fileNew.exists()) {
                fileNew.mkdir();
            }

            // Danh mục các phần đã upload lên (Có thể là nhiều file).
            for (Part part : request.getParts()) {
                String fileName = extractFileName(part);
                if (fileName != null && fileName.length() > 0) {
                    String filePath = fullSavePath + File.separator + fileName;

                    String fileoutPath= fullPath + File.separator + fileName;  //Luu vào file out
                    System.out.println("Write attachment to file: " + filePath);
                    request.setAttribute("link", fileName);
                    System.out.println("Write attachment to file: " + fileoutPath);
                    request.setAttribute("link", fileName);
                    // Ghi vào file.
                    part.write(filePath);
                    part.write(fileoutPath);
                    HinhAnhBV hinhAnh= new HinhAnhBV();
                    hinhAnh.setUrl("/UploadFile/"+fileName);
                    hinhAnh.setMaBV(mabv);
                    HinhAnhService.getInstance().addBaiViet(hinhAnh);
                }
            }
            // Upload thành công.
        } catch (Exception e) {
            e.printStackTrace();
        }


        response.sendRedirect("/Admin/QlyBaiViet");
    }
    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<DanhMuc> danhMucs = DanhMucService.getInstance().getData();
            request.setAttribute("danhMucs",danhMucs);
        }catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher =  getServletContext().getRequestDispatcher("/Admin/TMBaiViet.jsp");
        dispatcher.forward(request,response);
    }
}
