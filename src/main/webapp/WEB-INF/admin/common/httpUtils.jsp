<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/10
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%-- TODO loading 模块--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    // 检查是否在iframe中且为登录路由
    if (window.self !== window.top && window.location.pathname == '/login') {//刷新父级页面跳转到登录页面
        window.parent.location.reload();
    }

    function httpUtilsInit($scope, $http) {
        // console.log("初始化http工具。");
        var httpMap = new Map();

        $scope.ajax = function (obj) {
            var startTime = new Date().getTime();//起始时间
            var key = "${pageContext.request.contextPath }" + obj.url + "?"
                + obj.data;

            try {
                $http(
                    {
                        method: obj.method,
                        url: "${pageContext.request.contextPath}"
                        + obj.url,
                        data: obj.data,
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
                            'X-Requested-With': 'XMLHttpRequest'
                        }
                    }).then(function successCallback(response) {
                    // console.log("返回响应信息：" + JSON.stringify(response));
                    // 校验服务端返回状态码
                    if (response.data.status == 200) {
                        obj.success(status, response.data);
                    } else if (response.data.status == 401) {
                        bootbox.alert(response.data.message);
                        if (window.parent) {//刷新父级页面跳转到
                            setTimeout(function () {
                                window.parent.location.reload();
                            }, 1000);
                        }
                    } else {
                        if (obj.fail != undefined && obj.fail != null && obj.fail != "") {
                            obj.fail(status, response.data);
                        } else {
                            box.alert(response.data.message);
                        }

                        obj.error(status, response.data);
                    }
                }, function errorCallback(response) {
                    // console.log(JSON.stringify(response));
                    bootbox.alert( response.data.message);
                });
            } catch (err) {
                console.log(err);
            } finally {
                var endTime = new Date().getTime();//结束时间
                console.log("发起请求:" + key + ",耗时：" + (endTime - startTime)
                    + "ms");
                //请求限制时间达到后才移除请求
                setTimeout(function () {
                    httpMap.delete(key);
                }, obj.releaseTime);

            }
        }//end of ajax
        //$scope.sendAjax(method,url,data,successFunction,errorFunction,1,2000);
        $scope.sendAjax = function (method, url, data, successFunction, errorFunction, loadingShow, lock, releaseTime, failFunction) {
            $scope.ajax({
                method: method,
                url: url,
                data: data == null ? null : $.param(data),
                success: successFunction,
                fail: failFunction,
                error: errorFunction == null ? function (status, data) {
                    alert("网络异常");
                } : errorFunction,
                loadingShow: loadingShow,
                releaseTime: releaseTime,
                lock: lock
            });
        };
    }
</script>