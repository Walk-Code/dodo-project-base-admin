<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/29
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"
      href="/plugins/adminLTE/bower_components/select2/dist/css/select2.css"/>
<script type="text/javascript"
        src="/plugins/adminLTE/bower_components/select2/dist/js/select2.js"/>

<script type="text/javascript">
    $(document).ready(function(){
        $('.single-select,.double-select').select2();
    });
    
    function initSelect2ForAngularJs($scope, $http) {
        console.log("初始化select2.");
        $('.single-select,.double-select').select2();
    };
</script>