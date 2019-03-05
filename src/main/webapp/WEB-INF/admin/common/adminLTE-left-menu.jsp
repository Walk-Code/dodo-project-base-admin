<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/8
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .nav-link i {
        margin: 0 1px;
    }
</style>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/plugins/adminLTE/dist/img/avatar.png" class="img-circle">
            </div>
            <div class="pull-left info">
                <p>${userInfo.email}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control"
                       placeholder="Search...">
                <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn"
                    class="btn btn-flat"><i class="fas fa-search"></i></button>
          </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu tree" data-widget="tree">

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<script>


</script>