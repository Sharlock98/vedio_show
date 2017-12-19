package controller;

import DAO.VideoDAO;
import Service.VideoService;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LikeServlet",urlPatterns = "/like")
public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String user=(String)session.getAttribute("username");
        String videoName=request.getParameter("videoName");
        String like=request.getParameter("like");
        PrintWriter out = response.getWriter();
        String msg="";
        if (like.equals("喜欢")){
            VideoService videoService=new VideoService();
            videoService.addcollection(user,videoName);
            msg="yes";
        }else {
            VideoDAO videoDAO=new VideoDAO();
            videoDAO.deleteCollection(user,videoName);
            msg="delete";
        }
        out.print(msg);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
