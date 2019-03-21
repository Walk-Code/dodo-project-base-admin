<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="auth" uri="http://auth.dodo.com/tags" %>
<html ng-app="app">
<head>
    <title>角色列表</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <link rel="stylesheet" href="/plugins/adminLTE/plugins/iCheck/all.css">
    <script type="text/javascript"
            src="/plugins/adminLTE/plugins/iCheck/icheck.js"></script>
</head>
<body ng-controller="myBody">
<section class="content-header">
    <h1>
        角色
        <small>列表</small>
    </h1>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <div class="pull-right">
                        <a class="btn btn-sm btn-success" title="新增"
                           ng-click="showModal()">
                            <i class="fa fa-save"></i>
                            <span class="hidden-xs">新增</span>
                        </a>
                    </div>
                </div>
                <div class="box-body table-responsive">
                    <table class="table table-hover table-bordered">
                        <tbody>
                        <tr>
                            <th>名称</th>
                            <th>描述</th>
                            <th>状态</th>
                            <th>添加时间</th>
                            <th>操作</th>
                        </tr>
                        <tr ng-repeat="item in roleList">
                            <td ng-bind="item.title"></td>
                            <td ng-bind="item.remark"></td>
                            <td>
                                <span class="label label-success"
                                      ng-show="item.status == 2"
                                      ng-bind="'可用'"></span>
                                <span class="label label-danger"
                                      ng-show="item.status == 1"
                                      ng-bind="'禁用'"></span>
                            </td>
                            <td ng-bind="item.createTime | date: 'yyyy-MM-dd HH:mm:ss' "></td>
                            <td>
                                <a class="btn btn-info btn-xs"
                                   ng-click="edit(item.id)">编辑</a>
                                <a class="btn btn-success btn-xs"
                                   ng-click="jumpAuth(item.id)">授权</a>
                                <a class="btn btn-warning btn-xs"
                                   ng-show="item.status == 2"
                                   ng-click="enable(item, 1)">禁用</a>
                                <a class="btn btn-primary btn-xs"
                                   ng-show="item.status == 1"
                                   ng-click="enable(item, 2)">启用</a>
                                <auth:hasPermission name="/systemRoles/delRole">
                                    <a class="btn btn-danger btn-xs"
                                       ng-click="del(item.id)">删除</a>
                                </auth:hasPermission>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer">
                    <jsp:include page="../../common/pagination.jsp"/>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<jsp:include page="addRole-modal.jsp"/>
<jsp:include page="index-js.jsp"/>
<jsp:include page="../../common/footer.jsp"/>
</html>
