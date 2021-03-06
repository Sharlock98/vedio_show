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

@WebServlet(name = "SearchMoviewServlet",urlPatterns = "/SearchMovie")
public class SearchMoviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search=request.getParameter("search");
        VideoService videoService=new VideoService();
        List<Video> list=videoService.search(search);
        request.setAttribute("list",list);
        request.getRequestDispatcher("/adminSearch.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
