<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(document).ready(function () {
    });


    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {

        httpUtilsInit($scope, $http);
        initAddRoleModal($scope, $http);// 初始化添加角色modal

        $scope.page = 0;
        $scope.pageSize = 0;
        $scope.totalPage = 0;
        $scope.totalRow = 0;
        $scope.lastPage = false;
        $scope.firstPage = false;

        $scope.roleList = [];
        $scope.getList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemRoles/getList?page=' + $scope.page,
                data: $.param({}),
                success: function (status, data) {
                    $scope.roleList = data.data.list;
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

        // 跳转授权页面
        $scope.jumpAuth = function (id) {
            window.location.href = "/systemRoles/auth?roleId=" + id;
        };

        // 跳转编辑页面
        $scope.edit = function (id) {
            window.location.href = "/systemRoles/edit?roleId=" + id;
        }

        // 更改角色状态
        $scope.enable = function (item, type) {
            box.confirm({
                message: '是否' + (type == 1 ? '禁用' : '启用') + item.title + "角色?",
                confirm: function () {
                    item.status = type;
                    $scope.ajax({
                        method: 'POST',
                        url: '/systemRoles/changeRoleStatus',
                        data: $.param({
                            role: JSON.stringify(item)
                        }),
                        success: function (status, data) {
                            box.alert(data.message);
                            $scope.getList();
                        }
                    });
                },
                cancel: function () {
                    // console.log("取消");
                }
            });
        };

        $scope.del = function (id) {
            $scope.ajax({
                method: 'POST',
                url: '/systemRoles/delRole',
                data: $.param({
                    roleId: id,
                    id: id
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getList();
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