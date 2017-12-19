<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/13
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<script>



</script>
<link href="css/register.css" rel="stylesheet">
<script src="js/jquery-1.10.2.js" ></script>
<script src="css/bootstrap.min.css"></script>
<body>
<div class="testbox">
    <h1>立刻注册</h1>

    <form action="register" method="post">

        <div class="accounttype">
        </div>
        <hr>
        <div class="re-zhenghe" style="width: 500px">
        <label id="icon" for="name"><i  class="fa fa-user" ></i></label>
        <input type="text" name="username" id="name" placeholder="用户名" required/>
        <span id="id_en"></span>
        </div>
        <div>
        <label id="icon" for="name"><i  class="fa fa-envelope"></i></label>
        <input type="password" name="password" id="password" placeholder="密码" required/>
        </div>
        <label id="icon" for="name"><i class="fa fa-shield"></i></label>
        <input type="password" name="passwordAgain" id="passwordAgain" placeholder="确认密码" required/>

        <p>遵循本站相关的<a href="#">各种条款</a>.</p>
        <a type="button" id="zhuche" class="button" style="cursor: pointer">注册</a>
        <script>
            $(function() {
                $("#name").blur(function () {
                    var name = $(this).val();
                    $.ajax({
                        type: "post",
                        url: "RNS",
                        dataType: "text",
                        data: {
                            name: name
                        },
                        success: function (data) {
                            if (data=="yes") {
                                $("#id_en").text("用户名可用");
                                $("#id_en").css("color", "green");
                            }
                            else {
                                $("#id_en").text("用户名已被占用");
                                $("#id_en").css("color", "red");
                                $("#name").focus();
                            }
                        }
                    });
                });

                $("#zhuche").click(function () {
                    var username = $("#name").val();
                    var password = $("#password").val();
                    var passwordAgain = $("#passwordAgain").val();
                    $.ajax({
                        type: "post",
                        url: "register",
                        data: {
                            name: username,
                            password: password,
                            passwordAgain: passwordAgain

                        },
                        success: function (data) {
                            if (data == "error") {
                                alert("两次输入密码不正确")
                            }else {
                                location.href="demo.jsp"
                                alert("注册成功！")
                            }
                        }
                    });
                });
            });

        </script>
    </form>
</div>

</body>
</html>
