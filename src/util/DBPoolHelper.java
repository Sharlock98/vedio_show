package util;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DBPoolHelper {
    private static DruidDataSource druidDataSource=null;
    //static块：在类转载时运行
    static {
        try {
            //获取资源文件
            InputStream in = DBPoolHelper.class.getClassLoader().getResourceAsStream("jdbc-config.properties");
            //加载资源文件信息
            Properties properties = new Properties();
            properties.load(in);
            //设置连接池
            druidDataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        public static synchronized Connection getConnection() {
        Connection connection = null;
        //获取连接
            try {
                connection = druidDataSource.getConnection();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return connection;
        }
    public static DruidDataSource getDataSource(){
        return druidDataSource;
    }
    public static void main(String[]args){
        Connection connection= DBPoolHelper.getConnection();
        System.out.print(connection);
    }
}
