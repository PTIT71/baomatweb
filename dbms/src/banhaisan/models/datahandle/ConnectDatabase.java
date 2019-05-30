package banhaisan.models.datahandle;

import banhaisan.models.datamodels.DangNhap_KetNoi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class ConnectDatabase {
    protected static String serverName="sa";
    protected static String passWord="123456789";



    protected Connection connection = null;

    public void openConnection() throws SQLException, ClassNotFoundException {
            String connectionString = "jdbc:sqlserver://den1.mssql8.gear.host:1433;databaseName=haisantuoisong;user=haisantuoisong;password=dieu.0291ute;useUnicode=true;characterEncoding=UTF-8";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(connectionString);
    }

    public void closeConnection() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
}
