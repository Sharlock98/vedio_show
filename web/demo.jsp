<%@ page import="Service.UserService" %>
<%@ page import="Service.VideoService" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Video" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/12
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>首页</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-responsive.min.css">
    <link href="css/style.css" rel="stylesheet">
    <link href="color/default.css" rel="stylesheet">


    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>


</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

<div id="preloader">
    <div id="load"></div>
</div>

<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header page-scroll">
            <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">-->
            <!--<i class="fa fa-bars"></i>-->
            <!--</button>-->
            <!--<a class="navbar-brand" href="demo.html"></a>-->
            <form method="post" action="search">
                <img src="img/logo2.png">
            <input class="input-ss" type="search" name="search" placeholder="站内搜索">
            </form>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="demo.jsp">首页</a></li>
                <li><a href="#intro">电影</a></li>
                <li><a href="#about">电视剧</a></li>
                <li><a href="#service">动漫</a></li>
                <!--<li id="login-hidden1"><a href="work-login.html">登陆</a>-->
                <!--<ul id="login-hidden2">-->
                <!--<li>qqq</li>-->
                <!--</ul>-->
                <!--</li>-->
                <!--<li ><a href="#zhuce">登陆</a></li>-->
                <%
                    if (session.getAttribute("username")==null){
                %>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">登陆<b class="caret"></b></a>
                    <ul class="dropdown-menu">

                        <div id="login-hidden">
                            <h6 style="text-align: left;text-indent: 1.5em">成为本站用户后：</h6>
                            <img src="img/login-gif.gif" style="height: 150px;width: 230px;margin-left: 7px">
                            <br /><br />
                            <input type="button" id="login-bu" onclick="location.href='login.jsp'" value="登陆">
                            <h6>首次使用？<a id="login-zhuce" href="register.jsp">点我注册</a></h6>
                        </div>

                    </ul>
                </li>
                <%
                    }else {
                        %>
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=(String)session.getAttribute("username")%><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="location.href='/collection'">我的收藏</a></li>
                            <li><a href="#" onclick="location.href='login.jsp'">切换用户</a></li>
                            <li><a href="#" onclick="location.href='/remove'">注销</a></li>

                        </ul>
                    </li>
                </ul>
                <%
                    }
                %>


        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>


<div class="top-tp" style="">
    <!-- Section: intro -->
    <section id="intro" class="intro ">
        <div class="container">
            <div class="row" style="padding:0px 7px 0 7px;">
                <div class="col-md-12 movie-item-out">
                    <h3 class="movie-item-out-lift" style="">电影：<a class="movie-item-out-right" style="text-decoration:none;" href="moreMovie.jsp">更多<img src="img/more-png2.png"></a></h3>

                </div>
                <%
                VideoService videoService=new VideoService();
                List<Video> dianying=videoService.selectMovie();
                Video video=new Video();
                for (int i=dianying.size()-1;i>dianying.size()-13;i--){
                    String src=dianying.get(i).getImage();
                %>
                <div class="col-md-2 col-sm-6 col-xs-6 movie-item-out-mv">
                    <div class="movie-item">
                        <a style="display:block" href='/toinfopage?mingcheng1=<%=dianying.get(i).getMingcheng()%>'>
                            <img class="index-tupian" src="<%=src%>">
                            <a href=""><div class="dask">
                                <p></p>
                                <p></p>
                            </div>
                            </a>
                            <div class="div-wenzi">
                                <p class="mv-zhuyan"><%=dianying.get(i).getMingcheng()%></p>
                                <p class="mv-time">上映时间：<a class="mv-time2"><%=dianying.get(i).getShijian()%></a></p>
                            </div>
                        </a>

                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

    </section>


    <section id="about" class="home-section " style="padding-bottom: 0;padding-top: 70px">
        <div class="container">
            <div class="row" style="padding:0px 7px 0 7px;">
                <div class="col-md-12 movie-item-out">
                    <h3 class="movie-item-out-lift" style="">电视剧：<a class="movie-item-out-right"
                                                                   style="text-decoration:none;" href="moreDSJ.jsp">更多<img src="img/more-png2.png"></a></h3>

                </div>
                <%
                    List<Video> dianshiju=videoService.selectDSJ();
                    for (int i=dianshiju.size()-1;i>dianshiju.size()-13;i--){
                        String src=dianshiju.get(i).getImage();
                %>
                <div class="col-md-2 col-sm-6 col-xs-6 movie-item-out-mv">
                    <div class="movie-item">
                        <a style="display:block" href="/toinfopage?mingcheng2=<%=dianshiju.get(i).getMingcheng()%>">
                            <img class="index-tupian"  src="<%=src%>">
                            <a href=""><div class="dask">
                                <p></p>
                                <p></p>
                            </div>
                            </a>
                            <div class="div-wenzi">
                                <p class="mv-zhuyan"><%=dianshiju.get(i).getMingcheng()%></p>
                                <p class="mv-time">上映时间：<a class="mv-time2"><%=dianshiju.get(i).getShijian()%></a></p>
                            </div>
                        </a>

                    </div>
                </div>
                <%
                    }
                %>

            </div>
        </div>
    </section>
    <section id="service" class="home-section  bg-gray" style="padding-top: 70px">
        <div class="container">
            <div class="row" style="padding:0px 7px 0 7px;">
                <div class="col-md-12 movie-item-out">
                    <h3 class="movie-item-out-lift" style="">动漫：<a class="movie-item-out-right"
                                                                   style="text-decoration:none;" href="moreCartoon.jsp">更多<img src="img/more-png2.png"></a></h3>

                </div>
                <%
                    List<Video> cartoon=videoService.selectCT();
                    for (int i=cartoon.size()-1;i>cartoon.size()-13;i--){
                        String src=cartoon.get(i).getImage();
                %>
                <div class="col-md-2 col-sm-6 col-xs-6 movie-item-out-mv">
                    <div class="movie-item">
                        <a style="display:block" href="/toinfopage?mingcheng3=<%=cartoon.get(i).getMingcheng()%>">
                            <img class="index-tupian" src="<%=src%>">
                            <a href=""><div class="dask">
                                <p></p>
                                <p></p>
                            </div>
                            </a>
                            <div class="div-wenzi">
                                <p class="mv-zhuyan"><%=cartoon.get(i).getMingcheng()%></p>
                                <p class="mv-time">上映时间：<a class="mv-time2"><%=cartoon.get(i).getShijian()%></a></p>
                            </div>
                        </a>

                    </div>
                </div>
                <%
                    }
                %>

            </div>
        </div>

    </section>

    <section id="contact" class="home-section text-center">

    </section>

</div>

<!-- Core JavaScript Files -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/jquery.scrollTo.js"></script>
<script src="js/wow.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="js/custom.js"></script>

<!--<script type="text/javascript">-->
<!--var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");-->
<!--document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fac45a0f68a119fbe4d1c4c3ac3044dbd' type='text/javascript'%3E%3C/script%3E"));-->
<!--</script>-->
</body>

</html>
