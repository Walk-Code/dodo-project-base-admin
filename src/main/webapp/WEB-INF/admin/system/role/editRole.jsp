<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/22
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <title>角色编辑</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <jsp:include page="../../common/select2.jsp"/>
</head>
<body ng-controller="myBody">
<section class="content-header">
    <h1>角色
        <small>编辑</small>
    </h1>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-warning">
                <div class="box-header with-border">
                    <h3 class="box-title">编辑</h3>
                    <div class="box-tools pull-right">
                        <div class="btn-group pull-right"
                             style="margin-right: 5px">
                            <a href="/systemRoles/index"
                               class="btn btn-sm btn-default" title="列表"><i
                                    class="fa fa-list"></i><span
                                    class="hidden-xs">&nbsp;列表</span></a>
                        </div>
                    </div>
                </div>
                <div class="box-body">
                    <form method="POST" action="" class="form-horizontal"
                          accept-charset="UTF-8" pjax-container=1>
                        <div class="box-body" style="display: block">
                            <form method="POST" action=""
                                  class="form-horizontal"
                                  accept-charset="UTF-8" pjax-container=1>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="title"
                                               class="col-sm-2  control-label">角色名称</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                 <span class="input-group-addon">
                                                     <i class="fa fa-bars"></i>
                                                 </span>
                                                <input type="text" id="title"
                                                       name="title"
                                                       value=""
                                                       class="form-control title"
                                                       placeholder="输入角色名称"
                                                       ng-model="systemRole.title"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="title"
                                               class="col-sm-2  control-label">角色描述</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                 <span class="input-group-addon">
                                                     <i class="fa fa-bars"></i>
                                                 </span>
                                                <input type="text" id="remark"
                                                       name="remark"
                                                       value=""
                                                       class="form-control title"
                                                       placeholder="输入角色描述"
                                                       ng-model="systemRole.remark"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2  control-label">用户组</label>

                                        <div class="col-sm-8">
                                            <select class="single-select"
                                                    style="width: 100%" name="userGroup[]" multiple="multiple">
                                                <option ng-repeat="item in userGroupList"
                                                        value="{{item.id}}" ng-bind="item.name">
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="col-md-2"></div>

                                    <div class="col-md-8">
                                        <div class="btn-group pull-left">
                                            <button ng-click="edit()"
                                                    type="button"
                                                    class="btn btn-warning pull-right">
                                                修改
                                            </button>
                                        </div>

                                        <div class="btn-group pull-right">
                                            <button type="reset" class="btn btn-info pull-right">
                                                重置
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </form>
                </div>
            </div>
            <div class="box-footer"></div>
        </div>
    </div>
    </div>
</section>
</body>
<jsp:include page="editRole-js.jsp" />
<jsp:include page="../../common/footer.jsp" />
</html>
