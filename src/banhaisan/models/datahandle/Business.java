package banhaisan.models.datahandle;

import java.sql.SQLException;
import java.util.ArrayList;

public interface Business<T> {
    ArrayList<T> getData() throws SQLException, ClassNotFoundException;
    T get(Object... keys) throws SQLException, ClassNotFoundException;
    int add(T model) throws SQLException, ClassNotFoundException;
    int delete(T model) throws SQLException, ClassNotFoundException;
    int modify(T model) throws SQLException, ClassNotFoundException;
}
