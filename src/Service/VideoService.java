package Service;

import DAO.VideoDAO;
import entity.Video;

import java.util.List;

public class VideoService {
    public List<Video> selectMovie(){
        VideoDAO videoDAO =new VideoDAO();
        return videoDAO.selectAllDY();
    }
    public List<Video> selectDSJ(){
        VideoDAO videoDAO =new VideoDAO();
        return videoDAO.selectAllDSJ();
    }
    public List<Video> selectCT(){
        VideoDAO videoDAO =new VideoDAO();
        return videoDAO.selectAllCT();
    }
    public List<Video> selectMovieInfo(String name) {
        VideoDAO videoDAO = new VideoDAO();
        List<Video> list=videoDAO.getVideoDYInfo(name);
        return list;
    }
    public List<Video> selectDSJInfo(String name) {
        VideoDAO videoDAO = new VideoDAO();
        List<Video> list = videoDAO.getVideoDSJInfo(name);
        return list;
    }
    public List<Video> selectCarttonInfo(String name) {
        VideoDAO videoDAO = new VideoDAO();
        List<Video> list = videoDAO.getVideoCTInfo(name);
        return list;
    }
    public List<Video> search(String videoName){
        VideoDAO videoDAO = new VideoDAO();
        List<Video> list = videoDAO.searchVideos(videoName);
        return list;
    }
    public void addcollection(String user,String videoName){
        VideoDAO videoDAO=new VideoDAO();
        videoDAO.collection(user,videoName);
    }
    public List<Video> Mycollection(String user){
        VideoDAO videoDAO = new VideoDAO();
        List<Video> list = videoDAO.selectMyCollection(user);
        return list;
    }
}
