
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>影片资料添加</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="./css/admin-add.css" />
</head>
<body ng-app="App" ng-controller="mainController" class="ng-scope">


<div class="admin-zhu">
    <div class="title">影片资料添加</div>
    <hr />
    <div class="container">
        <div class="col-lg-12">

            <form class="form-horizontal" method="post" action="add" enctype="multipart/form-data">
                <div class="col-lg-4">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">影片类型</label>
                        <label class="checkbox-inline" style="width:75px;">
                            <input type="radio" name="species" value="电影" checked><span class="radio-text">电影</span>
                        </label>
                        <label class="checkbox-inline" style="width:75px;">
                            <input type="radio" name="species" value="动漫"><span class="radio-text" span>动漫</span>
                        </label>
                        <label class="checkbox-inline" style="width:75px;">
                            <input type="radio" name="species" value="电视剧"><span class="radio-text">电视剧</span>
                        </label>
                    </div>


                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">影片海报</label>
                        <div class="col-lg-3">
                           <input style="border-radius: 0px 2px 2px 2px" class="file" name="image" size="690x966"  rate="0.2" type="text" value="" />
                            <input type="hidden" name="old_goods_img" value="" />
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">影片名称</label>
                            <input style="border-radius: 0 2px 2px 0;width: 265px;height: 30px" class="form-control input-lg" type="text" name="mingcheng" value="" placeholder="请输入1-15个字符" />
                    </div>
                </div>


                <div class="col-lg-6">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">导演</label>
                            <input style="border-radius: 0 2px 2px 0;height: 30px" class="form-control input-lg" type="text" name="daoyan" value="" placeholder="请输入1-20个字符" />
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">主演</label>
                            <input style="border-radius: 0 2px 2px 0;height: 30px" class="form-control input-lg" type="text" name="zhuyan" value="" placeholder="格式：XX/XX/XX/ (1-15字符)" />
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">类型</label>
                            <input style="border-radius: 0 2px 2px 0;height: 30px" class="form-control input-lg" type="text" name="leixing" value="" placeholder="格式：XX/XX/XX/ (1-15字符)" />
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">制片国家</label>
                            <input style="border-radius: 0 2px 2px 0;height: 30px" class="form-control input-lg" type="text" name="guojia" value="" placeholder="请输入1-10个字符" />
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">上映日期</label>
                            <input style="border-radius: 0 2px 2px 0;height: 30px" class="form-control input-lg" type="text" name="shijian" value="" placeholder="格式：XXXX-XX-XX" />
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">剧情简介</label>
                        <textarea style="border-radius: 0 2px 2px 0;width: 400px;" class="form-control" rows="5" name="jieshao" placeholder="请输入1-150个字符"></textarea>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-md-1">视频地址</label>
                        <input style="border-radius: 0 2px 2px 0;height: 30px" class="form-control input-lg" type="text" name="pianyuan" value="" />
                    </div>

                    <div class="form-group form-group-sm" style="margin-top: 30px;">
                    </div>

                    <div class="btn-group">
                        <button style="width: 200px" type="button" class="btn btn-default btn-sm" onclick="history.back()" title="返回"><i class="glyphicon glyphicon-chevron-left"></i> 返回</button>
                        <button style="width:200px" type="submit" class="btn btn-danger btn-sm" title="添加"><i class="glyphicon glyphicon-floppy-save"></i> 添加</button>
                    </div>

                </div>
            </form>

        </div>
    </div>
</div>
<hr />
<script type="text/javascript" src="./js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./js/add/angular.min.js"></script>
<script type="text/javascript" src="./js/add/ocLazyLoad.min.js"></script>
<script type="text/javascript" src="./js/add/provider.js"></script>
<script type="text/javascript" src="./js/add/service.js"></script>
<script type="text/javascript" src="./js/add/directives.js"></script>
<script type="text/javascript" src="./js/add/filters.js"></script>
<script type="text/javascript" src="./js/add/app.js"></script>
</body>
</html>
