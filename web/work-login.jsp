<%@ page import="DAO.VideoDAO" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/11
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>登陆界面</title>

    <style type="text/css">


        form{
            margin: 200px auto;
            padding-top: 6px;
            width: 300px;
            height: 250px;
            box-shadow: 0.5px 0.5px 3px 0.5px #888888;
            text-align: center;
        }
        .id-psd{
            margin-left: 8px;
            border: solid 1.5px #C0C0C0;
            border-radius: 2px 2px 2px 2px;
            width: 200px;
            height:30px;
            padding-left: 30px;
            font-family:"Arial Black";
        }
        .id-psd:hover{
            border-color:#FF7F50;
        }
        .ok-reset{
            border: solid 1.5px #FF7F50;
            border-radius: 3px 3px 3px 3px;
        }
        .ok-reset{
            background-color: #FF7F50;
            color: white;
            width: 113px;
            height:30px;
            font-family:"Arial Black";
        }
        .ok-reset:hover {
            border-color:#FF6347;
            background-color:#FF6347;
        }
        #login-name{
            background: url("icon/account.png");
            background-position: 5px 5px;
            background-size: 18px 18px;
            background-repeat: no-repeat;
        }
        #login-psd{
            background: url("icon/password.png");
            background-position: 5px 5px;
            background-size: 17px 17px;
            background-repeat: no-repeat;
        }
    </style>
    <script src="js/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            $("#login").click(function () {
                var username=$("#login-name").val();
                var password=$("#login-psd").val();
                $.ajax({
                    type:"post",
                    url:"login",
                    data:{
                        username:username,
                        password:password
                    },
                    success:function (data) {
                        if(data=="ok"){
                            location.href="demo.jsp";
                        }else {
                            alert("用户名或密码错误，请重新输入！")
                        }
                    }
                })
            })
        })

</script>
</head>

<body>
<form action="login" method="post">
    <h3>账号登陆</h3>
    <%
        String[] info={""};
        Cookie[] cookies=request.getCookies();
        for (int i=0;i<cookies.length;i++){
            if (cookies[i].getName().equals("username")){
                info[0]=cookies[i].getValue();
            }
        }
    %>
    <%
        if (info[0]==null){
    %>
    <input name="username"  type="text" placeholder="请输入用户名" onfocus="this.placeholder=''" onblur="placeholder='请输入用户名'"
           class="id-psd" id="login-name">
    <%
        }else{
    %>
    <input name="username" type="text" placeholder="请输入用户名" value="<%=info[0]%>" onfocus="this.placeholder=''" onblur="placeholder='请输入用户名'"
           class="id-psd" id="login-name">
    <%
        }
    %>
    <br /> <br />
    <input name="password" type="password" placeholder="请输入密码" onfocus="this.placeholder=''" onblur="placeholder='请输入密码'"
           class="id-psd" id="login-psd" >
    <br /> <br />
    <input type="button" id="login" value="登陆" name="ok" class="ok-reset">
    <input type="reset" value="重置" name="reset" class="ok-reset">
</form>
</body>
</body>
</html>
