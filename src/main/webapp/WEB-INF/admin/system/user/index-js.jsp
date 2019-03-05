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
        initChangePasswordModal($scope, $http);// 初始化修改密码modal

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
                url: '/systemUser/getList?page=' + $scope.page,
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

        $scope.del = function (id) {
            $scope.ajax({
                method: 'POST',
                url: '/systemUser/del',
                data: $.param({
                    id: id
                }),
                success: function (status, data) {
                    box.alert(data.message);
                }
            });
        };

        $scope.enable = function (item, status) {
            item.status = status;
            console.log(JSON.stringify(item));
            $scope.ajax({
                method: 'POST',
                url: '/systemUser/enable',
                data: $.param({
                    data: JSON.stringify(item)
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getList();
                },
                error: function (status, data) {
                    item.status = status == 1 ? 2 : 1;
                }
            });
        };

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

    });

    // 初始化
    initDirective(app);


</script>