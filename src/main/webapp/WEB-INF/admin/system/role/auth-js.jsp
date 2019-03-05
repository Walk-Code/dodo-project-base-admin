<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/18
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    var app = angular.module('app', []);
    app.controller('myBody', function ($scope, $http) {
        $scope.menusSelectBoxData = [];
        // 初始化插件
        httpUtilsInit($scope, $http);// 初始化http工具
        $scope.roleId = '${roleId}';
        // 获取系统菜单列表
        $scope.getMenusList = function () {
            $scope.ajax({
                method: 'GET',
                url: '/systemRoles/getAuthList?roleId=' + $scope.roleId,
                data: $.param({}),
                loadingShow: true,
                success: function (status, data) {
                    $scope.jsonTree = data.data;
                    var setting = {
                        view: {
                            selectedMulti: false,
                            showLine: false
                        },
                        check: {
                            chkStyle: "checkbox",
                            enable: true //必填，不填无法显示checkbox
                        }
                    }

                    $.fn.zTree.init($("#zTree"), setting, $scope.jsonTree);
                }
            });
        };

        $scope.getMenusList();

        // 保存节点
        $scope.save = function () {
            // 获取选中节点
            let idList = [];
            var treeObj = $.fn.zTree.getZTreeObj("zTree");
            var nodes = treeObj.getCheckedNodes(true);

            $.fn.zTree.getZTreeObj("zTree").getCheckedNodes(true).map(val => idList.push(val.id));
            // console.log(JSON.stringify(idList));
            //return;
            // console.log("获取选中节点："+JSON.stringify(nodes));
            $scope.ajax({
                method: 'POST',
                url: '/systemRoles/updateAuthList',
                data: $.param({
                    data: JSON.stringify(idList),
                    roleId: $scope.roleId
                }),
                success: function (status, data) {
                    box.alert(data.message);

                    $scope.getMenusList();
                }
            });
        };

        $scope.cancel = function () {
           window.location.href = '/systemRoles/index';
        };

    });
</script>
