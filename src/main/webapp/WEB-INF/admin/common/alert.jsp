<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/24
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript">
     $(document).ready(function () {
         box = {
             alert(message){
                 bootbox.alert({
                     title: '消息',
                     size: 'small',
                     message: message
                 })
             },
             alertTitle(obj){
                bootbox.alert({
                    title: obj.title,
                    size: 'small',
                    message: obj.message
                })
             },
             confirm(obj){
                 bootbox.confirm({
                     title: '警告',
                     size: 'small',
                     message: obj.message,
                     buttons: {
                         confirm: {
                             label: '确认',
                             className: 'btn-danger'
                         },
                         cancel: {
                             label: '取消',
                             className: 'btn-default'
                         }
                     },
                     callback: function (result) {
                         if (result){
                             obj.confirm();
                         }else{
                             obj.cancel();
                         }
                     }
                 });
             }
         };
     });
</script>