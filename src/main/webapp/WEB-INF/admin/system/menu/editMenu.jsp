<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <title>编辑菜单</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <link rel="stylesheet"
    href="/plugins/fontawesome-iconpicker/dist/css/fontawesome-iconpicker.css"/>
    <script src="/plugins/fontawesome-iconpicker/dist/js/fontawesome-iconpicker.js"></script>
    <%-- 引用select2控件 --%>
    <jsp:include page="../../common/select2.jsp"/>
</head>
<body ng-controller="myBody">
<div>
    <section class="content-header">
        <h1>
            菜单
            <small>编辑</small>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">编辑</h3>
                        <div class="box-tools pull-right">
                            <div class="btn-group pull-right"
                                 style="margin-right: 5px">
                                <a href="/system/menus"
                                   class="btn btn-sm btn-default" title="列表"><i
                                        class="fa fa-list"></i><span
                                        class="hidden-xs">&nbsp;列表</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="box-body" style="display: block">
                        <form method="POST" action="" class="form-horizontal"
                              accept-charset="UTF-8" pjax-container=1>
                            <div class="box-body fields-group">
                                <div class="form-group">
                                    <label class="col-sm-2  control-label">父级菜单</label>

                                    <div class="col-sm-8">
                                        <select class="form-control menuList"
                                                id="menus">
                                            <option ng-repeat="item in menusSelectBoxData"
                                                    value="{{item.id}}">
                                                {{item.title}}
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
                                                   ng-model="menu.title">
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
                                                   placeholder="输入图标"
                                                   ng-model="menu.icon">
                                        </div>

                                        <span class="help-block">
                                         <i class="fa fa-info-circle"></i>
                                         &nbsp;For more icons please see
                                         <a href="http://fontawesome.io/icons/"
                                            target="_blank">http://fontawesome.io/icons/</a>
                                     </span>

                                        <div class="iconpicker-popover popover fade">
                                            <div class="arrow"></div>
                                            <div class="popover-title"><input
                                                    type="search"
                                                    class="form-control iconpicker-search"
                                                    placeholder="Type to filter">
                                            </div>
                                            <div class="popover-content">
                                                <div class="iconpicker">
                                                    <div class="iconpicker-items">
                                                        <%-- TODO ICON 标签列表--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group  ">
                                    <label for="uri"
                                           class="col-sm-2  control-label">路径</label>

                                    <div class="col-sm-8">
                                        <div class="input-group">
                                     <span class="input-group-addon">
                                         <i class="fa fa-pencil fa-fw"></i>
                                     </span>

                                            <input type="text" id="uri"
                                                   name="uri"
                                                   value=""
                                                   class="form-control uri"
                                                   placeholder="输入路径"
                                                   ng-model="menu.url">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-md-2"></div>

                                <div class="col-md-8">
                                    <div class="btn-group pull-left">
                                        <button type="reset"
                                                class="btn btn-warning pull-right">
                                            重置
                                        </button>
                                    </div>

                                    <div class="btn-group pull-right">
                                        <button type="button"
                                                ng-click="edit()"
                                                class="btn btn-info pull-right">
                                            修改
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </section>
</div>
</body>
<jsp:include page="editMenu-js.jsp"/>
<jsp:include page="../../common/footer.jsp" />
</html>
