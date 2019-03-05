<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/18
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="app">
<head>
    <title>授权列表</title>
    <jsp:include page="../../common/adminLTE-head.jsp"/>
    <jsp:include page="../../common/z-tree.jsp"/>
    <style>
        ul.ztree li {
            white-space: normal !important
        }

        ul.ztree li span.button.switch {
            margin-right: 5px
        }

        ul.ztree ul ul li {
            display: inline-block;
            white-space: normal
        }

        ul.ztree > li {
            padding: 15px 25px 15px 15px;
        }

        ul.ztree > li > ul {
            margin-top: 12px;
            border-top: 1px solid rgba(0, 0, 0, .1);
        }

        ul.ztree > li > ul > li {
            padding: 5px
        }

        ul.ztree > li > a > span {
            font-size: 15px;
            font-weight: 700
        }
    </style>
</head>
<body ng-controller="myBody">
<section class="content-header">
    <h1>
        授权
        <small>列表</small>
    </h1>
</section>

<section class="content">
    <div class="row">
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header">
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
                    <ul id="zTree" class="ztree">
                        <li></li>
                    </ul>
                </div>
                <div class="box-footer"
                     style="display: flex;justify-content: center;">
                        <div class="btn-group pull-left" style="width: 60px;margin-right: 15px;">
                        <button class="btn btn-success" ng-click="save()">
                            <i class="fa fa-save"></i>
                            保存
                        </button>
                    </div>
                    <div class="btn-group pull-right" style="width: 60px;">
                        <button class="btn btn-warning" ng-click="cancel()">
                            取消
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<jsp:include page="auth-js.jsp"/>
<jsp:include page="../../common/footer.jsp" />
</html>
