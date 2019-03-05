<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/12/17
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-sm-5">
        <div style="font-size: 0.1em;" ng-bind="'共'+totalRow+'条记录，每页显示'+pageSize+'条，共'+totalPage+'页，当前显示第'+page+'页'">
        </div>
    </div>
    <div class="col-sm-7"></div>
</div>

<ul class="pagination pagination-sm pull-right">

    <span class="btn btn-default btn-xs" ng-disabled="page == 1" ng-click="pageBt(page - 1)">上一页</span>
    <span ng-bind="page"></span>/<span ng-bind="totalPage"></span>
    <span class="btn btn-default btn-xs"  ng-disabled="page >= totalRow/pageSize" ng-click="pageBt(page + 1)">下一页</span>
    <span ng-bind="'跳至'"></span>
    <input type="number" class="pagination-input" my-enter="enter()" ng-model="enterPage" />
    <span ng-bind="'页'"></span>
</ul>