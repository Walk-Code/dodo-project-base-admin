<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/28
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/plugins/adminLTE/plugins/iCheck/all.css"/>
<script type="text/javascript"
        src="/plugins/adminLTE/plugins/iCheck/icheck.js"></script>
<script type="text/javascript">
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });
    });
</script>