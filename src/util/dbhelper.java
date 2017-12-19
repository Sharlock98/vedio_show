package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbhelper {
    public static final Connection getInstance(){
        String url="jdbc:mysql://127.0.0.1:3306/demo?" +
                "userUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
        String user="root";
        String password="root";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动
            return DriverManager.getConnection(url,user,password);//获取数据库连接
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[]args){
        Connection connection= dbhelper.getInstance();
        System.out.println(connection);
    }
}
