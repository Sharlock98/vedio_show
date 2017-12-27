package DAO;

import entity.Video;
import util.dbhelper;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VideoDAO {
    List<Video> videos =new ArrayList<>();
    private void setto(String sql){
        Connection connection= dbhelper.getInstance();

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                Video video =new Video();
                video.setMingcheng(resultSet.getString("mingcheng"));
                video.setDaoyan(resultSet.getString("daoyan"));
                video.setZhuyan(resultSet.getString("zhuyan"));
                video.setLeixing(resultSet.getString("leixing"));
                video.setGuojia(resultSet.getString("guojia"));
                video.setShijian(resultSet.getString("shijian"));
                video.setJieshao(resultSet.getString("jieshao"));
                video.setImage(resultSet.getString("image"));
                video.setPianyuan(resultSet.getString("pianyuan"));
                videos.add(video);
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void insert(Video video,String sql){
        Connection connection = dbhelper.getInstance();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, video.getMingcheng());
            preparedStatement.setString(2, video.getDaoyan());
            preparedStatement.setString(3, video.getZhuyan());
            preparedStatement.setString(4, video.getLeixing());
            preparedStatement.setString(5, video.getGuojia());
            preparedStatement.setString(6, video.getShijian());
            preparedStatement.setString(7, video.getJieshao());
            preparedStatement.setString(8, video.getImage());
            preparedStatement.setString(9, video.getPianyuan());
            if (preparedStatement.executeUpdate() > 0) {
                System.out.print("插入成功");
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Video> selectAllDY(){
        String sql="select * from dianying";
        //连接
        setto(sql);
        return videos;
    }
    public List<Video> selectAllDSJ(){
        String sql="select * from dianshiju";
        //连接
        setto(sql);
        return videos;
    }
    public List<Video> selectAllCT(){
        String sql="select * from cartoon";
        //连接
        setto(sql);
        return videos;
    }

    public List<Video> getVideoDYInfo(String mingcheng) {
        String sql="select * from dianying where mingcheng=?";
        Connection connection= dbhelper.getInstance();

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            //代替?的值
            preparedStatement.setString(1,mingcheng);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                Video video =new Video();
                video.setMingcheng(resultSet.getString("mingcheng"));
                video.setDaoyan(resultSet.getString("daoyan"));
                video.setZhuyan(resultSet.getString("zhuyan"));
                video.setLeixing(resultSet.getString("leixing"));
                video.setGuojia(resultSet.getString("guojia"));
                video.setShijian(resultSet.getString("shijian"));
                video.setJieshao(resultSet.getString("jieshao"));
                video.setImage(resultSet.getString("image"));
                video.setPianyuan(resultSet.getString("pianyuan"));
                videos.add(video);
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videos;
    }
    public List<Video> getVideoDSJInfo(String mingcheng) {
        String sql="select * from dianshiju where mingcheng=?";
        Connection connection= dbhelper.getInstance();

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            //代替?的值
            preparedStatement.setString(1,mingcheng);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                Video video =new Video();
                video.setMingcheng(resultSet.getString("mingcheng"));
                video.setDaoyan(resultSet.getString("daoyan"));
                video.setZhuyan(resultSet.getString("zhuyan"));
                video.setLeixing(resultSet.getString("leixing"));
                video.setGuojia(resultSet.getString("guojia"));
                video.setShijian(resultSet.getString("shijian"));
                video.setJieshao(resultSet.getString("jieshao"));
                video.setImage(resultSet.getString("image"));
                video.setPianyuan(resultSet.getString("pianyuan"));
                videos.add(video);
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videos;
    }
    public List<Video> getVideoCTInfo(String mingcheng) {
        String sql="select * from cartoon where mingcheng=?";
        Connection connection= dbhelper.getInstance();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            //代替?的值
            preparedStatement.setString(1,mingcheng);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                Video video =new Video();
                video.setMingcheng(resultSet.getString("mingcheng"));
                video.setDaoyan(resultSet.getString("daoyan"));
                video.setZhuyan(resultSet.getString("zhuyan"));
                video.setLeixing(resultSet.getString("leixing"));
                video.setGuojia(resultSet.getString("guojia"));
                video.setShijian(resultSet.getString("shijian"));
                video.setJieshao(resultSet.getString("jieshao"));
                video.setImage(resultSet.getString("image"));
                video.setPianyuan(resultSet.getString("pianyuan"));
                videos.add(video);
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videos;
    }

    public List<Video> searchVideos(String mingcheng) {
        String sql="select * from dianying where mingcheng like "+"'%"+mingcheng+"%'"+
                "UNION select * from dianshiju where mingcheng like"+"'%"+mingcheng+"%'"+
                "UNION select * from cartoon where mingcheng like"+"'%"+mingcheng+"%'";
        Connection connection= dbhelper.getInstance();

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                Video video=new Video();
                video.setMingcheng(resultSet.getString("mingcheng"));
                video.setDaoyan(resultSet.getString("daoyan"));
                video.setZhuyan(resultSet.getString("zhuyan"));
                video.setLeixing(resultSet.getString("leixing"));
                video.setGuojia(resultSet.getString("guojia"));
                video.setShijian(resultSet.getString("shijian"));
                video.setJieshao(resultSet.getString("jieshao"));
                video.setImage(resultSet.getString("image"));
                video.setPianyuan(resultSet.getString("pianyuan"));
                videos.add(video);
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videos;
    }
    public void collection(String user,String videoName){
        String sql="insert into collection(user,video) values(?,?)";
        Connection connection= dbhelper.getInstance();

        try{
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,user);
            preparedStatement.setString(2,videoName);
            if (preparedStatement.executeUpdate()>0){
                System.out.print("插入成功");
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Boolean selectCollection(String user,String videoName){
        String sql="select * from collection where user=? AND video=?";
        Connection connection= dbhelper.getInstance();

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,user);
            preparedStatement.setString(2,videoName);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
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
    public void deleteCollection(String user,String videoName){
        String sql="DELETE from collection where video=? AND user=?";
        Connection connection= dbhelper.getInstance();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,videoName);
            preparedStatement.setString(2,user);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public List<Video> selectMyCollection(String user){
        String sql="select * from collection where user=?";
        Connection connection= dbhelper.getInstance();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,user);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String collectionVideo=resultSet.getString("video");
//                String sql2="select * from dianying where mingcheng like "+"'%"+collectionVideo+"%'"+
//                        "UNION select * from dianshiju where mingcheng like"+"'%"+collectionVideo+"%'"+
//                        "UNION select * from cartoon where mingcheng like"+"'%"+collectionVideo+"%'";
                searchVideos(collectionVideo);
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videos;
    }

    public void insertDY(Video video) {
        String sql = "insert into dianying(mingcheng,daoyan,zhuyan,leixing,guojia,shijian,jieshao,image,pianyuan)" +
                "values(?,?,?,?,?,?,?,?,?)";
        insert(video,sql);
    }
    public void insertDSJ(Video video) {
        String sql = "insert into dianshiju(mingcheng,daoyan,zhuyan,leixing,guojia,shijian,jieshao,image,pianyuan)" +
                "values(?,?,?,?,?,?,?,?,?)";
        insert(video,sql);
    }
    public void insertCT(Video video) {
        String sql = "insert into cartoon(mingcheng,daoyan,zhuyan,leixing,guojia,shijian,jieshao,image,pianyuan)" +
                "values(?,?,?,?,?,?,?,?,?)";
        insert(video,sql);
    }
    public void delete(String name){
        String sql1="DELETE FROM dianying WHERE mingcheng=?";
        String sql2="DELETE FROM dianshiju WHERE mingcheng=?";
        String sql3="DELETE FROM cartoon WHERE mingcheng=?";
        Connection connection= dbhelper.getInstance();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(sql1);
            preparedStatement.setString(1,name);
            preparedStatement.executeUpdate();
            preparedStatement=connection.prepareStatement(sql2);
            preparedStatement.setString(1,name);
            preparedStatement.executeUpdate();
            preparedStatement=connection.prepareStatement(sql3);
            preparedStatement.setString(1,name);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        public static void main(String[] args){
        String name="荒岛余生";
        VideoDAO videoDAO=new VideoDAO();
        videoDAO.delete(name);
    }
}
