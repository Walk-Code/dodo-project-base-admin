<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/8
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<script src='https://recaptcha.net/recaptcha/api.js?hl=zh'></script>
<jsp:include page="../common/adminLTE-head.jsp"/>
<body class="hold-transition login-page" ng-controller="loginController">
<div class="login-box">
    <div class="login-logo">
        <b>DoDoAdmin</b>
    </div>
    <!-- /.login-logo -->
    <form action=""
          data-validator-option="{theme:'bootstrap', timely:2, theme:'simple_bottom'}"
          method="post">
        <div class="login-box-body">
            <p class="login-box-msg">请输入用户名和密码登录</p>
            <%--<div  class="alert alert-danger alert-dismissible">
                <h4 style="margin-bottom: 0px;"><i class="fa fa-exclamation-triangle"></i> error</h4>
            </div>--%>
            <div class="form-group has-feedback mg">
                <input type="hidden" name="return_url" value="#">
                <input type="text" class="form-control" name="username"
                       placeholder="用户名"
                       data-rule="用户名:required;username;" ng-model="username">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback mg">
                <input type="password" class="form-control" name="password"
                       placeholder="密码"
                       data-rule="密码:required;password;" ng-model="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group has-feedback mg">
                            <input type="text" maxlength="5"
                                   class="form-control" name="captcha"
                                   placeholder="验证码"
                                   data-rule="验证码:required;length(5);"
                                   style="padding-right: 17.5px;"
                                   ng-model="captchaContent">
                            <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="form-group has-feedback">
                            <img alt="如果看不清楚，请单击图片刷新！" class="pointer img"
                                 id="captcha" src="{{captchaCode}}"
                                 style="width: 112px;margin-top: 3px;">
                        </div>
                    </div>
                </div>
               <%-- <div class="g-recaptcha col-lg-8" id="html_element"
                     data-sitekey="${captchaSettings.getSite()}"></div>--%>
                <span id="captchaError" class="alert alert-danger col-sm-4"
                      style="display:none"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="button"
                            class="btn btn-primary btn-block btn-flat"
                            ng-click="login()"><i class="fa fa-sign-in"></i> 登录
                    </button>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.social-auth-links -->
        </div>
    </form>
    <!-- /.login-box-body -->
</div>
<!-- REQUIRED JS SCRIPTS -->
<!-- jQuery 2.1.4 -->
<script src="/plugins/adminLTE/bower_components/jQuery/dist/jQuery.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="/plugins/adminLTE/bower_components/bootstrap/dist/js/bootstrap.js"></script>
<!-- iCheck 1.0.1 -->
</body>
<jsp:include page="login-js.jsp"/>
<jsp:include page="../common/footer.jsp"/>
</html>
