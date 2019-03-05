<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/11
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    function initAddRoleModal($scope, $http) {
        $scope.showModal = function () {
            alertModal("添加角色");
        };

        function alertModal(title) {
            if (!title || '') {
                $("#addRoleModalTitle").html("<strong>查看详细信息</strong>");
            } else {
                $("#addRoleModalTitle").html("<strong>" + title + "</strong>");
            }

            //弹出任务信息弹框
            $('#addRoleModal').modal('show');
        };

        $scope.role = {};
        $scope.save = function () {
            $scope.ajax({
                method: 'POST',
                url: '/systemRoles/save',
                data: $.param({
                    'role': JSON.stringify($scope.role)
                }),
                success: function (status, data) {
                    var msg = "添加";
                    if (data.data) {
                        msg += '成功';
                    } else {
                        msg += '失败';
                    }

                    bootbox.alert({
                        title: '信息',
                        message: msg
                    });

                    $('#addRoleModal').modal('toggle');
                }
            });
        };
    }


</script>
<div class="modal fade" id="addRoleModal" tabindex="-1"
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

                    <h4 class="modal-title" id="addRoleModalTitle">
                        <strong>查看详细信息</strong>
                    </h4>

                </div>
                <!-- 弹窗正文信息 -->
                <div class="modal-body">
                    <div class="form-group form-inline">
                        <label class="form-label">角色名称：</label>
                        <div class="input-group">
                            <input class="form-control" type="text" name="role"
                                   ng-model="role.title">
                        </div>
                    </div>
                    <div class="form-group form-inline">
                        <label class="form-label">角色描述：</label>
                        <div class="input-group">
                            <textarea class="form-control"
                                      id="remark" placeholder="输入描述" cols="50"
                                      rows="5" ng-model="role.remark"
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
