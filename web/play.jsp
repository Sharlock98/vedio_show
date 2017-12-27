<%@ page import="entity.Video" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.VideoService" %>
<%@ page import="API.JuheDemo" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/19
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-responsive.min.css">
    <link  href="./css/play.css" rel="stylesheet">
    <link href="css/movie-info.css" rel="stylesheet">
</head>
<body>
<%
    List<Video> videos=(List<Video>)request.getAttribute("list");
%>
<div id="mv-info-div">
    <ul id="mv-info-ul">
        <li id="mv-info-li" ><a href="demo.jsp"><div></div>首页</a></li>
        <!--<li class="hover-user">用户-->
        <!--<ul><div></div>-->
        <!--<li>登陆</li>-->
        <!--<li>切换用户</li>-->
        <!--</ul>-->
        <!--</li>-->
    </ul>
</div>
<div id="zong-div">

    <div class="container-fluid" >

        <div class="row" >
            <%
                String time=videos.get(0).getShijian();
                String year=time.substring(0,time.indexOf("-"));
            %>
            <div class="col-md-12">
                <h1 class="movie-title"><%=videos.get(0).getMingcheng()%><span class="movie-year">(<%=year%>)</span></h1>
            </div>

            <div class="col-md-12" style="margin-bottom: 5px">
                <div class="row" style="height: 100%;">
                    <div class="col-md-9" style="padding-right:5px;">

                        <iframe style="width: 100%; height:500px;" scrolling="no"
                                src="<%=videos.get(0).getPianyuan()%>">
                        </iframe>
                    </div>

                    <div class="col-md-3">
                        <ul class="play-ul">
                            <h6>推荐列表</h6>
                            <%
                                VideoService videoService=new VideoService();
                                List<Video> videoList=videoService.selectMovieInfo(videos.get(0).getMingcheng());
                                List<Video> videoList1=videoService.selectDSJInfo(videos.get(0).getMingcheng());
                                List<Video> videoList2=videoService.selectCarttonInfo(videos.get(0).getMingcheng());
                                if (videoList.size()!=0){
                                    List<Video> movies=videoService.selectMovie();
                                    for (int m=0;m<8;m++){
                                        int x=(int)(Math.random()*50);
                            %>
                            <a href="/toinfopage?mingcheng1=<%=movies.get(x).getMingcheng()%>"><li class="play-li"><img class="play-img" src="<%=movies.get(x).getImage()%>">
                                <p class="play-p"><%=movies.get(x).getMingcheng()%></p>
                                <img class="play-png2" src="img/play-png.png">
                            </li></a>
                            <hr />
                            <%
                                    }
                                    return;
                                }
                            %>
                            <%
                                if (videoList1.size()!=0){
                                    List<Video> dianshuju=videoService.selectDSJ();
                                    for (int m=0;m<8;m++){
                                        int x=(int)(Math.random()*50);
                                        %>
                            <a href="/toinfopage?mingcheng1=<%=dianshuju.get(x).getMingcheng()%>"><li class="play-li"><img class="play-img" src="<%=dianshuju.get(x).getImage()%>">
                                <p class="play-p"><%=dianshuju.get(x).getMingcheng()%></p>
                            <img class="play-png2" src="img/play-png.png">
                            </li>
                            <hr />
                            <%
                                    }
                                    return;
                                }
                            %>
                            <%
                                if (videoList2.size()!=0){
                                    List<Video> cartoon=videoService.selectCT();
                                    for (int m=0;m<8;m++){
                                        int x=(int)(Math.random()*50);
                            %>
                                <a href="/toinfopage?mingcheng1=<%=cartoon.get(x).getMingcheng()%>"><li class="play-li"><img class="play-img" src="<%=cartoon.get(x).getImage()%>">
                                <p class="play-p"><%=cartoon.get(x).getMingcheng()%></p>
                                <img class="play-png2" src="img/play-png.png">
                            </li>
                            <hr />
                            <%
                                    }
                                    return;
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
