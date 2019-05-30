package banhaisan.models.datahandle;



import banhaisan.models.datamodels.ThongTinDonHang;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ThongKeService extends ConnectDatabase {
    private static final ThongKeService instance = new ThongKeService();
    private ThongKeService(){}
    public static ThongKeService getInstance(){
        return instance;
    }
    public Map<String, Integer> getDoanhThu() throws SQLException, ClassNotFoundException {
        Map<String, Integer> map = new LinkedHashMap<String, Integer>();
        map.put("01", 0);
        map.put("02", 0);
        map.put("03", 0);
        map.put("04", 0);
        map.put("05", 0);
        map.put("06", 0);
        map.put("07", 0);
        map.put("08", 0);
        map.put("09", 0);
        map.put("10", 0);
        map.put("11", 0);
        map.put("12", 0);
        openConnection();
        String query = "SELECT FORMAT(NgayDatHang, 'MM') AS Thang, SUM(Gia) as TongTien FROM DONHANG, CHITIET_DONHANG WHERE DONHANG.MaDonHang = CHITIET_DONHANG.MaDonHang GROUP BY FORMAT(NgayDatHang, 'MM') ORDER BY FORMAT(NgayDatHang, 'MM')";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            map.put(resultSet.getString(1),resultSet.getInt(2));
        }

        closeConnection();
        return map;
    }

    public Map<String, Integer> getDonHang() throws SQLException, ClassNotFoundException {
        Map<String, Integer> map = new LinkedHashMap<String, Integer>();
        map.put("01", 0);
        map.put("02", 0);
        map.put("03", 0);
        map.put("04", 0);
        map.put("05", 0);
        map.put("06", 0);
        map.put("07", 0);
        map.put("08", 0);
        map.put("09", 0);
        map.put("10", 0);
        map.put("11", 0);
        map.put("12", 0);
        openConnection();
        String query = "SELECT FORMAT(NgayDatHang, 'MM') AS Thang, Count(DONHANG.MaDonHang) as TongDonHang FROM DONHANG, CHITIET_DONHANG WHERE DONHANG.MaDonHang = CHITIET_DONHANG.MaDonHang GROUP BY FORMAT(NgayDatHang, 'MM') ORDER BY FORMAT(NgayDatHang, 'MM')";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            map.put(resultSet.getString(1),resultSet.getInt(2));
        }

        closeConnection();
        return map;
    }

    public List<ThongTinDonHang> getThongTinDonHang() throws SQLException, ClassNotFoundException {
        List<ThongTinDonHang> list = new ArrayList<>();
        openConnection();
        String query = "select DONHANG.MaDonHang, HoTen, NgayDatHang,DiaChiDonHang, Email, SoDienThoai, SUM(Gia) as GiaTriDonHang from DONHANG, NGUOIDUNG, CHITIET_DONHANG where DONHANG.MaNguoiDung = NGUOIDUNG.MaNguoiDung AND CHITIET_DONHANG.MaDonHang = DONHANG.MaDonHang GROup by HoTen,NgayDatHang,DiaChiDonHang, Email, SoDienThoai, DONHANG.MaDonHang";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()){
            ThongTinDonHang ttdh = new ThongTinDonHang();
            ttdh.setMaDonHang(resultSet.getString(1));
            ttdh.setTenKhachHang(resultSet.getString(2));
            ttdh.setNgayDatHang(resultSet.getDate(3));
            ttdh.setDiaChiDonHang(resultSet.getString(4));
            ttdh.setMail(resultSet.getString(5));
            ttdh.setSoDienThoai(resultSet.getString(6));
            ttdh.setGiaTriDonHang(resultSet.getInt(7));
            list.add(ttdh);
        }
        closeConnection();
        return list;
    }
}
