package controller;

import Service.UserService;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/login")
public class loginServlet extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserService userService=new UserService();
        Boolean islogin=userService.login(username,password);
        HttpSession session=request.getSession();
        session.setAttribute("username",username);
        session.getAttribute("username");
//        Cookie cookie=new Cookie("username",username);
//        cookie.setMaxAge(60*60*24*365);
//        response.addCookie(cookie);

        if (islogin){
            login(request,response);
        }else {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            login(request,response);
        }
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserService userService=new UserService();
        Boolean islogin=userService.login(username,password);
        PrintWriter out = response.getWriter();
        String msg = "";
        if(islogin) {
            msg="ok";
            if(username.equals("admin")){
                msg="ojbk";
            }
        }else {
            msg="error";
        }
        out.print(msg);
    }
}
