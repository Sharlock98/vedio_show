package controller;

import API.JuheDemo;
import DAO.VideoDAO;
import Service.VideoService;
import entity.Video;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ToinfoServlet",urlPatterns = "/toinfopage")
public class ToinfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String mingcheng1=request.getParameter("mingcheng1");
        String mingcheng2=request.getParameter("mingcheng2");
        String mingcheng3=request.getParameter("mingcheng3");
        if (mingcheng1!=null) {
            VideoService videoService = new VideoService();
            List<Video> list = videoService.selectMovieInfo(mingcheng1);
            String rating= JuheDemo.getRequest1(mingcheng1);
            request.setAttribute("rating",rating);
            request.setAttribute("list", list);
        }else if (mingcheng2!=null){
            VideoService videoService = new VideoService();
            List<Video> list = videoService.selectDSJInfo(mingcheng2);
            String rating= JuheDemo.getRequest1(mingcheng2);
            request.setAttribute("rating",rating);
            request.setAttribute("list", list);
        }else if (mingcheng3!=null){
            VideoService videoService = new VideoService();
            List<Video> list = videoService.selectCarttonInfo(mingcheng3);
            String rating= JuheDemo.getRequest1(mingcheng3);
            request.setAttribute("rating",rating);
            request.setAttribute("list", list);
        }
        request.getRequestDispatcher("/movie-info.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
