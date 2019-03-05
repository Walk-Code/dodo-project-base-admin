<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/19
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <title>系统节点列表</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <jsp:include page="../../common/iCheck.jsp"/>
    <script src="/assets/js/angular-sanitize.js"></script>
    <style>
        .td-content {
            display: flex;
            justify-content: center;
            width: 100%;
            /* align-items: center; */
            /* vertical-align: middle; */
            /* flex-direction: inherit; */
            justify-items: center;
            margin-top: 2px;
        }
    </style>
</head>
<body ng-controller="myBody">
<section class="content-header">
    <h1>
        菜单节点
        <small>列表</small>
    </h1>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-warning">
                <div class="box-header with-border">
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
                            <td></td>
                            <td>
                                <div class="td-content">
                                    <label>
                                        <span>|-&nbsp;&nbsp;</span>
                                        <input type="checkbox" icheck
                                               ng-model="isAuthAllChecked"
                                               ng-change="selectedAllAuth()"/>
                                        <span ng-bind="'全部加入权限控制'"></span>
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="td-content">
                                    <label>
                                        <span>|-&nbsp;&nbsp;</span>
                                        <input type="checkbox" icheck
                                               ng-model="isMenuAllChecked"
                                               ng-change="selectedAllMenu()"/>
                                        <span ng-bind="'全部设为菜单'"></span>
                                    </label>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr ng-repeat="node in nodeList">
                            <td style="text-align: left">
                                <span ng-bind-html="node.separator"></span>
                                <span ng-bind="node.url"></span>
                                <input type="text" value="{{node.title}}"
                                       style="padding-left: 10px"/>
                            </td>
                            <td class="td-center">
                                <div class="td-content">
                                    <label>
                                        <span>|-&nbsp;&nbsp;</span>
                                        <input type="checkbox" icheck
                                               ng-model="node.auth"
                                               ng-checked="node.auth"
                                               ng-change="checkUncheckAuthHeader()"
                                        />
                                        <span ng-bind="'加入权限控制'"></span>
                                    </label>
                                </div>
                            </td>
                            <td class="td-center">
                                <div class="td-content">
                                    <label>
                                        <span>|-&nbsp;&nbsp;</span>
                                        <input type="checkbox" icheck
                                               ng-model="node.menu"
                                               ng-checked="node.menu"
                                               ng-change="checkUncheckMenuHeader()"
                                        />
                                        <span ng-bind="'设为菜单'"></span>
                                    </label>
                                </div>
                            </td>
                            <td width="50%"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer">

                </div>
            </div>
        </div>
    </div>
</section>
</body>
<jsp:include page="../../common/initAngularDirective.jsp"/>
<jsp:include page="index-js.jsp"/>
<jsp:include page="../../common/footer.jsp" />
</html>
