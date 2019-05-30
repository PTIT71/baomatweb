package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DanhMuc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DanhMucService extends ConnectDatabase implements Business<DanhMuc> {
    private static final DanhMucService instance = new DanhMucService();
    private DanhMucService(){}
    public static DanhMucService getInstance(){
        return instance;
    }
    @Override
    public ArrayList<DanhMuc> getData() throws SQLException, ClassNotFoundException {
        ArrayList<DanhMuc> danhMucs = new ArrayList<>();
        openConnection();

        String query = "select * from dbo.vw_DanhSachDanhMuc";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            DanhMuc danhMuc = new DanhMuc();
            danhMuc.setMaDanhmuc(resultSet.getString(1));
            danhMuc.setTenDanhmuc(resultSet.getString(2));

            danhMucs.add(danhMuc);
        }
        closeConnection();
        return danhMucs;
    }

    @Override
    public DanhMuc get(Object... keys) throws SQLException, ClassNotFoundException {
        if(keys.length<=0){
            return null;
        }
        openConnection();
        String query = "select * from dbo.fc_ChiTietDanhMuc(?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,keys[0].toString());

        ResultSet resultSet = statement.executeQuery();
        DanhMuc danhMuc = null;
        if(resultSet.next())
        {
            danhMuc= new DanhMuc();
            danhMuc.setMaDanhmuc(resultSet.getString(1));
            danhMuc.setTenDanhmuc(resultSet.getString(2));
        }
        closeConnection();
        return danhMuc;
    }

    @Override
    public int add(DanhMuc danhMuc) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "EXEC ThemDanhMuc ?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,danhMuc.getMaDanhmuc());
        statement.setString(2,danhMuc.getTenDanhmuc());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    @Override
    public int delete(DanhMuc danhMuc) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "EXEC XoaDanhMuc ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,danhMuc.getMaDanhmuc());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    @Override
    public int modify(DanhMuc danhMuc) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "EXEC SuaDanhMuc ?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        statement.setString(1,danhMuc.getMaDanhmuc());
        statement.setString(2,danhMuc.getTenDanhmuc());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

}
