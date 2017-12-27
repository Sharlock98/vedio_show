<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/20
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="ht">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        #content,.container{
            margin: 0;
            padding: 0;
        }
        #ht{
            background-image: url('img/xiaomai.jpg') ;
            background-repeat: no-repeat;
            background-size: 100%;
            height: 80%;

        }
    </style>
</head>

<link href="css/register.css" rel="stylesheet">
<script src="js/jquery-1.10.2.js" ></script>
<script src="css/bootstrap.min.css"></script>

<body>
<div class="container">
    <section id="content">
        <form action="login" method="post">
            <h1 style="color: white">登陆</h1>
            <div>
                <label id="icon" ><i  class="fa fa-user" ></i></label>
                <input type="text" placeholder="Username" name="username" id="username" />
            </div>
            <div>
                <label id="icon" ><i  class="fa fa-envelope"></i></label>
                <input type="password" placeholder="Password" name="password" id="password" />
            </div>
            <a href="#" id="login" class="button">登陆</a>
        </form><!-- form -->

    </section>
</div>
<script>
    $(function () {
        $("#login").click(function () {
            var username=$("#username").val();
            var password=$("#password").val();
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
                        return;
                    }
                    if (data=="ojbk"){
                        location.href="admin-index.jsp";
                        return;
                    }
                    else {
                        alert("用户名或密码错误，请重新输入！");
                        return;
                    }
                }
            })
        })
    })

</script>
</body>
</html>
