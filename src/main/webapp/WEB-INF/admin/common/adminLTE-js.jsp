<%--
  Created by IntelliJ IDEA.
  User: xqyjjq
  Date: 2018/11/8
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- REQUIRED JS SCRIPTS -->
<!-- Slimscroll -->
<script src="../plugins/adminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../plugins/adminLTE/bower_components/fastclick/lib/fastclick.js"></script>
<!-- iCheck 1.0.1 -->
<script src="/plugins/adminLTE/plugins/iCheck/icheck.js"></script>
<!-- nice-validator-1.0.8 -->
<%--<script src="/plugins/nice-validator-1.0.8/jquery.validator.js?local=zh-CN"></script>--%>
<!--jquery-confirm -->
<%--<script src="/plugins/jquery-confirm/jquery-confirm.min.js"></script>--%>
<!-- Select2 -->
<%--<script src="/plugins/adminLTE/bower_components/select2/dist/js/select2.full.min.js"></script>--%>
<!-- date -->
<script src="/plugins/adminLTE/bower_components/moment/moment.js"></script>
<script src="/plugins/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- jquery.cookie -->
<%--<script src="/plugins/jquery.cookie.js"></script>--%>

<!-- xlsx -->
<%--<script src="/plugins/jquery.table2excel.js"></script>--%>
<!-- AdminLTE App -->
<script src="/plugins/adminLTE/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/plugins/adminLTE/dist/js/demo.js"></script>
<!-- tab -->
<script src="/plugins/adminLTE/dist/js/app_iframe.js"></script>
<!-- 自定义系统初始化话JS -->
<%--<script src="/app/js/init.js"></script>--%>

<%--<script src="/plugins/layui/layui.js" charset="utf-8"></script>--%>
<%--<script src="/app/js/x-layui.js" charset="utf-8"></script>--%>
<script type="text/javascript">

    $(function () {
        //select2
         // $(".single-select").select2();
        //iCheck for checkbox and radio inputs
        /*  $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
              checkboxClass: 'icheckbox_minimal-blue',
              radioClass: 'iradio_minimal-blue'
          });*/
    });
</script>
<script type="text/javascript">
    /* layui.config({
         version:true,
         debug:true,
         base: '/app/js/modules/'
     }).use('xform'); //加载入口*/

</script>
<script type="text/javascript">
    /*
     * 本地搜索菜单
     */
    function search_menu() {
        //要搜索的值
        var text = $('input[name=q]').val();
        var $ul = $('.sidebar-menu');
        $ul.find("a.nav-link").each(function () {
            var $a = $(this).css("border", "");
            //判断是否含有要搜索的字符串
            if ($a.children("span.menu-text").text().indexOf(text) >= 0) {
                //如果a标签的父级是隐藏的就展开
                $ul = $a.parents("ul");
                if ($ul.is(":hidden")) {
                    $a.parents("ul").prev().click();
                }
                //点击该菜单
                $a.click().css("border", "1px solid");
//                return false;
            }
        });
    }

    $(function () {
//        console.log(window.location);
        App.setbasePath("../");
        // 设置全局图片路径
        App.setGlobalImgPath("/plugins/adminLTE/dist/img/");
        addTabs({
            id: '10008',
            title: '欢迎页',
            close: false,
            url: 'index',// TODO 添加子页面
            /*urlType: "relative"*/
            urlType: "abosulte"
        });
        App.fixIframeCotent();
        /*addTabs({
         id: '10009',
         title: '404',
         close: true,
         url: 'UI/buttons_iframe2.html'
         });*/
        /*
         <li class="treeview">
         <a href="#">
         <i class="fa fa-edit"></i> <span>Forms</span>
         <span class="pull-right-container">
         <i class="fa fa-angle-left pull-right"></i>
         </span>
         </a>
         <ul class="treeview-menu">
         <li><a href="forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
         <li><a href="forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
         <li><a href="forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
         </ul>
         </li>
         */
        var menus = [
            {
                id: "9000",
                text: "header",
                icon: "",
                isHeader: true
            },
            {
                id: "9001",
                text: "UI Elements",
                icon: "fa fa-laptop",
                children: [
                    {
                        id: "90011",
                        text: "buttons",
                        icon: "fa fa-circle-o",
                        url: "UI/buttons_iframe.html",
                        targetType: "iframe-tab"
                    },
                    {
                        id: "90012",
                        text: "icons",
                        url: "UI/icons_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    },
                    {
                        id: "90013",
                        text: "general",
                        url: "UI/general_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    },
                    {
                        id: "90014",
                        text: "modals",
                        url: "UI/modals_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    },
                    {
                        id: "90015",
                        text: "sliders",
                        url: "UI/sliders_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    },
                    {
                        id: "90016",
                        text: "timeline",
                        url: "UI/timeline_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    }
                ]
            },
            {
                id: "9002",
                text: "Forms",
                icon: "fa fa-edit",
                children: [
                    {
                        id: "90021",
                        text: "advanced",
                        url: "forms/advanced_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    },
                    {
                        id: "90022",
                        text: "general",
                        url: "forms/general_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    },
                    {
                        id: "90023",
                        text: "editors",
                        url: "forms/editors_iframe.html",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o"
                    },
                    {
                        id: "90024",
                        text: "系统菜单",
                        url: "/system/menus",
                        targetType: "iframe-tab",
                        icon: "fa fa-circle-o",
                        urlType: 'abosulte'
                    }
                ]
            }
        ];

        // 动态创建菜单后，可以重新计算 SlimScroll
        // $.AdminLTE.layout.fixSidebar();
        /*if ($.AdminLTE.options.sidebarSlimScroll) {
            if (typeof $.fn.slimScroll != 'undefined') {
                //Destroy if it exists
                var $sidebar = $(".sidebar");
                $sidebar.slimScroll({destroy: true}).height("auto");
                //Add slimscroll
                $sidebar.slimscroll({
                    height: ($(window).height() - $(".main-header").height()) + "px",
                    color: "rgba(0,0,0,0.2)",
                    size: "3px"
                });
            }
        }*/
    });
    function test() {
        console.log(123);
        refreshTab();
    }
</script>