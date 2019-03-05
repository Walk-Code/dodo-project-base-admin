<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/10
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../common/adminLTE-head.jsp" />
<body class="hold-transition login-page">
<div class="register-box">
    <div class="register-logo">
        <a href="../../index2.html"><b>DoDoAdmin</b></a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">注册一个新用户</p>

        <form action="/register" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="username" class="form-control" placeholder="用户名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" name="email" class="form-control" placeholder="邮箱">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="secPasswrod" class="form-control" placeholder="密码二次确认">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <%--<label class="">
                            <div class="icheckbox_square-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> I agree to the <a href="#">terms</a>
                        </label>--%>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
                <!-- /.col -->
            </div>
        </form>
        <%-- 三方登录 --%>
        <%--<div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
                Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
                Google+</a>
        </div>--%>

        <a href="/login" class="text-center">试试登录</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- jQuery 2.1.4 -->
<script src="/plugins/adminLTE/bower_components/jQuery/dist/jQuery.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="/plugins/adminLTE/bower_components/bootstrap/dist/js/bootstrap.js"></script>
<!-- iCheck 1.0.1 -->
<script src="/plugins/iCheck/icheck.js"></script>
</body>
</html>
