package controller;

import DAO.VideoDAO;
import entity.Video;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RecommendedServlet",urlPatterns = "/Recommended")
public class RecommendedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoname=request.getParameter("videoname");
        VideoDAO videoDAO=new VideoDAO();
        List<Video> list=videoDAO.searchVideos(videoname);
        request.setAttribute("list",list);
        request.getRequestDispatcher("/movie-info.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
