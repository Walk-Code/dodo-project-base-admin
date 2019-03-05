<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/12
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    var app = angular.module('app', []);
    app.controller("loginController", function ($scope, $http) {
        httpUtilsInit($scope, $http); //初始化http工具
        $scope.username = '';
        $scope.password = '';

        $scope.login = function () {
            $scope.ajax({
                method: 'POST',
                url: '/postLogin',
                data: $.param({
                    username: $scope.username,
                    password: $scope.password,
                    captcha: $scope.captchaContent
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    window.location.href = "/";
                }
            });
        };

        $scope.captcha = function() {
            $scope.ajax({
                method: 'POST',
                url: '/login/captcha',
                data: $.param({
                    
                }),
                success: function (status, data) {
                    $scope.captchaCode = data.data.codeImg;
                }
            })
        };

        $scope.captcha();

        $('#captcha').click(function () {
            $scope.captcha();
        });
    });
</script>
