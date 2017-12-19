<%@ page import="entity.Video" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.VideoService" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/15
  Time: 8:46
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
    <link href="css/more.css" rel="stylesheet">
    <link href="color/default.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>

</head>

<body>
<div id="more-top">
</div>
<div id="more-tiao">
    <ul id="more-ul">
        <li id="more-li" ><a href="demo.jsp"><div></div>首页</a></li>
    </ul>
</div>
<div>
    <section style="margin-top: 19px">
        <div class="container" style="width: 65%">
            <div class="row" style="padding:0px 7px 0 7px;">

                <div class="col-md-12 movie-item-out">
                    <h3 class="movie-item-out-lift" style="">电视剧：</h3>
                </div>
                <%
                    VideoService videoService=new VideoService();
                    List<Video> dianshiju=videoService.selectDSJ();
                    for (Video video:dianshiju){
                        String src=video.getImage();
                %>
                <div class="col-md-2 col-sm-6 col-xs-6 movie-item-out-mv">

                    <div class="movie-item">
                        <a style="display:block;"  target="_blank" href='/toinfopage?mingcheng2=<%=video.getMingcheng()%>'>
                            <img class="index-tupian"  alt="img" src="<%=src%>">
                        </a>
                        <div class="div-wenzi">
                            <p class="mv-zhuyan"><%=video.getMingcheng()%></p>
                            <p class="mv-time">上映时间：<a class="mv-time2"><%=video.getShijian()%></a></p>
                        </div>

                    </div>

                </div>
                <%
                    }
                %>
            </div>
        </div>

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

</body>
</html>
