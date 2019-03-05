<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    function initChangePasswordModal($scope, $http) {
        $scope.userItem = {
            id: "",
            password: ""
        };

        $scope.updatePassword = function (item) {
            $scope.userItem.id = item.id;
            $scope.userItem.password = "";
            alertChangePasswordModal("修改密码");
        };


        function alertChangePasswordModal(title) {
            if (!title || '') {
                $("#changePasswordModalTitle").html("<strong>查看详细信息</strong>");
            } else {
                $("#changePasswordModalTitle").html("<strong>" + title + "</strong>");
            }

            //弹出任务信息弹框
            $('#changePasswordModal').modal('show');
        };

        $scope.changePassword = function () {
            $scope.ajax({
                method: 'POST',
                url: '/systemUser/changePassword',
                data: $.param({
                    'id':  $scope.userItem.id,
                    'password':  $scope.userItem.password
                }),
                success: function (status, data) {
                    box.alert(data.message);
                    $('#changePasswordModal').modal('toggle');
                }
            });
        };
    };


</script>
<div class="modal fade" id="changePasswordModal" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form method="post" action=>
        <div class="modal-dialog" style="width: 300px;">
            <div class="modal-content">
                <!-- 弹窗头部信息 -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span>
                    </button>

                    <h4 class="modal-title" id="changePasswordModalTitle">
                        <strong>查看详细信息</strong>
                    </h4>

                </div>
                <!-- 弹窗正文信息 -->
                <div class="modal-body">
                    <div class="form-group form-inline">
                        <label class="form-label">新密码：</label>
                        <div class="input-group">
                            <input class="form-control" type="text"
                                   ng-model="userItem.password">
                        </div>
                    </div>
                </div>
                <!-- 弹窗底部信息 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="save" ng-click="changePassword()"
                            class="btn btn-success">保存
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>