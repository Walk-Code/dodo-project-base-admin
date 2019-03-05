<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/24
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <title>用户组管理</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
</head>
<body ng-controller="myBody">
<section class="content-header">
    <h1>
        用户组
        <small>管理</small>
    </h1>
</section>
<section class="content">
    <div class="row">
        <div class="col-sm-12">
            <div class="box">
                <div class="box-header box-info">
                    <div class="pull-right">
                        <a class="btn btn-sm btn-success" title="新增"
                           ng-click="create()">
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
                            <th>添加时间</th>
                            <th>操作</th>
                        </tr>
                        <tr ng-show="userGroupList.length == 0">
                            <td colspan="6">无数据~</td>
                        </tr>
                        <tr ng-repeat="item in userGroupList">
                            <td ng-bind="item.name"></td>
                            <td ng-bind="item.remark"></td>
                            <td ng-bind="item.createTime | date: 'yyyy-MM-dd HH:mm:ss' "></td>
                            <td>
                                <a class="btn btn-info btn-xs"
                                   ng-click="edit(item)">编辑</a>
                                <a class="btn btn-primary btn-xs"
                                   ng-click="jumpPath(item.id)">添加组成员</a>
                                <a class="btn btn-warning btn-xs" ng-click="addRole(item.id)">添加角色</a>
                                <a class="btn btn-danger btn-xs" ng-click="del(item.id)">删除</a>
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
<jsp:include page="index-js.jsp"/>
<jsp:include page="addUserGroup-modal.jsp"/>
<jsp:include page="../../common/footer.jsp" />
</html>
