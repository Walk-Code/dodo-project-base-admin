<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2019/1/14
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .loading {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: #fff;
        z-index: 3;
    }

    .loader {
        left: 50%;
        margin-left: -4em;
        font-size: 10px;
        border: .8em solid rgba(218, 219, 223, 1);
        border-left: .8em solid rgba(58, 166, 165, 1);
        animation: spin 1.1s infinite linear;
    }

    .loader, .loader:after {
        border-radius: 50%;
        width: 6em;
        height: 6em;
        display: block;
        position: absolute;
        top: 50%;
        margin-top: -4.05em;
    }

    @keyframes spin {
        0% {
            transform: rotate(360deg);
        }
        100% {
            transform: rotate(0deg);
        }
    }
</style>
<div class="loading" loading>
    <div class="loader"></div>
</div>
<script type="text/javascript">
    function loading(app) {
        app.directive('loading', ['$http', function ($http) {
            return {
                restrict: 'A',
                link: function (scope, elm, attrs) {
                    scope.isLoading = function () {
                        return $http.pendingRequests.length > 0;
                    };

                    scope.$watch(scope.isLoading, function (v) {
                        if (v) {
                            elm.show();
                        } else {
                            elm.hide();
                        }
                    });
                }
            };

        }]);
    };
</script>