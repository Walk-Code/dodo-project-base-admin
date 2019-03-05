<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {

        httpUtilsInit($scope, $http);

        $scope.config = {};
        $scope.findSystemConfig = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemConfig/findSystemConfig',
                data: $.param({}),
                success: function (status, data) {
                    $scope.config = data.data;
                }
            });
        };

        // 保存系统配置
        $scope.save = function () {
            $scope.ajax({
                method: 'POST',
                url: '/systemConfig/updateSystemConfig',
                data: $.param({
                    data: JSON.stringify($scope.config)
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getList();
                }
            });
        }


        $scope.findSystemConfig();
    });

</script>