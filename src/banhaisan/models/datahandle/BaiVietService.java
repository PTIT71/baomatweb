package banhaisan.models.datahandle;



import banhaisan.models.datamodels.BaiViet;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BaiVietService extends ConnectDatabase implements Business<BaiViet> {
    private static final BaiVietService instance = new BaiVietService();
    private BaiVietService(){}
    public static BaiVietService getInstance(){
        return instance;
    }
    @Override
    public ArrayList<BaiViet> getData() throws SQLException, ClassNotFoundException {

        ArrayList<BaiViet> baiViets= new ArrayList<>();
        openConnection();
        String query = "select * from dbo.vw_LayDSBaiViet";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            BaiViet baiViet= new BaiViet();
            baiViet.setMaBaiViet(resultSet.getString(1));
            baiViet.setNgayDang(resultSet.getDate(2));
            baiViet.setTieuDe(resultSet.getString(3));
            baiViet.setNoiDung(resultSet.getString(4));
            baiViet.setUrlHinhAnh(HinhAnhService.getInstance().LayMotHinhAnhBaiViet(baiViet.getMaBaiViet()).getUrl());

            baiViets.add(baiViet);
        }

        closeConnection();
        return baiViets;
    }

    public List<BaiViet> getBaiViet(int offset)throws SQLException, ClassNotFoundException{
        List<BaiViet> list = new ArrayList<BaiViet>();
        openConnection();
        String query = "SELECT * FROM BAIVIET ORDER BY MaBaiViet OFFSET " + offset + " ROWS FETCH NEXT 10 ROWS ONLY;";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet rs = statement.executeQuery();
        while(rs.next()){
            BaiViet baiViet= new BaiViet();
            baiViet.setMaBaiViet(rs.getString(1));
            baiViet.setTieuDe(rs.getString(2));
            baiViet.setNgayDang(rs.getDate(4));
            list.add(baiViet);
        }

        return list;
    }

    public int getNumOfRecord()throws SQLException, ClassNotFoundException{
        openConnection();
        String query = "Select count(MaBaiViet) as sl from BAIVIET";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        ResultSet rs = statement.executeQuery();
        rs.next();
        return rs.getInt("sl");
    }

    public ArrayList<BaiViet> getTop4BaiViet() throws SQLException, ClassNotFoundException {
        ArrayList<BaiViet> baiViets= new ArrayList<>();
        openConnection();
        String query = "select top 4 * from vw_LayDSBaiViet";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            BaiViet baiViet= new BaiViet();
            baiViet.setMaBaiViet(resultSet.getString(1));
            baiViet.setNgayDang(resultSet.getDate(2));
            baiViet.setTieuDe(resultSet.getString(3));
            baiViet.setNoiDung(resultSet.getNString(4));
            baiViet.setUrlHinhAnh(resultSet.getString(5));

            baiViets.add(baiViet);
        }

        closeConnection();
        return baiViets;
    }
    @Override
    public BaiViet get(Object... keys) throws SQLException, ClassNotFoundException {
        if(keys.length<=0){
            return null;
        }
        openConnection();

        String sql= "EXEC LayMotBaiViet  ?";
        PreparedStatement statement= connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, keys[0].toString());

        ResultSet resultSet= statement.executeQuery();
        BaiViet baiViet = null;
        if(resultSet.next()){
            baiViet= new BaiViet();
            baiViet.setMaBaiViet(resultSet.getString(1));
            baiViet.setTieuDe(resultSet.getString(2));
            baiViet.setNoiDung(resultSet.getString(3));
            baiViet.setNgayDang(resultSet.getDate(4));
            baiViet.setMaDanhMuc(resultSet.getString(5));

        }
        closeConnection();
        return baiViet;

    }

    @Override
    public int add(BaiViet model) throws SQLException, ClassNotFoundException {
        return 0;
    }
    public String ThemBaiViet(BaiViet baiViet) throws SQLException, ClassNotFoundException {
        if (baiViet == null) {
            return null;
        }
        openConnection();

        String sql = "EXEC ThemBaiViet ?,?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, baiViet.getMaBaiViet());
        statement.setString(2,baiViet.getTieuDe());
        statement.setString(3,baiViet.getNoiDung());
        statement.setDate(4, (Date) baiViet.getNgayDang());
        statement.setString(5,baiViet.getMaDanhMuc());


        ResultSet res = statement.executeQuery();
        String mabv = res.next() ? res.getString(1) : null;
        closeConnection();
        return mabv;
    }

    @Override
    public int delete(BaiViet model) throws SQLException, ClassNotFoundException {
        if (model == null) {
            return 0;
        }
        openConnection();

        String sql = "EXEC XoaBaiViet ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1, model.getMaBaiViet());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }

    @Override
    public int modify(BaiViet baiViet) throws SQLException, ClassNotFoundException {
        if (baiViet == null) {
            return 0;
        }
        openConnection();

        String sql = "EXEC SuaBaiViet  ?,?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,baiViet.getMaBaiViet());
        statement.setString(2,baiViet.getTieuDe());
        statement.setString(3,baiViet.getNoiDung());
        statement.setDate(4, (Date) baiViet.getNgayDang());
        statement.setString(5,baiViet.getMaDanhMuc());

        int rowAffected = statement.executeUpdate();
        closeConnection();
        return rowAffected;
    }
}
