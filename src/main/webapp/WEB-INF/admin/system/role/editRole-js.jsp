<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/22
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(document).ready(function () {
        $(".single-select").select2({
            "allowClear": true,
            "placeholder": "选择需要添加用户组"
        });
    });

    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {
        httpUtilsInit($scope, $http);
        $scope.userGroupList = [];
        $scope.roleId = '${roleId}';
        $scope.systemRole = {};

        $scope.getUserGroupList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemRoles/useGroupList',
                data: $.param({}),
                success: function (status, data) {
                    $scope.userGroupList = data.data;
                }
            });
        };

        // 获取
        $scope.findUserGroupRole = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemRoles/findSystemRole?roleId=' + $scope.roleId,
                data: $.param({}),
                success: function (status, data) {
                    $scope.systemRole = data.data;
                    // 设置select2默认值
                    $('.single-select').select2('val', $scope.systemRole.userGroupSelectList);
                }
            });
        };

        $scope.edit = function () {
            $scope.systemRole.userGroupSelectList =$('.single-select').val();
            console.log(JSON.stringify($scope.systemRole));

            $scope.ajax({
                method: 'POST',
                url: '/systemRoles/editSystemRole',
                data: $.param({
                    data: JSON.stringify($scope.systemRole)
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getUserGroupList();
                    $scope.findUserGroupRole();
                }
            });
        };

        $scope.getUserGroupList();
        $scope.findUserGroupRole();
    });

</script>
