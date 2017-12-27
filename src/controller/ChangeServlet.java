package controller;

import Service.VideoService;
import entity.Video;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChangeServlet",urlPatterns = "/change")
public class ChangeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String mingcheng1=request.getParameter("mingcheng1");
        String mingcheng2=request.getParameter("mingcheng2");
        String mingcheng3=request.getParameter("mingcheng3");
        if (mingcheng1!=null) {
            VideoService videoService = new VideoService();
            List<Video> list = videoService.selectMovieInfo(mingcheng1);
            request.setAttribute("list", list);
        }else if (mingcheng2!=null){
            VideoService videoService = new VideoService();
            List<Video> list = videoService.selectDSJInfo(mingcheng2);
            request.setAttribute("list", list);
        }else if (mingcheng3!=null){
            VideoService videoService = new VideoService();
            List<Video> list = videoService.selectCarttonInfo(mingcheng3);
            request.setAttribute("list", list);
        }
        request.getRequestDispatcher("/admin-change.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
