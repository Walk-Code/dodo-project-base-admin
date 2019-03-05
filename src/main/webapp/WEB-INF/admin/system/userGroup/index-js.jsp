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
        initAddUserGroupModal($scope, $http);// 初始化添加用户组modal

        $scope.page = 0;
        $scope.pageSize = 0;
        $scope.totalPage = 0;
        $scope.totalRow = 0;
        $scope.lastPage = false;
        $scope.firstPage = false;

        $scope.userGroupList = [];
        $scope.getList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemUserGroup/getList?page=' + $scope.page,
                data: $.param({}),
                success: function (status, data) {
                    $scope.userGroupList = data.data.list;
                    $scope.page = data.data.pageNumber;
                    $scope.pageSize = data.data.pageSize;
                    $scope.totalPage = data.data.totalPage;
                    $scope.totalRow = data.data.totalRow;
                    $scope.lastPage = data.data.lastPage;
                    $scope.firstPage = data.data.firstPage;
                }
            });
        };

        $scope.getList();

        $scope.pageBt = function (page) {
            $scope.page = page;
            $scope.getList();
        };

        $scope.enter = function () {
            if ($scope.enterPage < 0) {
                $scope.page = 1;
            } else if ($scope.enterPage > $scope.totalPage) {
                $scope.page = $scope.totalPage;
            } else {
                $scope.page = $scope.enterPage;
            }

            $scope.enterPage = $scope.page;
            $scope.getList();
        };

        // 跳转添加用户页面
        $scope.jumpPath = function (id) {
            window.location.href = "/systemUserGroup/addUser/index?userGroupId=" + id;
        };

        // 跳转添加角色页面
        $scope.addRole = function(id){
            window.location.href = "/systemUserGroup/addRole/index?userGroupId=" + id;
        };

        $scope.del = function (id) {
            $scope.ajax({
                method: 'POST',
                url: '/systemUserGroup/del',
                data: $.param({}),
                success: function (status, data) {
                    bootbox.alert(data.message);
                }
            });
        }

    });

    app.directive('myEnter', function () {
        return function (scope, element, attrs) {
            element.bind("keydown keypress", function (event) {
                if (event.which === 13) {
                    scope.$apply(function () {
                        scope.$eval(attrs.myEnter);
                    });

                    event.preventDefault();
                }
            });
        };
    });
</script>