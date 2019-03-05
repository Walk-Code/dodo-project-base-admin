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
        $("#userList").select2({"allowClear": true, "placeholder": "选择父级菜单"});
    });

    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {
        httpUtilsInit($scope, $http);
        $scope.group = {groupId: '${groupId}', systemUserList: []};

        $scope.getUserList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemUserGroup/getUserList',
                data: $.param({}),
                success: function (status, data) {
                    $scope.userList = data.data;
                }
            });
        };

        $scope.addUser = function () {
            var username = $('#userList').select2('data')[0].text;
            var id = $('#userList').val();

            $scope.group.systemUserList.push({'username': username, 'id': id});
            $scope.addUserToGroup(id);
        };

        $scope.deleteUser = function (index) {
            $scope.removeUserToGroup($scope.group.systemUserList[index].id);
            $scope.group.systemUserList.splice(index, 1);
        };

        $scope.getGroupUserList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemUserGroup/getUserFromGroup?userGroupId=' + $scope.group.groupId,
                data: $.param({}),
                success: function (status, data) {
                    $scope.group = data.data;
                }
            });
        };

        $scope.addUserToGroup = function (id) {
            $scope.ajax({
                method: 'POST',
                url: '/systemUserGroup/addUserToGroup',
                data: $.param({
                    groupId: $scope.group.groupId,
                    userId: id
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getGroupUserList()
                }
            });
        };

        $scope.removeUserToGroup = function (id) {
            $scope.ajax({
                method: 'POST',
                url: '/systemUserGroup/removeUserToGroup',
                data: $.param({
                    groupId: $scope.group.groupId,
                    userId: id
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getGroupUserList()
                }
            });
        };


        $scope.getGroupUserList();
        $scope.getUserList();
    });


</script>