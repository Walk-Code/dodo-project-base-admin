<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/24
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#roleList").select2({"allowClear": true, "placeholder": "选择父级菜单"});
    });

    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {
        httpUtilsInit($scope, $http);
        $scope.group = {groupId: '${groupId}', systemRolesList: []};

        $scope.getRoleList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemUserGroup/getRoleList',
                data: $.param({}),
                success: function (status, data) {
                    $scope.roleList = data.data;
                }
            });
        };

        $scope.addRole = function () {
            var username = $('#roleList').select2('data')[0].text;
            var id = $('#roleList').val();

            $scope.group.systemRolesList.push({'username': username, 'id': id});
            $scope.addRoleToGroup(id);
        };

        $scope.deleteRole = function (index) {
            $scope.removeUserToGroup($scope.group.systemRolesList[index].id);
            $scope.group.systemRolesList.splice(index, 1);
        };

        $scope.getGroupRoleList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemUserGroup/getRoleFromGroup?userGroupId=' + $scope.group.groupId,
                data: $.param({}),
                success: function (status, data) {
                    $scope.group = data.data;
                }
            });
        };

        $scope.addRoleToGroup = function (id) {
            $scope.ajax({
                method: 'POST',
                url: '/systemUserGroup/addRoleToGroup',
                data: $.param({
                    groupId: $scope.group.groupId,
                    roleId: id
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getGroupRoleList()
                }
            });
        };

        $scope.removeUserToGroup = function (id) {
            $scope.ajax({
                method: 'POST',
                url: '/systemUserGroup/removeRoleToGroup',
                data: $.param({
                    groupId: $scope.group.groupId,
                    roleId: id
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getGroupRoleList()
                }
            });
        };


        $scope.getRoleList();
        $scope.getGroupRoleList();
    });


</script>