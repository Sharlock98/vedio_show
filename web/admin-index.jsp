<%@ page import="entity.Video" %>
<%@ page import="Service.VideoService" %>
<%@ page import="java.util.List" %><%--
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
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">添加</button>
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">删除选定</button>
                                    </div>
                                </div>
                                <div class="col-md-4 movie-item-out2">
                                    <div class="admin-right">
                                        <form class="form-horizontal" method="post" action="#">
                                            <div class="col-md-8 admin-bu1">
                                                <input class="form-control" type="text" name="cat_add" value="" placeholder="请输入影片名称" />
                                            </div>
                                            <div class="col-md-3 admin-bu2 ">
                                                <button type="button"  class="btn btn-danger" style="width: 112px;">查询</button>
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
                                        <th class="center-th" style="width: 50px">评分</th>
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
                                        <td class="center" style="line-height: 2;">6.2</td>
                                        <td class="center" style="line-height: 2;"><%=movie.getJieshao()%></td>
                                        <td class="center" style="line-height: 2;"><%=movie.getPianyuan()%></td>
                                        <td class="center" style="width:200px">
                                            <div class="operation">
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-trash"></span>删除
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm">
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

                    </div>

                    <div id="con_one_3" style="display:none;">
                        <div class="cat_add">


                            <div class="col-md-12 movie-item-out admin-yihang">
                                <div class="col-md-8 movie-item-out">
                                    <div class="article_delete">
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">添加</button>
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">删除选定</button>
                                    </div>
                                </div>
                                <div class="col-md-4 movie-item-out2">
                                    <div class="admin-right">
                                        <form class="form-horizontal" method="post" action="#">
                                            <div class="col-md-8 admin-bu1">
                                                <input class="form-control" type="text" name="cat_add" value="" placeholder="请输入影片名称" />
                                            </div>
                                            <div class="col-md-3 admin-bu2 ">
                                                <button type="button"  class="btn btn-danger" style="width: 112px;">查询</button>
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
                                        <th class="center-th" style="width: 80px">更新状态</th>
                                        <th class="center-th" style="width: 80px">上映日期</th>
                                        <th class="center-th" style="width: 50px">评分</th>
                                        <th class="center-th" style="width: 150px">剧情简介</th>
                                        <th class="center-th" style="width: 200px">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="center" style="line-height: 2;"><input name="arSel" type="checkbox" value="22"></td>
                                        <td class="center" style="line-height: 2;">img</td>
                                        <td class="center" style="line-height: 2;">hgdjksdjsksksdkdjskggggg</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">dddddddddddddddddddddd</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">一人</td>
                                        <td class="center" style="line-height: 2;">6.2</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="width:200px">
                                            <div class="operation">
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-trash"></span>删除
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-edit"></span>查看
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <div id="con_one_4" style="display:none;">
                        <div class="cat_add">


                            <div class="col-md-12 movie-item-out admin-yihang">
                                <div class="col-md-8 movie-item-out">
                                    <div class="article_delete">
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">添加</button>
                                        <button type="button"  class="btn btn-danger" style="width: 112px;">删除选定</button>
                                    </div>
                                </div>
                                <div class="col-md-4 movie-item-out2">
                                    <div class="admin-right">
                                        <form class="form-horizontal" method="post" action="#">
                                            <div class="col-md-8 admin-bu1">
                                                <input class="form-control" type="text" name="cat_add" value="" placeholder="请输入影片名称" />
                                            </div>
                                            <div class="col-md-3 admin-bu2 ">
                                                <button type="button"  class="btn btn-danger" style="width: 112px;">查询</button>
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
                                        <th class="center-th" style="width: 80px">更新状态</th>
                                        <th class="center-th" style="width: 80px">上映日期</th>
                                        <th class="center-th" style="width: 50px">评分</th>
                                        <th class="center-th" style="width: 150px">剧情简介</th>
                                        <th class="center-th" style="width: 200px">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="center" style="line-height: 2;"><input name="arSel" type="checkbox" value="22"></td>
                                        <td class="center" style="line-height: 2;">img</td>
                                        <td class="center" style="line-height: 2;">hgdjksdjsksksdkdjskggggg</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">dddddddddddddddddddddd</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="line-height: 2;">一人</td>
                                        <td class="center" style="line-height: 2;">6.2</td>
                                        <td class="center" style="line-height: 2;">一人之下</td>
                                        <td class="center" style="width:200px">
                                            <div class="operation">
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-trash"></span>删除
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <span class="glyphicon glyphicon-edit"></span>查看
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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
