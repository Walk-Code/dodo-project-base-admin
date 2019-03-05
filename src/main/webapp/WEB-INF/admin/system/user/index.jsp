<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/24
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="auth" uri="http://auth.dodo1.com/tags" %>
<html ng-app="app">
<head>
    <title>用户管理</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <jsp:include page="../../common/iCheck.jsp"/>
</head>
<body ng-controller="myBody">
<section class="content-header">
    <h1>
        用户
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
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>电子邮箱</th>
                            <th>登录次数</th>
                            <th>最后登录</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <tr ng-show="userGroupList.length == 0">
                            <td colspan="8">无数据~</td>
                        </tr>
                        <tr ng-repeat="item in userGroupList">
                            <td ng-bind="item.username"></td>
                            <td ng-bind="item.phone"></td>
                            <td ng-bind="item.email"></td>
                            <td ng-bind="item.loginNum"></td>
                            <td ng-bind="item.updateTime | date: 'yyyy-MM-dd HH:mm:ss' "></td>
                            <td>
                                <span class="label label-success"
                                      ng-show="item.status == 2"
                                      ng-bind="'使用中'"></span>
                                <span class="label label-danger"
                                      ng-show="item.status == 1"
                                      ng-bind="'禁用'"></span>
                            </td>
                            <td>
                                <a class="btn btn-info btn-xs"
                                   ng-click="edit(item)">编辑</a>

                                <a class="btn btn-warning btn-xs"
                                   ng-show="item.status == 2"
                                   ng-click="enable(item, 1)">禁用</a>
                                <a class="btn btn-primary btn-xs"
                                   ng-show="item.status == 1"
                                   ng-click="enable(item, 2)">启用</a>
                                <auth:hasPermission name="/systemUser/del">
                                    <a class="btn btn-danger btn-xs"
                                       ng-click="del(item.id)">删除</a>
                                </auth:hasPermission>
                                <auth:hasPermission name="/systemUser/changePassword">
                                    <a class="btn btn-danger btn-xs"
                                       ng-click="updatePassword(item)">修改密码</a>
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
<jsp:include page="../../common/initAngularDirective.jsp"/>
<jsp:include page="addUser-modal.jsp"/>
<jsp:include page="changePassword-modal.jsp" />
<jsp:include page="index-js.jsp"/>
<jsp:include page="../../common/footer.jsp"/>
