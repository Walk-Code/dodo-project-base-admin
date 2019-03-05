<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/8
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="app">
<head>
    <jsp:include page="../common/adminLTE-head.jsp"/>
</head>
<!-- /header -->
<body class="hold-transition skin-blue sidebar-mini" ng-controller="myBody">
<div class="wrapper">
    <jsp:include page="../common/adminLTE-header.jsp"/>
    <jsp:include page="../common/adminLTE-left-menu.jsp"/>
    <jsp:include page="../index/index.jsp"/>
    <jsp:include page="../common/adminLTE-footer.jsp"/>
    <div class="control-sidebar-bg"></div>
</div>
<jsp:include page="../common/adminLTE-js.jsp"/>
</body>
<script type="text/javascript">
    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {
        httpUtilsInit($scope, $http);// 初始化http工具

        $scope.getList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/system/menus/jsonTree?userId='+${userInfo.id},
                data: $.param({}),
                loadingShow: true,
                success: function (status, data) {
                    $('.sidebar-menu').sidebarMenu({data: data.data});
                }
            });
        }

        $scope.getList();
    });
</script>
<jsp:include page="../common/footer.jsp" />
</html>