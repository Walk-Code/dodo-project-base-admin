<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/24
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="auth" uri="http://auth.dodo1.com/tags" %>
<html ng-app="app">
<head>
    <title>添加角色</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <jsp:include page="../../common/select2.jsp"/>
    <style type="text/css">
        div ul {
            list-style: none;
            padding-left: 0;
            margin-top: 25px;
        }

        div ul li {
            border: 1px solid black;
            display: inline-block;
            padding: 5px 10px;
            margin-right: 5px;
            margin-bottom: 5px;
            text-transform: capitalize;
        }

        .fa-times-circle {
            cursor: pointer;
        }


    </style>
</head>
<body ng-controller="myBody">
<section class="content-header">
    添加用户
</section>
<section class="content">
    <div class="row">
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">编辑</h3>
                    <div class="box-tools pull-right">
                        <div class="btn-group pull-right"
                             style="margin-right: 5px">
                            <a href="/systemUserGroup/index"
                               class="btn btn-sm btn-default" title="列表"><i
                                    class="fa fa-list"></i><span
                                    class="hidden-xs">&nbsp;列表</span></a>
                        </div>
                    </div>
                </div>
                <div class="box-body">
                    <form method="POST" action="" class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色列表</label>
                                <div class="col-sm-6">
                                    <select class="form-control" id="roleList">
                                        <option ng-repeat="item in roleList"
                                                value="{{item.id}}"
                                                ng-bind="item.title+'角色'"></option>
                                    </select>
                                </div>
                                <div class="col-sm-2 control-label"
                                     style="text-align: left">
                                    <button type="button"
                                            class="btn btn-primary btn-xs"
                                            ng-click="addRole()">添加
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-6">
                                    <ul id="userGroupUl">
                                        <li ng-repeat="item in group.systemRolesList">
                                            <span ng-bind="item.title+'角色'"></span>
                                            <auth:hasPermission name="/systemUserGroup/removeRoleToGroup">
                                                <span class="fas fa-times-circle"
                                                      ng-click="deleteRole($index)"></span>
                                            </auth:hasPermission>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="box-footer">

                </div>
            </div>
        </div>
    </div>
</section>
</body>
<jsp:include page="addRole-js.jsp"/>
<jsp:include page="../../common/footer.jsp"/>
</html>
