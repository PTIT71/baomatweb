package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DanhGia;
import banhaisan.models.datamodels.NguoiDung;
import banhaisan.models.datamodels.SanPham;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DanhGiaService extends ConnectDatabase implements Business<DanhGia> {
    private static final DanhGiaService instance = new DanhGiaService();
    private DanhGiaService(){}
    public static DanhGiaService getInstance()
    {
        return instance;
    }
    @Override
    public ArrayList<DanhGia> getData() throws SQLException, ClassNotFoundException {
        return null;
    }

    public ArrayList<DanhGia> LayDanhSachBinhLuanSP (SanPham sanPham) throws SQLException, ClassNotFoundException{
        ArrayList<DanhGia> danhGias = new ArrayList<>();
        openConnection();
        String query = "select  * from dbo.fc_LayDanhSachBinhLuan (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,sanPham.getMaSP());

        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next())
        {
            DanhGia danhGia = new DanhGia();
            danhGia.setMaDanhGia(resultSet.getString(1));
            danhGia.setDanhGia(resultSet.getInt(2));
            danhGia.setBinhLuan(resultSet.getString(3));
            danhGia.setNgayBinhLuan(resultSet.getDate(4));
            danhGia.setMaNguoiDung(resultSet.getString(5));
            danhGia.setMaSP(resultSet.getString(6));
            danhGia.setTenNguoiDung(resultSet.getString(7));

            danhGias.add(danhGia);
        }
        closeConnection();
        return danhGias;
    }
    public ArrayList<DanhGia> LayDanhSachBinhLuanCaNhan (NguoiDung nguoiDung) throws SQLException,ClassNotFoundException{
        ArrayList<DanhGia> danhGias = new ArrayList<>();
        openConnection();
        String query = "select  * from dbo.fc_LayDanhSachBinhLuanCaNhan (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,nguoiDung.getMaNguoiDung());

        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next())
        {
            DanhGia danhGia = new DanhGia();
            danhGia.setMaDanhGia(resultSet.getString(1));
            danhGia.setDanhGia(resultSet.getInt(2));
            danhGia.setBinhLuan(resultSet.getString(3));
            danhGia.setNgayBinhLuan(resultSet.getDate(5));
            danhGia.setMaNguoiDung(resultSet.getString(6));
            danhGia.setMaSP(resultSet.getString(7));

            danhGias.add(danhGia);
        }
        closeConnection();
        return danhGias;
    }
    @Override
    public DanhGia get(Object... keys) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public int add(DanhGia danhGia) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "EXEC ThemDanhGia ?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1,danhGia.getDanhGia());
        statement.setString(2,danhGia.getBinhLuan());
        statement.setString(3,danhGia.getMaNguoiDung());
        statement.setString(4,danhGia.getMaSP());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    @Override
    public int delete(DanhGia model) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int modify(DanhGia model) throws SQLException, ClassNotFoundException {
        return 0;
    }
}
