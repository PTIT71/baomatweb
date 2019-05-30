package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DonHang;
import banhaisan.models.datamodels.DonHang_SanPham;
import banhaisan.models.datamodels.SanPham_GioHang;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DonHangService extends ConnectDatabase implements Business<DonHang>{
    private static final DonHangService instance = new DonHangService();
    private DonHangService(){}
    public static DonHangService getInstance(){
        return instance;
    }
    @Override
    public ArrayList<DonHang> getData() throws SQLException, ClassNotFoundException {
        ArrayList<DonHang> donHangs = new ArrayList<>();
        openConnection();

        String query = "select * from dbo.vw_DanhSachDonHang";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            DonHang donHang = new DonHang();
            donHang.setTinhTrang(resultSet.getBoolean(1));
            donHang.setMaDonHang(resultSet.getString(2));
            donHang.setMaNguoiDung(resultSet.getString(3));
            donHang.setTongTien(Double.parseDouble(resultSet.getString(4)));
            donHang.setDiaChiGiaoHang(resultSet.getString(5));
            donHang.setHinhThucThanhToan(resultSet.getBoolean(6));
            donHang.setNgayDatHang(resultSet.getDate(7));

            donHangs.add(donHang);
        }
        closeConnection();
        return donHangs;
    }

    public List<DonHang> getDonHang(int offset) throws SQLException, ClassNotFoundException {
        List<DonHang> donHangs = new ArrayList<>();
        openConnection();

        String query = "select TinhTrang,ctdh.MaDonHang,MaNguoiDung,TongTien,DiaChiDonHang,HinhThucThanhToan,NgayDatHang " +
                "from CHITIET_DONHANG ctdh, (select dh.MaDonHang,SUM(Gia) as TongTien from DONHANG dh, CHITIET_DONHANG where dh.MaDonHang=CHITIET_DONHANG.MaDonHang group by dh.MaDonHang) tonggiatri, DONHANG " +
                "where tonggiatri.MaDonHang=ctdh.MaDonHang and DONHANG.MaDonHang=ctdh.MaDonHang " +
                "ORDER BY MaDonHang OFFSET " + offset +" ROWS FETCH NEXT 10 ROWS ONLY;";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            DonHang donHang = new DonHang();
            donHang.setTinhTrang(resultSet.getBoolean(1));
            donHang.setMaDonHang(resultSet.getString(2));
            donHang.setMaNguoiDung(resultSet.getString(3));
            donHang.setTongTien(Double.parseDouble(resultSet.getString(4)));
            donHang.setDiaChiGiaoHang(resultSet.getString(5));
            donHang.setHinhThucThanhToan(resultSet.getBoolean(6));
            donHang.setNgayDatHang(resultSet.getDate(7));

            donHangs.add(donHang);
        }
        closeConnection();
        return donHangs;
    }

    public int getNumOfRecord()throws SQLException, ClassNotFoundException{
        openConnection();
        String query = "select count(DONHANG.MaDonHang) as sl " +
                "from CHITIET_DONHANG ctdh, (select dh.MaDonHang,SUM(Gia) as TongTien from DONHANG dh, CHITIET_DONHANG where dh.MaDonHang=CHITIET_DONHANG.MaDonHang group by dh.MaDonHang) tonggiatri, DONHANG " +
                "where tonggiatri.MaDonHang=ctdh.MaDonHang and DONHANG.MaDonHang=ctdh.MaDonHang;";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        ResultSet rs = statement.executeQuery();
        rs.next();
        return rs.getInt("sl");
    }
    @Override
    public DonHang get(Object... keys) throws SQLException, ClassNotFoundException {
        if(keys.length<=0){
            return null;
        }
        openConnection();
        String sql= "select * from ThongTinDonHang(?)";
        PreparedStatement statement= connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, keys[0].toString());
        ResultSet resultSet= statement.executeQuery();
        DonHang donHang= null;
        if(resultSet.next()){
            donHang= new DonHang();
            donHang.setMaDonHang(resultSet.getString(1));
            donHang.setDiaChiGiaoHang(resultSet.getString(2));
            donHang.setGhiChu(resultSet.getString(3));
            donHang.setHinhThucThanhToan(resultSet.getBoolean(4));
            donHang.setNgayDatHang(resultSet.getDate(5));
            donHang.setTinhTrang(resultSet.getBoolean(6));
            donHang.setMaNguoiDung(resultSet.getString(7));
        }
        closeConnection();
        return donHang;
    }
    public DonHang getDonHangMoiNhat () throws SQLException, ClassNotFoundException{
        openConnection();
        String query = "EXEC LayDonHangMoiNhat";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);

        ResultSet resultSet = statement.executeQuery();
        DonHang donHang = null;
        if(resultSet.next())
        {
            donHang = new DonHang();
            donHang.setMaDonHang(resultSet.getString(1));
            donHang.setDiaChiGiaoHang(resultSet.getString(2));
            donHang.setGhiChu(resultSet.getString(3));
            donHang.setHinhThucThanhToan(resultSet.getBoolean(4));
            donHang.setNgayDatHang(resultSet.getDate(5));
            donHang.setTinhTrang(resultSet.getBoolean(6));
            donHang.setMaNguoiDung(resultSet.getString(7));
        }
        closeConnection();
        return donHang;
    }
//    public void HuyDonHang() throws SQLException, ClassNotFoundException {
//        openConnection();
//        String query = "EXEC HuyDonHang";
//        PreparedStatement statement = connection.prepareStatement(query);
//        statement.setQueryTimeout(90);
//        statement.setEscapeProcessing(true);
//        closeConnection();
//    }
    public ArrayList<DonHang_SanPham> getDSDonHang(Object... keys) throws SQLException, ClassNotFoundException{
        if(keys.length<=0){
            return null;
        }
        ArrayList<DonHang_SanPham> sanPhams = new ArrayList<>();
        openConnection();
        String query = "select * from dbo.fc_ChiTietDonHang(?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,keys[0].toString());

        ResultSet resultSet= statement.executeQuery();
        while (resultSet.next())
        {
            DonHang_SanPham sanPham = new DonHang();
            sanPham.setMaDonHang(resultSet.getString(1));
            sanPham.setMaSP(resultSet.getString(2));
            sanPham.setTenSP(resultSet.getString(3));
            sanPham.setSoLuong(Integer.parseInt(resultSet.getString(4)));
            sanPham.setGia(Double.parseDouble(resultSet.getString(5)));
            sanPham.setUrlHinhAnh(HinhAnhService.getInstance().LayMotHinhAnhSanPham(sanPham.getMaSP()).getUrl());

            sanPhams.add(sanPham);
        }
        closeConnection();
        return sanPhams;
    }
    @Override
    public int add(DonHang donHang) throws SQLException, ClassNotFoundException {
        openConnection();

        String query="EXEC ThemDonHang ?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,donHang.getDiaChiGiaoHang());
        statement.setString(2,donHang.getGhiChu());
        statement.setBoolean(3,donHang.isHinhThucThanhToan());
        statement.setString(4,donHang.getMaNguoiDung());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    @Override
    public int delete(DonHang donHang) throws SQLException, ClassNotFoundException {
        openConnection();

        String query = "EXEC XoaDonHang ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,donHang.getMaDonHang());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    public int addCTDonHang (SanPham_GioHang sanPham_gioHang) throws SQLException, ClassNotFoundException{
        openConnection();
        String query = "EXEC ThemChiTietDonHang ?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,sanPham_gioHang.getSp().getMaSP());
        statement.setInt(2,sanPham_gioHang.getSlSanPham());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }
    @Override
    public int modify(DonHang model) throws SQLException, ClassNotFoundException {
        return 0;
    }
    public ArrayList<DonHang> LayDanhSachDonHangCaNhan (String maNguoiDung) throws SQLException, ClassNotFoundException{
        openConnection();
        ArrayList<DonHang> donHangs = new ArrayList<>();
        String query = "exec LayDanhSachDonHangCaNhan ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,maNguoiDung);


        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next())
        {
            DonHang donHang = new DonHang();
            donHang.setMaDonHang(resultSet.getString(1));
            donHang.setNgayDatHang(resultSet.getDate(2));
            donHang.setTenSP(resultSet.getString(3));
            donHang.setTongTien(resultSet.getDouble(4));
            donHang.setTinhTrang(resultSet.getBoolean(5));
            donHang.setSoLuong(resultSet.getInt(6));

            donHangs.add(donHang);
        }
        closeConnection();
        return donHangs;
    }
}
