<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/19
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    var app = angular.module('app', ['ngSanitize']);
    app.controller('myBody', function ($scope, $http) {
        httpUtilsInit($scope, $http);

        $scope.getList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systenMenusNode/getList',
                data: $.param({}),
                success: function (status, data) {
                    $scope.nodeList = data.data;
                    $scope.checkUncheckAuthHeader();
                    $scope.checkUncheckMenuHeader();
                }
            });
        };
        // TODO 封装全选方法
        // 选中or取消选择
        $scope.checkUncheckAuthHeader = function () {
            $scope.isAuthAllChecked = true;
            for (var i = 0; i < $scope.nodeList.length; i++) {
                if (!$scope.nodeList[i].auth) {
                    $scope.isAuthAllChecked = false;
                    break;
                }
            }
        };

        // 选中所有权限checkbox
        $scope.selectedAllAuth = function () {
            for (var i = 0; i < $scope.nodeList.length; i++) {
                $scope.nodeList[i].auth = $scope.isAuthAllChecked;
            }
        };

        $scope.checkUncheckMenuHeader = function () {
            $scope.isMenuAllChecked = true;
            for (var i = 0; i < $scope.nodeList.length; i++) {
                if (!$scope.nodeList[i].menu) {
                    $scope.isMenuAllChecked = false;
                    break;
                }
            }
        };

        // 选中所有权限checkbox
        $scope.selectedAllMenu = function () {
            for (var i = 0; i < $scope.nodeList.length; i++) {
                $scope.nodeList[i].menu = $scope.isMenuAllChecked;
            }
        };

        $scope.getList();

        // 加入权限控制or设为菜单
        $scope.setUrlFeatures = function (node) {
            $scope.ajax({
                method: 'POST',
                url: '/systenMenusNode/setUrlFeatures',
                data: $.param({
                    'menuId': node.id,
                    'isAuth': node.auth,
                    'isMenu': node.menu
                }),
                success: function (status, data) {
                    $scope.getList();
                }
            });
        }
        
        $scope.changeAuth = function (node) {
            $scope.setUrlFeatures(node);
        }

        $scope.changeMenu = function (node) {
            $scope.setUrlFeatures(node);
        }
    });

    // 初始化angularjs指令
    initDirective(app);
</script>
