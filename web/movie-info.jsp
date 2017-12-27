<%@ page import="java.util.List" %>
<%@ page import="entity.Video" %>
<%@ page import="java.util.Locale" %>
<%@ page import="Service.VideoService" %>
<%@ page import="DAO.VideoDAO" %>
<%@ page import="API.JuheDemo" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-responsive.min.css">
    <link href="css/movie-info.css" rel="stylesheet">
</head>
<body>

<%
    List<Video> videos=(List<Video>)request.getAttribute("list");
    session=request.getSession();
    session.setAttribute("videos",videos);
%>
<div id="mv-info-div">
    <ul id="mv-info-ul">
        <li id="mv-info-li" ><a href="demo.jsp"><div></div>首页</a></li>
    </ul>
</div>
<div id="zong-div">

    <div class="container-fluid">

        <div class="row">
             <%
               String time=videos.get(0).getShijian();
               String year=time.substring(0,time.indexOf("-"));
             %>
            <div class="col-md-12">
                <h1 class="movie-title" ><span id="videoname"><%=videos.get(0).getMingcheng()%></span><span class="movie-year">(<%=year%>)</span></h1>
            </div>

            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4" style="padding-right:5px;">
                        <a style="display:block;position:relative;">
                            <img class="img-thumbnail" alt="三毛从军记" width="100%" src="<%=videos.get(0).getImage()%>">
                        </a>
                        <br />
                        <div class="online-button">
                            <a target="_blank" class="btn btn-success btn-block" href='/play'>立即播放</a>
                        </div>
                        <%
                            session=request.getSession();
                            String user=(String)session.getAttribute("username");
                            String videoName=videos.get(0).getMingcheng();
                            VideoDAO videoDAO=new VideoDAO();
                        %>
                        <%
                            if (user==null){
                               %>
                        <p style="padding-top: 3px"><img src="img/shoucang.png" style="margin-top: 6px;width: 25px;
                        height: 25px;">要<a href="login.jsp">登陆</a>才能添加到您的收藏哦~</p>
                        <%
                            }
                        %>
                        <%
                            boolean ishave=videoDAO.selectCollection(user,videoName);
                            if (user!=null&&ishave==false){
                                %>
                        <div id="movie-sc">
                            <a >
                                <h5 id="like" style="position:absolute;">喜欢</h5>
                                <img style="float: left;margin-left: 43px" src="img/shoucang.png">
                            </a>
                        </div>
                        <%
                            }
                        %>
                        <%
                            if (ishave==true&&user!=null){
                                %>
                        <div id="movie-sc">
                            <a >
                                <h5 style="position: absolute" id="islike">已喜欢</h5>
                                <img style="float: left;margin-left: 43px" src="img/shoucang.png">
                            </a>
                        </div>
                        <%
                        }
                    %>
                    </div>
                    <div class="col-md-7" style="padding-right:5px;">
                        <table class="table-info">

                            <tr>
                                <td style="background-color: #f9f9f9;"
                                    class="table-td1"><span class="info-label">导演</span></td>
                                <td style="background-color: #f9f9f9;"
                                    class="table-td2"><%=videos.get(0).getDaoyan()%></td>
                            </tr>
                            <tr >
                                <td class="table-td1"><span class="info-label">主演</span></td>
                                <td class="table-td2"><%=videos.get(0).getZhuyan()%></td>
                            </tr>
                            <tr>
                                <td style="background-color: #f9f9f9;"
                                    class="table-td1"><span class="info-label">类型</span></td>
                                <td style="background-color: #f9f9f9;"
                                    class="table-td2"><%=videos.get(0).getLeixing()%></td>
                            </tr>
                            <tr >
                                <td class="table-td1"><span class="info-label">制片国家</span></td>
                                <td class="table-td2"><%=videos.get(0).getGuojia()%></td>
                        </tr>
                            <tr >
                                <td style="background-color: #f9f9f9;"
                                    class="table-td1"><span class="info-label">上映日期</span></td>
                                <td style="background-color: #f9f9f9;"
                                    class="table-td2"><%=videos.get(0).getShijian()%></td>
                            </tr>
                            <tr >
                                <td class="table-td1"><span class="info-label">评分</span></td>
                                <td class="table-td2">豆瓣：<a rel="nofollow" class="score"><%=request.getAttribute("rating")%><i class="glyphicon glyphicon-new-window"></i></a></td>
                            </tr>

                        </table>
                        <div id="mv-info-juqing">
                            <p style="color:#777;"><strong>剧情介绍：</strong></p><p class="summary">　
                            <%=videos.get(0).getJieshao()%>
                            </p>
                        </div> <!-- end summary -->
                    </div>

            </div>
        </div>
    </div>
</div>
</div>
<script src="js/jquery.min.js" ></script>
<script>
    $(function () {
        $("#like").click(function () {
            var videoName=$("#videoname").text();
            var like=$(this).text();
            $.ajax({
                type: "post",
                url: "like",
                dataType: "text",
                data: {
                    videoName: videoName,
                    like:like
                },
                success: function(data){
                    if (data=="yes"){
                        $("#like").text("已喜欢")
                    }else {
                        $("#like").text("喜欢")
                    }
                }
            });
        });
    })
</script>
<script>
    $(function () {
        $("#islike").click(function () {
            var videoName=$("#videoname").text();
            var like=$(this).text();
            $.ajax({
                type: "post",
                url: "like",
                dataType: "text",
                data: {
                    videoName: videoName,
                    like:like
                },
                success: function(data){
                    if (data=="delete"){
                        $("#islike").text("喜欢")
                    }else {
                        $("#islike").text("已喜欢")
                    }
                }
            });
        });
    })
</script>
</body>
</html>
