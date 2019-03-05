<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    function initAddUserGroupModal($scope, $http) {
        $scope.user = {
            id: "",
            username: "",
            phone: "",
            email: "",
            status: "",
            qq: "",
            remark: ""
        };

        $scope.user.systemUserGroupList = [];

        $scope.create = function () {
            console.log(JSON.stringify($scope.user));
            alertModal("添加用户");
        };

        $scope.edit = function (item) {
            $scope.user = item;
            alertModal("编辑用户");
            $scope.getSystemUserGroup(item.id);
        };


        function alertModal(title) {
            if (!title || '') {
                $("#addUserModalTitle").html("<strong>查看详细信息</strong>");
            } else {
                $("#addUserModalTitle").html("<strong>" + title + "</strong>");
            }

            //弹出任务信息弹框
            $('#addUserModal').modal('show');
        };

        $scope.role = {};
        $scope.save = function () {
            $scope.ajax({
                method: 'POST',
                url: '/systemUser/save',
                data: $.param({
                    'data': JSON.stringify($scope.user)
                }),
                success: function (status, data) {
                    box.alert(data.message);

                    $('#addUserModal').modal('toggle');
                    $scope.getList();
                }
            });
        };

        // 获取用户组
        $scope.getSystemUserGroup = function (userId) {
            $scope.ajax({
                method: 'GET',
                url: '/systemUser/getUserGroup?userId='+userId,
                success: function (status, data) {
                    $scope.user.systemUserGroupList = data.data;
                }
            });
        };
    };


</script>
<div class="modal fade" id="addUserModal" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form method="post" action=>
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 弹窗头部信息 -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span>
                    </button>

                    <h4 class="modal-title" id="addUserModalTitle">
                        <strong>查看详细信息</strong>
                    </h4>

                </div>
                <!-- 弹窗正文信息 -->
                <div class="modal-body">
                    <div class="form-group form-inline">
                        <label class="form-label">用户账号：</label>
                        <div class="input-group">
                            <input class="form-control" type="text"
                                   ng-model="user.username">
                        </div>
                    </div>
                    <div class="form-group form-inline">
                        <label class="form-label">联系手机：</label>
                        <div class="input-group">
                            <input class="form-control" type="text"
                                   ng-model="user.phone">
                        </div>
                    </div>
                    <div class="form-group form-inline">
                        <label class="form-label">联系邮箱：</label>
                        <div class="input-group">
                            <input class="form-control" type="text"
                                   ng-model="user.email">
                        </div>
                    </div>
                    <div class="form-group form-inline">
                        <label class="form-label">访问授权：</label>
                        <div class="input-group">
                            <label ng-repeat="item in user.systemUserGroupList"
                                   style="margin-right: 5px;">
                                <input icheck type="checkbox"
                                       ng-model="true"
                                       ng-checked="true" ng-disabled="true">
                                <span ng-bind="item.name"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group form-inline">
                        <label class="form-label">用户描述：</label>
                        <div class="input-group">
                            <textarea class="form-control"
                                      id="remark" placeholder="输入描述" cols="50"
                                      rows="5" ng-model="user.remark"
                                      style="resize: vertical;"></textarea>
                        </div>
                    </div>
                </div>
                <!-- 弹窗底部信息 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="save" ng-click="save()"
                            class="btn btn-success">保存
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>