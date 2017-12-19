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

@WebServlet(name = "SearchtoinfoServlet",urlPatterns = "/searchinfo")
public class SearchtoinfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String mingcheng=request.getParameter("mingcheng");
        VideoService videoService=new VideoService();
        List<Video> list=videoService.search(mingcheng);
        request.setAttribute("list",list);
        request.getRequestDispatcher("/movie-info.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
