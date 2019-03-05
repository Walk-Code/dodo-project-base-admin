<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/3
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/plugins/nestable/css/nestable.css"/>
<script src="/plugins/nestable/js/nestable.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        // 全部收起
        $('[data-action="collapse-all"]').nestable('collapseAll');

        // 全部展开
        $('[data-action="expand-all"]').nestable('expandAll');
    });

</script>
