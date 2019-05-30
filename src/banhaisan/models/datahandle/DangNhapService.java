package banhaisan.models.datahandle;

import banhaisan.models.datahandle.ConnectDatabase;
import banhaisan.models.datamodels.DangNhap_KetNoi;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DangNhapService extends ConnectDatabase {
    private static final DangNhapService instance = new DangNhapService();
    private DangNhapService(){}
    public static DangNhapService getInstance(){
        return instance;
    }

    public DangNhap_KetNoi IsLogin(DangNhap_KetNoi dangNhap_ketNoi) throws SQLException,ClassNotFoundException {
        openConnection();
        String query = "SELECT * FROM dbo.fc_KiemTraDangNhap(?,?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setEscapeProcessing(true);
        statement.setQueryTimeout(90);
        statement.setString(1,dangNhap_ketNoi.getEmail());
        statement.setString(2,dangNhap_ketNoi.getPassWord());

        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next())
        {
            dangNhap_ketNoi.setMaNguoiDung(resultSet.getString(1));
            dangNhap_ketNoi.setHoTen(resultSet.getString(2));
            dangNhap_ketNoi.setEmail(resultSet.getString(3));
            dangNhap_ketNoi.setPassWord(resultSet.getString(4));
            dangNhap_ketNoi.setAdmin(resultSet.getBoolean(5));
            dangNhap_ketNoi.setValid(true);
        }
        else {
            dangNhap_ketNoi.setValid(false);
        }
        closeConnection();
        return dangNhap_ketNoi;
    }
    public void LoginDB (String email,String password, String ipaddress) throws SQLException, ClassNotFoundException {
        serverName = email;
        passWord = password;
        openConnection();
        closeConnection();
    }
    public DangNhap_KetNoi IsExisting (String email) throws SQLException, ClassNotFoundException{
        openConnection();
        String query = "select * from dbo.fc_KiemTraEmail (?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setQueryTimeout(90);
        statement.setEscapeProcessing(true);
        statement.setString(1,email);

        ResultSet resultSet = statement.executeQuery();
        DangNhap_KetNoi dangNhap_ketNoi1 = null;
        if(resultSet.next())
        {
            dangNhap_ketNoi1 = new DangNhap_KetNoi();
            dangNhap_ketNoi1.setEmail(resultSet.getString(1));
        }
        closeConnection();
        return dangNhap_ketNoi1;
    }
}
