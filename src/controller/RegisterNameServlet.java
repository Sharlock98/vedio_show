package controller;

import Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterNameServlet",urlPatterns = "/RNS")
public class RegisterNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        UserService userService=new UserService();
        userService.selectuser(name);
        PrintWriter out = response.getWriter();
        String msg = "";
        if (userService.selectuser(name)){
            msg = "no";
        }else {
            msg = "yes";
        }
        out.print(msg);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
