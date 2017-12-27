<%@ page import="entity.Video" %>
<%@ page import="Service.VideoService" %>
<%@ page import="java.util.List" %>
<%@ page import="API.JuheDemo" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2017/12/20
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
    <link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
    <link rel="stylesheet" href="css/admin-index.css">
    <link rel="stylesheet" href="css/movie-info.css">

</head>
<body>

<div id="wrapper">
    <div class="overlay"></div>

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
        <ul class="nav sidebar-nav">
            <li>
                <div class="admin-ce-img">

                </div>
            </li>
            <li class="sidebar-brand">
                <p>
                    管理员大大
                <p/>
            </li>
            <li>
                <div class="admin-ce-button">
                    <input type="button" onclick="location.href='/remove'" value="退出登陆">
                </div>
            </li>
        </ul>
    </nav>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
        </button>
        <div class="container">
            <div class="tab1" id="tab1">
                <div class="menu">
                    <ul>
                        <li id="one1" onclick="setTab('one',1)">首页</li>
                        <li id="one2" onclick="setTab('one',2)">电影</li>
                        <li id="one3" onclick="setTab('one',3)">电视剧</li>
                        <li id="one4" onclick="setTab('one',4)">动漫</li>
                    </ul>
                </div>
                <div class="menudiv">
                    <div id="con_one_1">
                        <img class="admin-img" src="img/admin-index.jpg">
                    </div>
                    <div id="con_one_2" style="display:none;">
                        <div class="cat_add">
                            <div class="col-md-12 movie-item-out admin-yihang">
                                <div class="col-md-8 movie-item-out">
                                    <div class="article_delete">
                                        <button type="button"  class="btn btn-danger" onclick="location.href='admin-add.jsp'" style="width: 112px;">添加</button>
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">删除选定</button>
                                    </div>
                                </div>
                                <div class="col-md-4 movie-item-out2">
                                    <div class="admin-right">
                                        <form class="form-horizontal" method="post" action="SearchMovie">
                                            <div class="col-md-8 admin-bu1">
                                                <input class="form-control" type="text" name="search" placeholder="请输入影片名称" />
                                            </div>
                                            <div class="col-md-3 admin-bu2 ">
                                                <button class="btn btn-danger" style="width: 112px;">查询</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="article_main">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th class="center-th" style="width:28px"><input name="allsel" id="allsel" onclick="oParams.setCtrBox('arSel',this.checked)" type="checkbox" value=""></th>
                                        <th class="center-th" style="width: 80px">影片封面</th>
                                        <th class="center-th" style="width: 100px">影片名称</th>
                                        <th class="center-th" style="width: 100px">导演</th>
                                        <th class="center-th" style="width: 100px">主演</th>
                                        <th class="center-th" style="width: 100px">类型</th>
                                        <th class="center-th" style="width: 80px">制片国家</th>
                                        <th class="center-th" style="width: 80px">上映日期</th>
                                        <th class="center-th" style="width: 150px">剧情简介</th>
                                        <th class="center-th" style="width: 80px">影片地址</th>
                                        <th class="center-th" style="width: 200px">操作</th>
                                    </tr>
                                    </thead>
                                    <%
                                    VideoService videoService=new VideoService();
                                    List<Video> movies=videoService.selectMovie();
                                    for (Video movie:movies){
                                    %>
                                    <tbody>
                                    <tr>
                                        <td class="center" style="line-height: 2;"><input name="arSel" type="checkbox" value="22"></td>
                                        <td class="center" style="line-height: 2;"><img style="width: 20px;height: 30px" src="<%=movie.getImage()%>"></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getMingcheng()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getDaoyan()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getZhuyan()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getLeixing()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getGuojia()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getShijian()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getJieshao()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getPianyuan()%></td>
                                        <td class="center" style="width:200px">
                                            <div class="operation">
                                                <button type="button" class="btn btn-default btn-sm"
                                                        onclick="location.href='/change?mingcheng1=<%=movie.getMingcheng()%>'">
                                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm"
                                                        onclick="location.href='/delete?video=<%=movie.getMingcheng()%>'">
                                                    <span class="glyphicon glyphicon-trash"></span>删除
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm btn-default1">
                                                    <span class="glyphicon glyphicon-edit"></span>查看
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <%
                                    }
                                %>
                                </table>
                            </div>
                            <div id="code">
                                <div class="close1"><a href="javascript:void(0)" id="closebt"><img src="img/close.gif"></a></div>
                                <div class="row4" >
                                    <div class="col-md-12" >
                                        <%
                                            String time=movies.get(0).getShijian();
                                            String year=time.substring(0,time.indexOf("-"));
                                        %>
                                        <h1 class="movie-title" style="margin-top: 0px"><%=movies.get(0).getMingcheng()%><span class="movie-year"><%=year%></span></h1>
                                    </div>
                                    <div class="col-md-2" style="padding-right:5px;">
                                        <a style="display:block;position:relative;">
                                            <img class="img-thumbnail" alt="三毛从军记" width="100%" src="<%=movies.get(0).getImage()%>">
                                        </a>

                                    </div>

                                    <div class="col-md-10" style="padding-right:5px;">
                                        <table class="table table-striped table-condensed table-bordered" style="margin-bottom:5px;font-size:15px;margin-top: 0">
                                            <tbody>
                                            <tr class="table-info">
                                                <td class="span2"><span class="info-label">导演</span></td>
                                                <td><%=movies.get(0).getDaoyan()%></td>
                                            </tr>
                                            <tr class="table-info-w">
                                                <td class="span2"><span class="info-label">主演</span></td>
                                                <td id="casts" style="position:relative;"><%=movies.get(0).getZhuyan()%><a class="casts-swith"></a></td>
                                            </tr>
                                            <tr class="table-info3">
                                                <td class="span2"><span class="info-label">类型</span></td>
                                                <td><%=movies.get(0).getLeixing()%></td>
                                            </tr>
                                            <tr class="table-info-w">
                                                <td class="span2"><span class="info-label">制片国家</span></td>
                                                <td><%=movies.get(0).getGuojia()%></td>
                                            </tr>
                                            <tr class="table-info">
                                                <td class="span2"><span class="info-label">上映日期</span></td>
                                                <td><%=movies.get(0).getShijian()%></td>
                                            </tr>
                                            <tr class="table-info">
                                                <td class="span2"><span class="info-label">片源地址</span></td>
                                                <td><a rel="nofollow" class="score" target="_blank" href="<%=movies.get(0).getPianyuan()%>"><%=movies.get(0).getPianyuan()%><i class="glyphicon glyphicon-new-window"></i></a></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div id="mv-info-juqing">
                                            <p style="color:#777;"><strong>剧情介绍：</strong></p><p class="summary">　
                                            　<%=movies.get(0).getJieshao()%>
                                            <!--<br />-->
                                            <!--　　抗敌有功，三毛高升到后勤部，不用再上战场了，却成了师长姨太太的跟班。整天被使唤也闹了不少笑话。-->
                                            <!--不料兵败师长自杀，三毛又重投兵营。一次执行空降任务时，三毛和以前的知心战友遭到伏击，大难不死却落入深山。-->
                                            <!--一等就等到了抗战结束，三毛和战友早已成了野人。-->
                                        </p>
                                        </div> <!-- end summary -->
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div id="goodcover"></div>

                    </div>

                    <div id="con_one_3" style="display:none;">
                        <div class="cat_add">


                            <div class="col-md-12 movie-item-out admin-yihang">
                                <div class="col-md-8 movie-item-out">
                                    <div class="article_delete">
                                        <button type="button"  class="btn btn-danger" onclick="location.href='admin-add.jsp'" style="width: 112px;">添加</button>
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">删除选定</button>
                                    </div>
                                </div>
                                <div class="col-md-4 movie-item-out2">
                                    <div class="admin-right">
                                        <form class="form-horizontal" method="post" action="SearchMovie">
                                            <div class="col-md-8 admin-bu1">
                                                <input class="form-control" type="text" name="search" placeholder="请输入影片名称" />
                                            </div>
                                            <div class="col-md-3 admin-bu2 ">
                                                <button class="btn btn-danger" style="width: 112px;">查询</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="article_main">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th class="center-th" style="width:28px"><input name="allsel" id="allsel" onclick="oParams.setCtrBox('arSel',this.checked)" type="checkbox" value=""></th>
                                        <th class="center-th" style="width: 80px">影片封面</th>
                                        <th class="center-th" style="width: 100px">影片名称</th>
                                        <th class="center-th" style="width: 100px">导演</th>
                                        <th class="center-th" style="width: 100px">主演</th>
                                        <th class="center-th" style="width: 100px">类型</th>
                                        <th class="center-th" style="width: 80px">制片国家</th>
                                        <th class="center-th" style="width: 80px">上映日期</th>
                                        <th class="center-th" style="width: 150px">剧情简介</th>
                                        <th class="center-th" style="width: 80px">影片地址</th>
                                        <th class="center-th" style="width: 200px">操作</th>
                                    </tr>
                                    </thead>
                                    <%
                                        List<Video> dianshijus=videoService.selectDSJ();
                                        for (Video dianshiju:dianshijus){
                                    %>
                                    <tbody>
                                    <tr>
                                        <td class="center" style="line-height: 2;"><input name="arSel" type="checkbox" value="22"></td>
                                        <td class="center" style="line-height: 2;"><img style="width: 20px;height: 30px" src="<%=dianshiju.getImage()%>"></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getMingcheng()%></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getDaoyan()%></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getZhuyan()%></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getLeixing()%></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getGuojia()%></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getShijian()%></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getJieshao()%></td>
                                        <td class="center" style="line-height: 2;"><%=dianshiju.getPianyuan()%></td>
                                        <td class="center" style="width:200px">
                                            <div class="operation">
                                                <button type="button" class="btn btn-default btn-sm"
                                                        onclick="location.href='/change?mingcheng2=<%=dianshiju.getMingcheng()%>'">
                                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm"
                                                        onclick="location.href='/delete?video=<%=dianshiju.getMingcheng()%>'">
                                                    <span class="glyphicon glyphicon-trash"></span>删除
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm btn-default2">
                                                    <span class="glyphicon glyphicon-edit"></span>查看
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>

                        </div>
                        <div id="goodcover2"></div>

                        <div id="code2">
                            <div class="close1"><a href="javascript:void(0)" id="closebt2"><img src="img/close.gif"></a></div>
                            <div class="row4" >
                                <div class="col-md-12" >
                                    <%
                                        String time1=dianshijus.get(0).getShijian();
                                        String year1=time.substring(0,time1.indexOf("-"));
                                    %>
                                    <h1 class="movie-title" style="margin-top: 0px"><%=dianshijus.get(0).getMingcheng()%><span class="movie-year"><%=year1%></span></h1>
                                </div>
                                <div class="col-md-2" style="padding-right:5px;">
                                    <a style="display:block;position:relative;">
                                        <img class="img-thumbnail" alt="三毛从军记" width="100%" src="<%=dianshijus.get(0).getImage()%>">
                                    </a>

                                </div>

                                <div class="col-md-10" style="padding-right:5px;">
                                    <table class="table table-striped table-condensed table-bordered" style="margin-bottom:5px;font-size:15px;margin-top: 0">
                                        <tbody>
                                        <tr class="table-info">
                                            <td class="span2"><span class="info-label">导演</span></td>
                                            <td><%=dianshijus.get(0).getDaoyan()%></td>
                                        </tr>
                                        <tr class="table-info-w">
                                            <td class="span2"><span class="info-label">主演</span></td>
                                            <td id="casts" style="position:relative;"><%=dianshijus.get(0).getZhuyan()%><a class="casts-swith"></a></td>
                                        </tr>
                                        <tr class="table-info3">
                                            <td class="span2"><span class="info-label">类型</span></td>
                                            <td><%=dianshijus.get(0).getLeixing()%></td>
                                        </tr>
                                        <tr class="table-info-w">
                                            <td class="span2"><span class="info-label">制片国家</span></td>
                                            <td><%=dianshijus.get(0).getGuojia()%></td>
                                        </tr>
                                        <tr class="table-info">
                                            <td class="span2"><span class="info-label">上映日期</span></td>
                                            <td><%=dianshijus.get(0).getShijian()%></td>
                                        </tr>
                                        <tr class="table-info">
                                            <td class="span2"><span class="info-label">片源地址</span></td>
                                            <td><a rel="nofollow" class="score" target="_blank" href="<%=dianshijus.get(0).getPianyuan()%>"><%=movies.get(0).getPianyuan()%><i class="glyphicon glyphicon-new-window"></i></a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div id="mv-info-juqing">
                                        <p style="color:#777;"><strong>剧情介绍：</strong></p><p class="summary">　
                                        　<%=dianshijus.get(0).getJieshao()%>
                                        <!--<br />-->
                                        <!--　　抗敌有功，三毛高升到后勤部，不用再上战场了，却成了师长姨太太的跟班。整天被使唤也闹了不少笑话。-->
                                        <!--不料兵败师长自杀，三毛又重投兵营。一次执行空降任务时，三毛和以前的知心战友遭到伏击，大难不死却落入深山。-->
                                        <!--一等就等到了抗战结束，三毛和战友早已成了野人。-->
                                    </p>
                                    </div> <!-- end summary -->
                                </div>
                            </div>

                        </div>

                    </div>
                    <div id="con_one_4" style="display:none;">
                        <div class="cat_add">

                            <div class="col-md-12 movie-item-out admin-yihang">
                                <div class="col-md-8 movie-item-out">
                                    <div class="article_delete">
                                        <button type="button"  class="btn btn-danger" onclick="location.href='admin-add.jsp'" style="width: 112px;">添加</button>
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">删除选定</button>
                                    </div>
                                </div>
                                <div class="col-md-4 movie-item-out2">
                                    <div class="admin-right">
                                        <form class="form-horizontal" method="post" action="SearchMovie">
                                            <div class="col-md-8 admin-bu1">
                                                <input class="form-control" type="text" name="search" placeholder="请输入影片名称" />
                                            </div>
                                            <div class="col-md-3 admin-bu2 ">
                                                <button class="btn btn-danger" style="width: 112px;">查询</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="article_main">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th class="center-th" style="width:28px"><input name="allsel" id="allsel" onclick="oParams.setCtrBox('arSel',this.checked)" type="checkbox" value=""></th>
                                        <th class="center-th" style="width: 80px">影片封面</th>
                                        <th class="center-th" style="width: 100px">影片名称</th>
                                        <th class="center-th" style="width: 100px">导演</th>
                                        <th class="center-th" style="width: 100px">主演</th>
                                        <th class="center-th" style="width: 100px">类型</th>
                                        <th class="center-th" style="width: 80px">制片国家</th>
                                        <th class="center-th" style="width: 80px">上映日期</th>
                                        <th class="center-th" style="width: 150px">剧情简介</th>
                                        <th class="center-th" style="width: 80px">影片地址</th>
                                        <th class="center-th" style="width: 200px">操作</th>
                                    </tr>
                                    </thead>
                                    <%
                                        List<Video> cartoons=videoService.selectCT();
                                        for (Video cartoon:cartoons){
                                    %>
                                    <tbody>
                                    <tr>
                                        <td class="center" style="line-height: 2;"><input name="arSel" type="checkbox" value="22"></td>
                                        <td class="center" style="line-height: 2;"><img style="width: 20px;height: 30px" src="<%=cartoon.getImage()%>"></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getMingcheng()%></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getDaoyan()%></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getZhuyan()%></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getLeixing()%></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getGuojia()%></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getShijian()%></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getJieshao()%></td>
                                        <td class="center" style="line-height: 2;"><%=cartoon.getPianyuan()%></td>
                                        <td class="center" style="width:200px">
                                            <div class="operation">
                                                <button type="button" class="btn btn-default btn-sm"
                                                        onclick="location.href='/change?mingcheng3=<%=cartoon.getMingcheng()%>'">
                                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm"
                                                        onclick="location.href='/delete?video=<%=cartoon.getMingcheng()%>'">
                                                    <span class="glyphicon glyphicon-trash"></span>删除
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm btn-default3">
                                                    <span class="glyphicon glyphicon-edit"></span>查看
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>

                        </div>
                        <div id="goodcover3"></div>

                        <div id="code3">
                            <div class="close1"><a href="javascript:void(0)" id="closebt3"><img src="img/close.gif"></a></div>
                            <div class="row4" >
                                <div class="col-md-12" >
                                    <%
                                        String time2=dianshijus.get(0).getShijian();
                                        String year2=time.substring(0,time1.indexOf("-"));
                                    %>
                                    <h1 class="movie-title" style="margin-top: 0px"><%=cartoons.get(0).getMingcheng()%><span class="movie-year"><%=year2%></span></h1>
                                </div>
                                <div class="col-md-2" style="padding-right:5px;">
                                    <a style="display:block;position:relative;">
                                        <img class="img-thumbnail" alt="三毛从军记" width="100%" src="<%=cartoons.get(0).getImage()%>">
                                    </a>

                                </div>

                                <div class="col-md-10" style="padding-right:5px;">
                                    <table class="table table-striped table-condensed table-bordered" style="margin-bottom:5px;font-size:15px;margin-top: 0">
                                        <tbody>
                                        <tr class="table-info">
                                            <td class="span2"><span class="info-label">导演</span></td>
                                            <td><%=cartoons.get(0).getDaoyan()%></td>
                                        </tr>
                                        <tr class="table-info-w">
                                            <td class="span2"><span class="info-label">主演</span></td>
                                            <td id="casts" style="position:relative;"><%=cartoons.get(0).getZhuyan()%><a class="casts-swith"></a></td>
                                        </tr>
                                        <tr class="table-info3">
                                            <td class="span2"><span class="info-label">类型</span></td>
                                            <td><%=cartoons.get(0).getLeixing()%></td>
                                        </tr>
                                        <tr class="table-info-w">
                                            <td class="span2"><span class="info-label">制片国家</span></td>
                                            <td><%=cartoons.get(0).getGuojia()%></td>
                                        </tr>
                                        <tr class="table-info">
                                            <td class="span2"><span class="info-label">上映日期</span></td>
                                            <td><%=cartoons.get(0).getShijian()%></td>
                                        </tr>
                                        <tr class="table-info">
                                            <td class="span2"><span class="info-label">片源地址</span></td>
                                            <td><a rel="nofollow" class="score" target="_blank" href="<%=cartoons.get(0).getPianyuan()%>"><%=movies.get(0).getPianyuan()%><i class="glyphicon glyphicon-new-window"></i></a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div id="mv-info-juqing">
                                        <p style="color:#777;"><strong>剧情介绍：</strong></p><p class="summary">　
                                        　<%=cartoons.get(0).getJieshao()%>
                                        <!--<br />-->
                                        <!--　　抗敌有功，三毛高升到后勤部，不用再上战场了，却成了师长姨太太的跟班。整天被使唤也闹了不少笑话。-->
                                        <!--不料兵败师长自杀，三毛又重投兵营。一次执行空降任务时，三毛和以前的知心战友遭到伏击，大难不死却落入深山。-->
                                        <!--一等就等到了抗战结束，三毛和战友早已成了野人。-->
                                    </p>
                                    </div> <!-- end summary -->
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>


<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src='js/bootstrap.min.js'></script>
<script src="js/admin-index.js" type="text/javascript"></script>


</body>
</html>
