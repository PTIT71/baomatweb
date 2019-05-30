package banhaisan.models.datahandle;

import banhaisan.models.datamodels.LienHe;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LienHeService extends ConnectDatabase implements Business<LienHe>{
    private static final LienHeService instance = new LienHeService();
    private LienHeService(){}
    public static LienHeService getInstance(){
        return instance;
    }
    @Override
    public ArrayList<LienHe> getData() throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "select * from  LIENHE";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        ArrayList<LienHe> lienHes = new ArrayList<>();

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            LienHe lienHe = new LienHe();
            lienHe.setMaLienHe(resultSet.getString(1));
            lienHe.setTenNguoiDung(resultSet.getString(2));
            lienHe.setEmail(resultSet.getString(3));
            lienHe.setSdt(resultSet.getString(4));
            lienHe.setNoiDung(resultSet.getString(5));
            lienHes.add(lienHe);
        }
        closeConnection();
        return lienHes;
    }

    public int getNumOfRecord()throws SQLException, ClassNotFoundException{
        openConnection();
        String query = "Select count(MaLienHe) as sl from LIENHE";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        ResultSet rs = statement.executeQuery();
        rs.next();
        return rs.getInt("sl");
    }

    public List<LienHe> getLienHe(int offset) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "select * from  LIENHE ORDER BY MaLienHe OFFSET " + offset + " ROWS FETCH NEXT 10 ROWS ONLY;";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        ArrayList<LienHe> lienHes = new ArrayList<>();

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next())
        {
            LienHe lienHe = new LienHe();
            lienHe.setMaLienHe(resultSet.getString(1));
            lienHe.setTenNguoiDung(resultSet.getString(2));
            lienHe.setEmail(resultSet.getString(3));
            lienHe.setSdt(resultSet.getString(4));
            lienHe.setNoiDung(resultSet.getString(5));
            lienHes.add(lienHe);
        }
        closeConnection();
        return lienHes;
    }

    @Override
    public LienHe get(Object... keys) throws SQLException, ClassNotFoundException {
        return null;
    }

    public LienHe get(LienHe lienHe) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "select * from fc_XemCTLienHe (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,lienHe.getMaLienHe());

        ResultSet resultSet = statement.executeQuery();
        LienHe lh = null;
        if(resultSet.next())
        {
            lh=new LienHe();
            lh.setMaLienHe(resultSet.getString(1));
            lh.setTenNguoiDung(resultSet.getString(2));
            lh.setEmail(resultSet.getString(3));
            lh.setSdt(resultSet.getString(4));
            lh.setNoiDung(resultSet.getString(5));
        }
        closeConnection();
        return lh;
    }

    @Override
    public int add(LienHe lienHe) throws SQLException, ClassNotFoundException {
        openConnection();
        String query = "exec ThemLienHe ?,?,?,?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,lienHe.getTenNguoiDung());
        statement.setString(2,lienHe.getEmail());
        statement.setString(3,lienHe.getSdt());
        statement.setString(4,lienHe.getNoiDung());

        int RowAffected = statement.executeUpdate();
        closeConnection();
        return RowAffected;
    }

    @Override
    public int delete(LienHe model) throws SQLException, ClassNotFoundException {
        return 0;
    }

    @Override
    public int modify(LienHe model) throws SQLException, ClassNotFoundException {
        return 0;
    }
}
