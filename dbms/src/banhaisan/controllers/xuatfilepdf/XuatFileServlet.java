package banhaisan.controllers.xuatfilepdf;

import banhaisan.models.datahandle.ThongKeService;
import banhaisan.models.datamodels.ThongTinDonHang;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import static javafx.scene.text.FontPosture.REGULAR;

@WebServlet(name = "XuatFileServlet", urlPatterns = "/Admin/XuatFilePdf")
public class XuatFileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<ThongTinDonHang> list = ThongKeService.getInstance().getThongTinDonHang();
            Map<String, Integer> map = ThongKeService.getInstance().getDonHang();
            Map<String, Integer> mapDT = ThongKeService.getInstance().getDoanhThu();

            Document document = new Document();

            String filename = "D:/ThongKe.pdf";

            PdfWriter.getInstance(document, new FileOutputStream(filename));

            document.open();

            ServletContext context = request.getServletContext();
            String fullPath = context.getRealPath("/resources/webfonts/AlegreyaSans.otf");

            BaseFont AlegreyaSans = BaseFont.createFont(fullPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font cellFont = new Font(AlegreyaSans, 16, Font.BOLD);

            Paragraph titleDT = new Paragraph("Doanh thu của từng tháng", cellFont);
            titleDT.setAlignment(Element.ALIGN_CENTER);
            document.add(titleDT);

            document.add(Chunk.NEWLINE);

            cellFont = new Font(AlegreyaSans, 12, Font.NORMAL);
            PdfPTable tableDT = new PdfPTable(2);
            tableDT.setTotalWidth(300);
            tableDT.setLockedWidth(true);

            PdfPCell cell = new PdfPCell(new Phrase("Tháng", cellFont));
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableDT.addCell(cell);

            cell = new PdfPCell(new Phrase("Doanh thu", cellFont));
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableDT.addCell(cell);

            tableDT.setHeaderRows(1);

            for(Map.Entry<String, Integer> m : mapDT.entrySet()){
                cell = new PdfPCell(new Phrase(m.getKey(),cellFont));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                tableDT.addCell(cell);

                cell = new PdfPCell(new Phrase(Integer.toString(m.getValue()),cellFont));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                tableDT.addCell(cell);
            }

            document.add(tableDT);

            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);


            cellFont = new Font(AlegreyaSans, 16, Font.BOLD);
            Paragraph titleHDTT = new Paragraph("Số lượng đơn hàng của từng tháng", cellFont);
            titleHDTT.setAlignment(Element.ALIGN_CENTER);
            document.add(titleHDTT);

            document.add(Chunk.NEWLINE);

            cellFont = new Font(AlegreyaSans, 12, Font.NORMAL);
            PdfPTable tableHD = new PdfPTable(2);
            tableHD.setTotalWidth(300);
            tableHD.setLockedWidth(true);

            cell = new PdfPCell(new Phrase("Tháng", cellFont));
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableHD.addCell(cell);

            cell = new PdfPCell(new Phrase("Số lượng đơn hàng", cellFont));
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableHD.addCell(cell);

            tableHD.setHeaderRows(1);

            for(Map.Entry<String, Integer> m : map.entrySet()){
                cell = new PdfPCell(new Phrase(m.getKey(),cellFont));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                tableHD.addCell(cell);

                cell = new PdfPCell(new Phrase(Integer.toString(m.getValue()),cellFont));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                tableHD.addCell(cell);
            }

            document.add(tableHD);


            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            cellFont = new Font(AlegreyaSans, 16, Font.BOLD);
            Paragraph titleHD = new Paragraph("Danh sách hóa đơn",cellFont);
            titleHD.setAlignment(Element.ALIGN_CENTER);
            document.add(titleHD);
            document.add(Chunk.NEWLINE);

            cellFont = new Font(AlegreyaSans, 12, Font.NORMAL);
            PdfPTable table = new PdfPTable(7);
            table.setTotalWidth(500);
            table.setLockedWidth(true);

            PdfPCell c = new PdfPCell(new Phrase("Mã đơn hàng",cellFont));
            c.setVerticalAlignment(Element.ALIGN_MIDDLE);
            c.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c);

            c = new PdfPCell(new Phrase("Tên khách hàng",cellFont));
            c.setVerticalAlignment(Element.ALIGN_MIDDLE);
            c.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c);

            c = new PdfPCell(new Phrase("Ngày đặt hàng",cellFont));
            c.setVerticalAlignment(Element.ALIGN_MIDDLE);
            c.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c);

            c = new PdfPCell(new Phrase("Địa chỉ đơn hàng",cellFont));
            c.setVerticalAlignment(Element.ALIGN_MIDDLE);
            c.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c);

            c = new PdfPCell(new Phrase("Email",cellFont));
            c.setVerticalAlignment(Element.ALIGN_MIDDLE);
            c.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c);

            c = new PdfPCell(new Phrase("Số điện thoại",cellFont));
            c.setVerticalAlignment(Element.ALIGN_MIDDLE);
            c.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c);

            c = new PdfPCell(new Phrase("Giá trị đơn hàng",cellFont));
            c.setVerticalAlignment(Element.ALIGN_MIDDLE);
            c.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(c);

            table.setHeaderRows(1);

            for (ThongTinDonHang tt : list){
                c = new PdfPCell(new Phrase(tt.getMaDonHang(),cellFont));
                c.setVerticalAlignment(Element.ALIGN_MIDDLE);
                c.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c);

                c = new PdfPCell(new Phrase(tt.getTenKhachHang(), cellFont));
                c.setVerticalAlignment(Element.ALIGN_MIDDLE);
                c.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c);

                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                c = new PdfPCell(new Phrase(df.format(tt.getNgayDatHang()), cellFont));
                c.setVerticalAlignment(Element.ALIGN_MIDDLE);
                c.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c);

                c = new PdfPCell(new Phrase(tt.getDiaChiDonHang(), cellFont));
                c.setVerticalAlignment(Element.ALIGN_MIDDLE);
                c.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c);

                c = new PdfPCell(new Phrase(tt.getMail(), cellFont));
                c.setVerticalAlignment(Element.ALIGN_MIDDLE);
                c.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c);

                c = new PdfPCell(new Phrase(tt.getSoDienThoai(), cellFont));
                c.setVerticalAlignment(Element.ALIGN_MIDDLE);
                c.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c);

                c = new PdfPCell(new Phrase(Integer.toString(tt.getGiaTriDonHang()), cellFont));
                c.setVerticalAlignment(Element.ALIGN_MIDDLE);
                c.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c);
            }
            document.add(table);
            document.close();

            // download file pdf


            response.setContentType("APPLICATION/OCTET-STREAM");
            PrintWriter out = response.getWriter();
            response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");

            FileInputStream fileInputStream=new FileInputStream(filename);

            int i;
            while ((i=fileInputStream.read()) != -1) {
                out.write(i);
            }
            fileInputStream.close();

            File file = new File(filename);
            file.delete();

        } catch (SQLException | ClassNotFoundException | DocumentException e) {
            System.out.println(e);
        }
    }
}
