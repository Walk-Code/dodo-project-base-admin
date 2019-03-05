<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/10
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <title>系统参数配置</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <%@ taglib prefix="auth" uri="http://auth.dodo1.com/tags" %>
</head>
<body ng-controller="myBody">
<section class="content-header">
    系统参数配置
</section>
<section class="content">
    <div class="row">
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">编辑</h3>
                </div>

                <div class="box-body">
                    <form class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <div class="col-sm-4 control-label">程序名称</div>
                                <div class="col-sm-7">
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bars"></i>
                                    </span>
                                        <input type="text" class="form-control"
                                               placeholder="请输入程序名称"
                                               ng-model="config.appName"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">程序版本</div>
                                <div class="col-sm-7">
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bars"></i>
                                    </span>
                                        <input type="text" class="form-control"
                                               placeholder="请输入程序版本"
                                               ng-model="config.appVersion"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">网站名称</div>
                                <div class="col-sm-7">
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bars"></i>
                                    </span>
                                        <input type="text" class="form-control"
                                               placeholder="请输入网站名称"
                                               ng-model="config.siteName"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">版权信息</div>
                                <div class="col-sm-7">
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bars"></i>
                                    </span>
                                        <input type="text" class="form-control"
                                               placeholder="请输入版权信息"
                                               ng-model="config.copyRight"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">浏览器图标</div>
                                <div class="col-sm-7">
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bars"></i>
                                    </span>
                                        <input type="text" class="form-control"
                                               placeholder="请输入浏览器图标"
                                               ng-model="config.browser"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">网站备案</div>
                                <div class="col-sm-7">
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bars"></i>
                                    </span>
                                        <input type="text" class="form-control"
                                               placeholder="请输入网站备案"
                                               ng-model="config.miitbeian"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <auth:hasPermission name="/systemConfig/updateSystemConfig">
                    <div class="box-footer"
                         style="display: flex;justify-content: center">
                        <button type="button" class="btn btn-info"
                                ng-click="save()">保存配置
                        </button>
                    </div>
                </auth:hasPermission>
            </div>
        </div>
    </div>
</section>
</body>
<jsp:include page="index-js.jsp"/>
<jsp:include page="../../common/footer.jsp"/>
</html>
