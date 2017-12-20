package DAO;



import entity.User;
import util.dbhelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DAO - Data access object
//作用：对表进行增删改查
public class UserDAO {
    //根据    用户名查询
    public User selectByName(String username){
        User user =null;
        String sql="SELECT * FROM login where username=? ";
        //数据库连接
        Connection connection= dbhelper.getInstance();
        if(connection==null){
            return null;
        }
        //执行sql语句
        try {
            PreparedStatement pstm= null;
            pstm = connection.prepareStatement(sql);
            pstm.setString(1,username);//1表示第一个?的占位符为username列下的数据
            ResultSet resultSet=pstm.executeQuery();
            //执行结果
            if(resultSet.next()){
                user=new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
            }//next()判断是否有记录
            resultSet.close();
            pstm.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    public void insert(String name,String password){
        String sql="insert into login(username,password) values(?,?)";
        //连接数据库
        Connection connection=dbhelper.getInstance();
        //执行sql语句
        try {
            PreparedStatement pstm=connection.prepareStatement(sql);

            pstm.setString(1,name);
            pstm.setString(2,password);
            if (pstm.executeUpdate()>0){
                System.out.print("插入成功");
            }
            //关闭数据库
            pstm.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Boolean selectUser(String name){
        String sql="select * from login where username=?";
        Connection connection= dbhelper.getInstance();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,name);
            ResultSet resultSet=preparedStatement.executeQuery();

            if(resultSet.next()){
                return true;
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args){
        int x=(int)(Math.random()*10);
        System.out.println(x);

    }
}
