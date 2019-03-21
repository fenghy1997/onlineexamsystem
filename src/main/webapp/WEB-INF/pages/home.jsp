<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/base.jsp" %>
<%--<%@ include file="../../common/commons.jsp" %>--%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>信息工程系成绩分析系统</title>
    <%--<link rel="icon" href="/img/bb.ico">--%>
    <!-- Tell the browser to be responsive to screen width -->
    <%--<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">--%>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${staticPath}/static/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${staticPath}/static/css/caidan.css">
    <link rel="stylesheet" href="${staticPath}/static/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${staticPath}/static/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${staticPath}/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${staticPath}/static/dist/css/skins/skin-blue.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->

</head>
<body class="skin-blue sidebar-collapse sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><h4>${sessionScope.userinfo.userName}--欢迎您！</h4></span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <%--<li class="dropdown messages-menu">--%>
                        <%--<!-- Menu toggle button -->--%>
                        <%--<a href="#" class="dropdown-toggle advice" data-toggle="dropdown">--%>
                            <%--<i class="fa fa-envelope-o"></i>--%>
                            <%--<span class="label label-success"></span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu">--%>

                            <%--<li id="advice_msg">--%>
                                <%--<!-- inner menu: contains the actual data -->--%>
                            <%--</li>--%>

                        <%--</ul>--%>
                    <%--</li>--%>

                    <%--<li class="dropdown messages-menu">--%>
                        <%--<!-- Menu toggle button -->--%>
                        <%--<a href="#" class="dropdown-toggle num" data-toggle="dropdown">--%>
                            <%--<i class="fa fa-bell-o"></i>--%>
                            <%--<span class="label label-success"></span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu ">--%>
                            <%--<li id="option_msg">--%>
                                <%--<!-- inner menu: contains the actual data -->--%>

                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>

                    <%--<li class="dropdown messages-menu">--%>
                        <%--<!-- Menu toggle button -->--%>
                        <%--<a href="#" class="dropdown-toggle talk" data-toggle="dropdown">--%>
                            <%--<i class="fa fa-flag-o"></i>--%>
                            <%--<span class="label label-success"></span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu">--%>

                            <%--<li id="msg_talk">--%>
                                <%--<!-- inner menu: contains the actual data -->--%>
                            <%--</li>--%>

                        <%--</ul>--%>
                    <%--</li>--%>
                    <!-- /.messages-menu -->
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="../../img/p1.jpg" class="user-image user_head_img" alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs user_name"></span>
                        </a>

                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="../../img/p1.jpg" class="img-circle" alt="User Image">

                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="${staticPath}/" class="btn btn-default btn-flat">主页</a>
                                </div>
                                <div class="pull-right">
                                    <a href="javascript:void(0);" id="logout" class="btn btn-default btn-flat">退出</a>
                                </div>
                            </li>
                        </ul>

                    </li>

                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <!-- student Menu -->
                <c:if test="${sessionScope.userinfo.status==2}">
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-pie-chart"></i>
                            <span>个人成绩报告</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display: none;">
                        <li><a href="${staticPath}/personScoreAna.html" class="J_menuItem"><i class="fa fa-circle-o"></i>个人成绩分析</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="glyphicon glyphicon-align-right"></i>
                        <span>班级成绩报告</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu" style="display: none;">
                        <li><a href="${staticPath}/classScoreAna.html" class="J_menuItem"><i class="fa fa-circle-o"></i>班级成绩分析</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="glyphicon glyphicon-file"></i>
                        <span>系部成绩报告</span>
                        <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu" style="display: none;">
                        <li><a href="${staticPath}/departmentScoreAna.html" class="J_menuItem"><i class="fa fa-circle-o"></i>系部成绩分析</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="glyphicon glyphicon-edit"></i>
                        <span>密码管理</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu" style="display: none;">
                        <li><a href="${staticPath}/resetPwd.html" class="J_menuItem"><i class="fa fa-circle-o"></i>修改密码</a></li>
                    </ul>
                </li>
                </c:if>
                <!-- teacher Menu -->
                <c:if test="${sessionScope.userinfo.status==1}">
                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-align-right"></i>
                            <span>班级成绩报告</span>
                            <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu" style="display: none;">
                            <li><a href="${staticPath}/classScoreAna.html" class="J_menuItem"><i class="fa fa-circle-o"></i>班级成绩分析</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-file"></i>
                            <span>系部成绩报告</span>
                            <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
                        </a>
                        <ul class="treeview-menu" style="display: none;">
                            <li><a href="${staticPath}/departmentScoreAna.html" class="J_menuItem"><i class="fa fa-circle-o"></i>系部成绩分析</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-download-alt"></i>
                            <span>报表管理</span>
                            <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu" style="display: none;">
                            <li><a href="${staticPath}/excelImportWithScore.html" class="J_menuItem"><i class="fa fa-circle-o"></i>报表导入</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-edit"></i>
                            <span>密码管理</span>
                            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu" style="display: none;">
                            <li><a href="${staticPath}/resetPwd.html" class="J_menuItem"><i class="fa fa-circle-o"></i>修改密码</a></li>
                                <%--<li><a href="pages/charts/morris.html" class="J_menuItem"><i class="fa fa-circle-o">班级历史成绩</i></a></li>--%>
                                <%--<li><a href="pages/charts/flot.html" class="J_menuItem"><i class="fa fa-circle-o"></i> Flot图表</a></li>--%>
                                <%--<li><a href="pages/charts/inline.html" class="J_menuItem"><i class="fa fa-circle-o"></i> 线性图表</a></li>--%>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </section>
            <!-- /.sidebar-menu -->

        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <!-- Main content -->
        <section class="center" >
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="550" src="${staticPath}/welcome" frameborder="0"
                        scrolling="auto">
                </iframe>
            </div>
            <!-- Your Page Content Here -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer text-center">
        <strong>Copyright &copy; 2018 <a href="http://www.chenggong.edu.cn/">成功学院</a>.</strong> All rights reserved.
    </footer>

</div>
<script src="${staticPath}/static/jquery/jquery-2.2.3.min.js"></script>
<script src="${staticPath}/js/click.js"></script>
<script>
    $("#logout").click(function () {
        $.ajax({
            type: "POST",
            url: "v1/api/user/logout",
            dataType: "json",
            success: function (result) {
                window.location.href = "/";
            }
        });
    });



</script>

<!-- Bootstrap 3.3.6 -->
<script src="${staticPath}/static/bootstrap/js/bootstrap.min.js"></script>

<script src="${staticPath}/js/plugins/layer/layer.js"></script>
<script src="${staticPath}/js/plugins/layer/laypage/laypage.js"></script>
<!-- AdminLTE App -->
<script src="${staticPath}/static/dist/js/app.min.js"></script>
<script src="${staticPath}/static/dist/js/pages/dashboard.js"></script>
<script src="${staticPath}/static/dist/js/app.js"></script>
<script src="${staticPath}/static/dist/js/demo.js"></script>


</body>
</html>
