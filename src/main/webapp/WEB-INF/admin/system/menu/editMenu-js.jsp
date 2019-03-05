<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(document).ready(function () {
        $(".menuList").select2({"allowClear": true, "placeholder": "选择父级菜单"});
        $('#icon').iconpicker({placement:'bottomLeft'});
    });

    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {
        httpUtilsInit($scope, $http);

        $scope.findMenu = function () {
            $scope.ajax({
                method: 'GET',
                url: 'findMenu?nodeId=' + "${nodeId}",
                data: $.param({}),
                success: function (status, data) {
                    $scope.menu = data.data;
                }
            });
        };

        // 获取所有路由列表
        $scope.getMenusForSelectBox = function () {

            $scope.ajax({
                method: 'GET',
                url: '/system/menus/getTreeDataList',
                data: $.param({}),
                loadingShow: true,
                success: function (status, data) {
                    console.log(JSON.stringify(data.data));
                    $scope.menusSelectBoxData = data.data;
                }
            });
        };

        $scope.edit = function() {
            $scope.ajax({
                method: 'POST',
                url: '/system/menu/edit',
                data: $.param({
                    "menuJson": JSON.stringify($scope.menu)
                }),
                success: function (status, data) {
                    box.alert(data.message);

                    $scope.findMenu();
                    $scope.getMenusForSelectBox();
                    window.parent.location.reload(); // 刷新列表页
                }
            });
        };

        $scope.findMenu();
        $scope.getMenusForSelectBox();
    });
</script>