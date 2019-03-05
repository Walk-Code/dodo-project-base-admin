<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/29
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(document).ready(function () {
        $(".parentId").select2({"allowClear": true, "placeholder": "选择父级菜单"});
        $('#icon').iconpicker({placement:'bottomLeft'});
    });

    var app = angular.module('app', ['ui.tree', 'ngSanitize']);
    app.controller('myBody', function ($scope, $http) {
        $scope.menusSelectBoxData = [];
        // 初始化插件
        httpUtilsInit($scope, $http);// 初始化http工具

        // 获取所有路由列表
        $scope.getMenusForSelectBox = function () {

            $scope.ajax({
                method: 'GET',
                url: '/system/menus/getTreeDataList',
                data: $.param({}),
                loadingShow: true,
                success: function (status, data) {
                    // console.log(JSON.stringify(data.data));
                    $scope.menusSelectBoxData = data.data;
                    $scope.menus = $scope.menusSelectBoxData[0]; // 默认为root级菜单
                }
            });
        };

        // 添加路由
        $scope.addRoute = function () {
            console.log($('#menus').val());
            $scope.ajax({
                method: 'POST',
                url: '/system/menus/addRoute',
                data: $.param({
                    pid: $('#menus').val(),
                    title: $scope.title,
                    url: $scope.url
                }),
                loadingShow: true,
                success: function (status, data) {
                    box.alert(data.message);
                    $scope.getMenusList(); // 刷新树
                    $scope.getMenusForSelectBox();
                }
            });
        };

        // 获取系统菜单列表
        $scope.getMenusList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/system/menus/jsonTree',
                data: $.param({}),
                loadingShow: true,
                success: function (status, data) {
                    $scope.jsonTree = data.data;
                }
            });
        };

        // 展开树
        $scope.collapseAll = function () {
            $scope.$broadcast('angular-ui-tree:collapse-all');
        };

        // 收起数
        $scope.expandAll = function () {
            $scope.$broadcast('angular-ui-tree:expand-all');
        };

        // 刷新树
        $scope.refresh = function() {
            $scope.getMenusList();
        };

        // 保存树
        $scope.saveTree = function() {
            $scope.ajax({
                method: 'POST',
                url: '/system/menus/saveJsonTree',
                data: $.param({
                    'jsonTreeData': JSON.stringify($scope.jsonTree)
                }),
                loadingShow: true,
                success: function (status, data) {
                    $scope.getMenusList();
                    $scope.getMenusForSelectBox();
                }
            });
        };

        // 编辑菜单
        $scope.editMemu = function(item) {
            window.location.href = "/system/editMenu?nodeId="+item.id;
        };

        // 禁用菜单
        $scope.delMenu = function(id) {
            $scope.ajax({
                method: 'POST',
                url: '/system/menus/disable',
                data: $.param({
                    'menuId': id
                }),
                loadingShow: true,
                success: function(status, data) {
                    box.alert(data.message);
                    $scope.getMenusList();
                    $scope.getMenusForSelectBox();
                }
            });
        };

        $scope.getMenusList();
        $scope.getMenusForSelectBox();
    });

</script>
