package controller;

import Service.VideoService;
import entity.Video;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "addServlet",urlPatterns = "/add")
@MultipartConfig()
public class addServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String species=request.getParameter("species");
        Video video=new Video();
        Part part =request.getPart("image");
        //获取服务器上的物理位置
        String path=getServletContext().getRealPath("/");
        //获取上传的图片的文件名称
        String fileTag="filename=\"";
        String header=part.getHeader("content-disposition");
        String filename=header.substring(header.indexOf(fileTag)+fileTag.length(),
                header.lastIndexOf("\""));
        //生成自定义文件名：使用当前时间
        String filenamePath = "img"+File.separator+"dianying"+ File.separator+System.currentTimeMillis()+
                filename.substring(filename.lastIndexOf("."));
        part.write(path+File.separator+filenamePath);
        if (species.equals("电影")){
            video.setMingcheng(request.getParameter("mingcheng"));
            video.setDaoyan(request.getParameter("daoyan"));
            video.setZhuyan(request.getParameter("zhuyan"));
            video.setLeixing(request.getParameter("leixing"));
            video.setShijian(request.getParameter("shijian"));
            video.setGuojia(request.getParameter("guojia"));
            video.setJieshao(request.getParameter("jieshao"));
            video.setImage(filenamePath);
            video.setPianyuan(request.getParameter("pianyuan"));
            VideoService videoService=new VideoService();
            videoService.insertMovie(video);
        }
        if (species.equals("电视剧")){
            video.setMingcheng(request.getParameter("mingcheng"));
            video.setDaoyan(request.getParameter("daoyan"));
            video.setZhuyan(request.getParameter("zhuyan"));
            video.setLeixing(request.getParameter("leixing"));
            video.setShijian(request.getParameter("shijian"));
            video.setGuojia(request.getParameter("guojia"));
            video.setJieshao(request.getParameter("jieshao"));
            video.setImage(filenamePath);
            video.setPianyuan(request.getParameter("pianyuan"));
            VideoService videoService=new VideoService();
            videoService.insertDSJ(video);
        }
        if (species.equals("动漫")){
            video.setMingcheng(request.getParameter("mingcheng"));
            video.setDaoyan(request.getParameter("daoyan"));
            video.setZhuyan(request.getParameter("zhuyan"));
            video.setLeixing(request.getParameter("leixing"));
            video.setShijian(request.getParameter("shijian"));
            video.setGuojia(request.getParameter("guojia"));
            video.setJieshao(request.getParameter("jieshao"));
            video.setImage(filenamePath);
            video.setPianyuan(request.getParameter("pianyuan"));
            VideoService videoService=new VideoService();
            videoService.insertCT(video);
        }
            request.getRequestDispatcher("admin-index.jsp").forward(request,response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
