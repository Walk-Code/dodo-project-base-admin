<%--
<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/29
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="auth" uri="http://auth.dodo1.com/tags" %>
<html ng-app="app">
<head>
    <title>系统菜单栏</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <link rel="stylesheet"
           href="/plugins/fontawesome-iconpicker/dist/css/fontawesome-iconpicker.css"/>
    <script src="/plugins/fontawesome-iconpicker/dist/js/fontawesome-iconpicker.js"></script>
    <%-- 引用select2控件 --%>
    <jsp:include page="../../common/select2.jsp"/>
    <%-- 引用拖拽树控件 --%>
    <jsp:include page="../../common/angularjs-ui-tree.jsp"/>
    <script src="/assets/js/angular-sanitize.js"></script>
</head>
<body ng-controller="myBody">
<section class="content-header">
    <h1>
        菜单
        <small>列表</small>
    </h1>
</section>
<script type="text/ng-template" id="nodes_renderer.html">
    <div ui-tree-handle class="tree-node tree-node-content">
        <a class="btn btn-success btn-xs" style="width: 25px;height: 20px;"
           ng-if="node.children && node.children.length > 0" data-nodrag
           ng-click="toggle(this)"><span
                class="glyphicon"
                ng-class="{
          'glyphicon-chevron-right': collapsed,
          'glyphicon-chevron-down': !collapsed
        }"></span></a>
        {{node.text}}
        <auth:hasPermission name="/system/menus/disable">
        <a class="pull-right btn btn-xs" data-nodrag ng-click="delMenu(node.id)" style="margin-right: 8px;"><i class="fa fa-trash"></i></a>
        </auth:hasPermission>
        <a class="pull-right btn btn-xs" data-nodrag ng-click="editMemu(node)"><i class="fa fa-edit"></i></a>

    </div>
    <ol ui-tree-nodes="" ng-model="node.children"
        ng-class="{hidden: collapsed}">
        <li ng-repeat="node in node.children" ui-tree-node
            ng-include="'nodes_renderer.html'">
        </li>
    </ol>
</script>

<section class="content">
    <div class="row">
        <%-- 系统菜单栏 --%>
        <div class="col-md-6">
            <div class="box">
                <div class="box-header">
                    <div class="btn-group">
                        <a class="btn btn-primary btn-sm"
                           data-action="expand-all"
                           title="展开" ng-click="expandAll()">
                            <i class="fas fa-plus-square"></i>
                            <span class="hidden-xs">&nbsp;展开</span>
                        </a>
                        <a class="btn btn-primary btn-sm" data-action="collapse"
                           title="收起" ng-click="collapseAll()">
                            <i class="fas fa-minus-square"></i>
                            <span class="hidden-xs">&nbsp;收起</span>
                        </a>
                    </div>
                    <auth:hasPermission name="/system/menus/saveJsonTree">
                    <div class="btn-group">
                        <a class="btn btn-info btn-sm tree-5c025773e35ca-save"
                           title="保存">
                            <i class="fa fa-save"></i>
                            <span class="hidden-xs" ng-click="saveTree()">&nbsp;保存</span>
                        </a>
                    </div>
                    </auth:hasPermission>

                    <div class="btn-group">
                        <a class="btn btn-warning btn-sm tree-5c025773e35ca-save"
                           title="刷新">
                            <i class="fas fa-sync-alt"></i>
                            <span class="hidden-xs">&nbsp;刷新</span>
                        </a>
                    </div>
                </div>
                <div class="box-body table-responsive no-padding">
                    <div ui-tree id="tree-root">
                        <ol ui-tree-nodes ng-model="jsonTree">
                            <li ng-repeat="node in jsonTree" ui-tree-node
                                ng-include="'nodes_renderer.html'"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <%-- 添加系统菜单栏--%>
        <div class="col-md-6">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">新增</h3>
                    <div class="box-tools pull-right"></div>
                </div>
                <div class="box-body" style="display: block">
                    <form method="POST" action="" class="form-horizontal"
                          accept-charset="UTF-8" pjax-container=1>
                        <div class="box-body fields-group">
                            <div class="form-group">
                                <label class="col-sm-2  control-label">父级菜单</label>

                                <div class="col-sm-8">
                                    <select class="form-control parentId"
                                            style="width: 100%" id="menus">
                                        <option ng-repeat="item in menusSelectBoxData"
                                                value="{{item.id}}" ng-bind-html="item.separator+item.title">
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="title"
                                       class="col-sm-2  control-label">标题</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                     <span class="input-group-addon">
                                         <i class="fa fa-bars"></i>
                                     </span>
                                        <input type="text" id="title"
                                               name="title"
                                               value=""
                                               class="form-control title"
                                               placeholder="输入标题"
                                               ng-model="title">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <label for="icon"
                                       class="col-sm-2  control-label">图标</label>

                                <div class="col-sm-8">
                                    <div class="input-group iconpicker-container">
                                     <span class="input-group-addon">
                                         <i class="fa fa-bars"></i>
                                     </span>
                                        <input style="width: 140px"
                                               type="text"
                                               id="icon" name="icon"
                                               value=""
                                               class="form-control"
                                               autocomplete="off" <%--关闭input自动提示--%>
                                               placeholder="输入图标">
                                    </div>

                                    <span class="help-block">
                                         <i class="fa fa-info-circle"></i>
                                         &nbsp;For more icons please see
                                         <a href="http://fontawesome.io/icons/"
                                            target="_blank">http://fontawesome.io/icons/</a>
                                     </span>

                                </div>
                            </div>
                            <div class="form-group  ">
                                <label for="uri"
                                       class="col-sm-2  control-label">路径</label>

                                <div class="col-sm-8">
                                    <div class="input-group">
                                     <span class="input-group-addon">
                                        <i class="fas fa-pencil-alt"></i>
                                     </span>

                                        <input type="text" id="uri"
                                               name="uri"
                                               value=""
                                               class="form-control uri"
                                               placeholder="输入路径"
                                               ng-model="url">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="box-footer">
                <div class="col-md-2"></div>
                <auth:hasPermission name="/system/menus/addRoute">
                        <div class="col-md-8">
                        <div class="btn-group pull-left">
                        <button type="reset"
                        class="btn btn-warning pull-right">
                        重置
                        </button>
                        </div>
                        <div class="btn-group pull-right">
                        <button type="button"
                        ng-click="addRoute()"
                        class="btn btn-info pull-right">提交
                        </button>
                        </div>

                        </div>
                </auth:hasPermission>
                </div>
            </div>
        </div>
</section>
</body>
<jsp:include page="index-js.jsp"/>
<jsp:include page="../../common/footer.jsp" />
</html>
