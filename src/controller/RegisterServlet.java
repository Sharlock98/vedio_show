package controller;

import Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet",urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String passwordAgain=request.getParameter("passwordAgain");
        psd(request,response);
        //密码和确认密码不一致则不进行数据库操作
        if (!password.equals(passwordAgain)||name.equals("")||password.equals("")||passwordAgain.equals("")){
            return;
        }
        UserService userService=new UserService();
        userService.insert(name,password);
//        request.getRequestDispatcher("/demo.jsp").forward(request, response);

    }
    public void psd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String passwordAgain=request.getParameter("passwordAgain");
        Boolean same=false;
        String msg = "";
        PrintWriter out = response.getWriter();
        if (password.equals(passwordAgain)&&!name.equals("")&&!password.equals("")&&!passwordAgain.equals(""))
            same=true;
        if (same==true){
            msg="ok";
        }else {
            msg = "error";
        }
        out.print(msg);
    }
}
