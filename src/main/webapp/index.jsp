<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/base.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <%--<link rel="icon" href="${staticPath}/img/bb.ico">--%>
    <title>信息工程系成绩分析系统</title>
    <!-- Bootstrap core CSS -->
    <%@ include file="common/commons.jsp" %>
    <%--<script src="js/jquery-3.2.1.js"></script>--%>
    <%--<script src="${staticPath}/js/jquery.min.js"></script>--%>
    <link href="${staticPath}/js/datatime/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="${staticPath}/js/datatime/moment-with-locales.js"></script>
    <script src="${staticPath}/js/datatime/bootstrap-datetimepicker.min.js"></script>
    <script src="${staticPath}/js/datatime/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${staticPath}/js/echarts-all.js"></script>
    <%--<link rel="stylesheet" href="css/font-awesome.min.css">--%>


    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
</head>


<body id="page-top">
<!--修改密码-->
<div class="modal fade" id="changePwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal jqtransformdone">
                    <br>
                    <div class="form-group">
                        <label for="stuEmail" class="col-sm-2 control-label">邮箱:</label>
                        <div class="col-sm-9">
                            <input type="text" name="email" class="form-control" id="sEmail" placeholder="123@qq.com">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stupassword" class="col-sm-2 control-label">新密码:</label>
                        <div class="col-sm-9">
                            <input type="password" name="password" class="form-control" id="stupassword1" placeholder="yourpassword">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stupassword2" class="col-sm-2 control-label">确认密码:</label>
                        <div class="col-sm-9">
                            <input type="password" name="password" class="form-control" id="stupassword2" placeholder="yourpassword">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2"></div>
                        <div class="col-sm-6">
                            <input id="mimayzm" type="text" readonly class="form-control" placeholder="验证码"/>
                            <span  class="help-block"></span>
                        </div>
                        <div class="col-sm-3">
                            <button type="button" class="btn btn-danger" onclick="getyzm(this);">获取验证码</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_change_btn">确定</button>
            </div>
        </div>
    </div>
</div>

<!--修改密码-->
<div class="modal fade" id="msg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h2>密码修改成功！</h2>
            </div>
        </div>
    </div>
</div>
<!--login-->
<div class="modal fade" id="stulogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <br>
                    <div class="form-group">
                        <label for="stuNum" class="col-sm-2 control-label">学号:</label>
                        <div class="col-sm-9">
                            <input type="text" name="userNum" class="form-control" id="stuNum" placeholder="2015341318">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stupassword" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" name="userPass" class="form-control" id="stupassword" placeholder="yourpassword">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <span id="wangjimima" class="col-sm-3 " style="cursor: pointer;color: red">忘记密码？</span>
                <span class="col-sm-4 "></span>
                <button type="button" class="btn btn-default col-sm-2" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary col-sm-2" id="stu_login_btn">Save</button>
            </div>
        </div>
    </div>
</div>
<!--注册-->
<div class="modal fade" id="stuAdd" tstuabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <br>
                    <div class="form-group">
                        <label for="iname" class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" class="form-control" id="iname" placeholder="请输入您的姓名">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<label  class="col-sm-2 control-label">性别:</label>--%>
                        <%--<div class="col-sm-8">--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="sex" id="isex1" value="M" checked> MAN--%>
                            <%--</label>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="sex" id="isex2" value="w"> WOMAN--%>
                            <%--</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="form-group">--%>
                        <%--<label for="iage" class="col-sm-2 control-label">年龄:</label>--%>
                        <%--<div class="col-sm-9">--%>
                            <%--<input type="text" name="age" class="form-control" id="iage" placeholder="请输入您的年龄">--%>
                            <%--<span  class="help-block"></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="niname" class="col-sm-2 control-label">昵称:</label>--%>
                        <%--<div class="col-sm-9">--%>
                            <%--<input type="text" name="nickname" class="form-control" id="niname" placeholder="请输入您的昵称">--%>
                            <%--<span  class="help-block"></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label for="ibrith" class="col-sm-2 control-label">出生年月:</label>--%>
                        <%--<div class="col-sm-9">--%>
                            <%--<input type='text' name="brith" class="form-control" id='ibrith' placeholder="请选择您的出生日期" />--%>
                            <%--<span  class="help-block"></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="iphone" class="col-sm-2 control-label">联系方式:</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" id="iphone" placeholder="请输入您的联系方式">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label for="iaddress" class="col-sm-2 control-label">寝室住址:</label>--%>
                        <%--<div class="col-sm-9">--%>
                            <%--<input type="text" name="docuAddress" class="form-control" id="iaddress" placeholder="请输入您的寝室住址（几号楼-几号房间）">--%>
                            <%--<span  class="help-block"></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="form-group">--%>
                        <%--<label for="iemail" class="col-sm-2 control-label">邮箱:</label>--%>
                        <%--<div class="col-sm-9">--%>
                            <%--<input type="text" name="email" class="form-control " id="iemail" placeholder="请输入您的邮箱">--%>
                            <%--<span  class="help-block"></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="ipwd" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" name="password" class="form-control" id="ipwd" placeholder="请输入您的密码">
                            <span  class="help-block"></span>
                        </div>

                        <label for="ipwd" class="col-sm-2 control-label">确认密码:</label>
                        <div class="col-sm-9">
                            <input type="password" name="password" class="form-control" id="ipwd1" placeholder="请再次输入您的密码">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <%--<div class="col-md-2"></div>--%>
                        <%--<div class="col-sm-6">--%>
                            <%--<input id="iyzm" type="text" name="yzm" readonly class="form-control" placeholder="验证码"/>--%>
                            <%--<span  class="help-block"></span>--%>
                        <%--</div>--%>
                        <%--<div class="col-sm-3">--%>
                            <%--<button type="button" id="make_yz_btn" class="btn btn-danger" onclick="getyzm2(this);">获取验证码</button>--%>
                        <%--</div>--%>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">Save</button>
            </div>
        </div>
    </div>
</div>
<!-- Navigation -->
<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand page-scroll">
                <div>
                    <h1><b>信息工程系成绩分析系统</b></h1>
                </div>
               </span>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <%--<li>--%>
                    <%--<a class="page-scroll" href="#about">关于学院</a>--%>
                <%--</li>--%>
                <c:if test="${not empty sessionScope.userinfo}">
                    <li>
                        <a class="page-scroll" id="peocenter" mark="${sessionScope.userinfo.userId}" style="cursor: pointer">个人中心</a>
                    </li>
                    <li>
                        <a class="page-scroll"  id="logout" style="cursor: pointer">退出</a>
                    </li>
                </c:if>
                <c:if test="${ empty sessionScope.userinfo}">
                    <li>
                        <a class="page-scroll" id="resert" style="cursor: pointer">注册</a>
                    </li>
                    <li>
                        <a class="page-scroll"  id="login" style="cursor: pointer">登录</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>




<section id="about" class="mz-module">
    <div style="height: 600px; width: 85%;margin-left: 100px" id="indexEchart">

    </div>
</section>





<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--引入jqury-->
<script src="${staticPath}/js/bootstrap.min.js"></script>
<script src="${staticPath}/js/SmoothScroll.js"></script>
<script src="${staticPath}/js/theme-scripts.js"></script>
<script src="js/index.js"></script>

<script>
    $(function () {
        showEchars();
    })
    //弹出模态框
    $("#login").click(function(){
        // //清除表单数据和样式
        reset_form("#stulogin form");
        //弹出模态框
        $("#stulogin").modal({
            backdrop:"static"
        });
    });

    $("#stu_login_btn").click(function () {

        // if(!validate_add_form("#stuNum")){
        //     return false;
        // }
        var email=$("#stuNum").val();
        var pwd=$("#stupassword").val();
        //2.发送ajax请求保存员工
        $.ajax({
            url: "v1/api/user/login",
            type:"POST",
            dataType: "json",
            data: {"userNum":email,"userPass":pwd},
            success:function (result) {
                 console.log(result);
                if(result.resultCode == 20000) {
                    //1.关闭模态框
                    $("#stulogin").modal('hide');
                    window.location.href = "${staticPath}/personCon";
                }else{
                    if(result.code == 404){
                        show_validate_msg("#stuNum","error",result.resultMsg);
                    }
                    if(result.code == 200){
                        show_validate_msg("#stupassword","error",result.resultMsg);
                    }
                }
            }
        });
    });

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

    $("#peocenter").click(function () {
        window.location.href = "${staticPath}/personCon";
    })


    function showEchars() {


       var myChart= echarts.init(document.getElementById("indexEchart"));
       var  option = {
            title : {
                text: '信息工程系学生分布',
                subtext: '数据来自信息工程系'
            },
            tooltip : {
                trigger: 'item'
            },
            legend: {
                x:'right',
                selectedMode:false,
                data:['男','女']
            },
            dataRange: {
                orient: 'horizontal',
                min: 0,
                max: 70000,
                text:['高','低'],           // 文本，默认为数值文本
                splitNumber:0,
                color: ['orangered','yellow','lightskyblue','green']

            },
            toolbox: {
                show : true,
                orient: 'vertical',
                x:'right',
                y:'center',
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false}
                }
            },
            series : [
                {
                    name: '信息工程系学生分布',
                    type: 'map',
                    mapType: 'china',
                    mapLocation: {
                        x: 'left'
                    },
                    selectedMode : 'multiple',
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    data:[
                        {name:'西藏', value:605},
                        {name:'青海', value:1670},
                        {name:'宁夏', value:2102},
                        {name:'海南', value:2522},
                        {name:'甘肃', value:5020},
                        {name:'贵州', value:5701},
                        {name:'新疆', value:6610},
                        {name:'云南', value:8893},
                        {name:'重庆', value:10011},
                        {name:'吉林', value:10568},
                        {name:'山西', value:11237},
                        {name:'天津', value:11307},
                        {name:'江西', value:11702},
                        {name:'广西', value:11720},
                        {name:'陕西', value:12512},
                        {name:'黑龙江', value:1258},
                        {name:'内蒙古', value:14359},
                        {name:'安徽', value:15300},
                        {name:'北京', value:16251},
                        {name:'福建', value:17560},
                        {name:'上海', value:19195},
                        {name:'湖北', value:29632},
                        {name:'湖南', value:29669},
                        {name:'四川', value:21026},
                        {name:'辽宁', value:22226},
                        {name:'河北', value:24515},
                        {name:'河南', value:96931},
                        {name:'浙江', value:32318},
                        {name:'山东', value:35361},
                        {name:'江苏', value:39110},
                        {name:'广东', value:33210},
                        {name:'台湾', value:11210},
                        {name:'南海诸岛', value:210},
                        // {name:'广东', value:53210.28, selected:true}
                    ]
                },
                {
                    name:'信工系男女比例',
                    type:'pie',
                    roseType : 'area',
                    tooltip: {
                        trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                    center: [document.getElementById('indexEchart').offsetWidth -350,225],
                    radius: [30, 120],
                    data:[
                        {name: '男', value: 16251},
                        {name: '女', value: 9195},

                    ]
                }
            ],
            animation: false
        };
        myChart.setOption(option,true);
    }
</script>



<%--<script>--%>




<%--//注册用户--%>

<%--$("#user_save_btn").click(function () {--%>


<%--if (!check()) {--%>
<%--return false;--%>
<%--}--%>

<%--if ($(this).attr("ajax_va1") == "error" ||--%>
<%--$(this).attr("ajax_va") == "error" ||--%>
<%--$(this).attr("ajax_va2") == "error") {--%>
<%--return false;--%>
<%--}--%>


<%--var arr = $("#stuAdd form").serialize();--%>
<%--$.ajax({--%>
<%--url: "${staticPath}/user/reg",--%>
<%--type: "POST",--%>
<%--dataType: "json",--%>
<%--data: arr,//序列化保存的数据--%>
<%--success: function (result) {--%>
<%--//员工保存成功--%>
<%--if (result.code == 100) {--%>
<%--alert("注册成功！");--%>
<%--//1.关闭模态框--%>
<%--$('#stuAdd').modal('hide')--%>
<%--} else {--%>
<%--if (result.code == 200) {--%>

<%--if (result.extend.errors == 'email') {--%>
<%--show_validate_msg("#iemail", "error", "邮箱已存在！");--%>
<%--}--%>
<%--if (result.extend.errors == 'niname') {--%>
<%--show_validate_msg("#niname", "error", "昵称已存在！");--%>
<%--}--%>
<%--if (result.extend.errors == 'error') {--%>
<%--show_validate_msg("#iyzm", "error", "验证码输入错误！");--%>
<%--}--%>
<%--else {--%>
<%--show_validate_msg("#iemail", "error", result.extend.errorFileds.email);--%>
<%--}--%>
<%--}--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--});--%>

<%--//清除表单数据和样式--%>
<%--function reset_form(ele) {--%>
<%--$(ele)[0].reset();--%>
<%--//清除表单样式--%>
<%--$(ele).find("*").removeClass("has-success has-error");--%>
<%--$(ele).find(".help-block").text("");--%>
<%--}--%>

<%--<!--忘记密码，修改密码-->--%>
<%--$("#wangjimima").click(function () {--%>
<%--//1.关闭模态框--%>
<%--$("#stulogin").modal('hide');--%>
<%--setTimeout(function () {--%>
<%--reset_form("#changePwd form");--%>
<%--$("#changePwd").modal({--%>
<%--backdrop: "static"--%>
<%--});--%>
<%--}, 600);--%>
<%--//2打开修改密码的模态框--%>
<%--});--%>

<%--function checkyzm() {--%>
<%--var email = $("#sEmail").val();--%>
<%--var pwd = $("#stupassword1").val();--%>
<%--var pwd2 = $("#stupassword2").val();--%>
<%--var regPwd = /^([a-z0-9A-Z]{6,14})$/;--%>
<%--if (email == '') {--%>
<%--show_validate_msg("#sEmail", "error", "请输入邮箱！");--%>
<%--return false;--%>
<%--}--%>
<%--if (pwd == '') {--%>
<%--show_validate_msg("#stupassword1", "error", "请输入密码！");--%>
<%--return false;--%>

<%--} else if (!regPwd.test(pwd)) {--%>
<%--show_validate_msg("#stupassword1", "error", "密码格式不对！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#stupassword1", "success", "");--%>
<%--return true;--%>
<%--}--%>

<%--if (pwd2 == '') {--%>
<%--show_validate_msg("#stupassword2", "error", "请输入密码！");--%>
<%--return false;--%>
<%--} else if (pwd == pwd2) {--%>
<%--show_validate_msg("#stupassword2", "success", "");--%>
<%--return true;--%>
<%--} else {--%>
<%--show_validate_msg("#stupassword2", "error", "两次密码不一致！");--%>
<%--return false;--%>
<%--}--%>

<%--var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;--%>
<%--if (!regEmail.test(email)) {--%>
<%--//alert("邮箱格式不正确")--%>
<%--return false;--%>
<%--}--%>
<%--}--%>

<%--<!--获取验证码-->--%>
<%--function getyzm(obj) {--%>
<%--var email = $("#sEmail").val();--%>
<%--if (!checkyzm()) {--%>
<%--return false;--%>
<%--}--%>

<%--changetime(obj, '#mimayzm');//倒计时60s--%>
<%--$.ajax({--%>
<%--type: 'get',--%>
<%--url: '${staticPath}/user/sendyzm',--%>
<%--dataType: "json",--%>
<%--data: {"email": email},--%>
<%--success: function (result) {--%>
<%--if (result.code == 100) {--%>
<%--show_validate_msg("#sEmail", "success", "");--%>
<%--$("#stu_change_btn").attr("ajax_va", "success");--%>
<%--window.setTimeout(show, 65000);--%>

<%--function show() {--%>
<%--$.ajax({--%>
<%--type: 'get',--%>
<%--data: {"email": email},--%>
<%--url: '${staticPath}/user/checkoutyzm',--%>
<%--dataType: "json",--%>
<%--success: function (result) {--%>
<%--if (result.code == 100) {--%>
<%--yzmre('#mimayzm');--%>
<%--$(obj).removeAttr('disabled');--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--}--%>
<%--} else {--%>
<%--show_validate_msg("#sEmail", "error", result.extend.va_msg);--%>
<%--$("#stu_change_btn").attr("ajax_va", "error");--%>
<%--yzmre('#mimayzm');--%>
<%--$(obj).removeAttr('disabled');--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--}--%>

<%--var countdown = 60;--%>

<%--function changetime(obj, ele) {--%>
<%--if (countdown == 0) {--%>
<%--yzmre(ele);--%>
<%--$(obj).removeAttr('disabled');--%>
<%--$(obj).text("获取验证码");--%>
<%--countdown = 60;--%>
<%--return false;--%>
<%--} else {--%>
<%--yzmzt(ele);--%>
<%--$(obj).attr({'disabled': 'disabled'});--%>
<%--$(obj).text("重新发送(" + countdown + ")");--%>
<%--countdown--;--%>
<%--}--%>
<%--setTimeout(function () {--%>
<%--changetime(obj);--%>
<%--}, 1000);--%>
<%--}--%>

<%--function yzmzt(ele) {--%>
<%--$(ele).removeAttr('readonly');--%>
<%--}--%>

<%--function yzmre(ele) {--%>
<%--$(ele).attr({'readonly': 'readonly'});--%>
<%--}--%>

<%--//修改密码验证邮箱--%>
<%--$("#sEmail").change(function () {--%>
<%--var email = $("#sEmail").val();--%>
<%--if (email == '') {--%>
<%--show_validate_msg("#sEmail", "error", "邮箱不能为空！");--%>
<%--$("#emp_save_btn").attr("ajax_va", "success");--%>
<%--}--%>

<%--var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;--%>
<%--if (!regEmail.test(email)) {--%>
<%--//alert("邮箱格式不正确")--%>
<%--show_validate_msg("#sEmail", "error", "邮箱格式不正确");--%>

<%--} else {--%>
<%--show_validate_msg("#sEmail", "success", " ");--%>
<%--}--%>
<%--});--%>

<%--<!--确认修改密码-->--%>
<%--$("#stu_change_btn").click(function () {--%>
<%--var email = $("#sEmail").val();--%>
<%--var pwd2 = $("#stupassword2").val();--%>
<%--var mimayzm = $("#mimayzm").val();--%>
<%--var regY = /^([0-9]{6})$/;--%>
<%--if (!regY.test(mimayzm)) {--%>
<%--show_validate_msg("#mimayzm", "error", "格式错误，请重新输入！");--%>
<%--return false;--%>
<%--} else if (mimayzm == '') {--%>
<%--show_validate_msg("#mimayzm", "error", "请在60s内输入验证码！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#mimayzm", "success", "");--%>
<%--}--%>

<%--if ($(this).attr("ajax_va") == "error") {--%>
<%--return false;--%>
<%--}--%>

<%--$.ajax({--%>
<%--url: "${staticPath}/user/intoalterpassword",--%>
<%--type: "POST",--%>
<%--dataType: "json",--%>
<%--cache: false,--%>
<%--data: {"email": email, "password": pwd2, "yzm": mimayzm},--%>
<%--success: function (result) {--%>
<%--if (result.code == 100) {--%>
<%--alert("密码修改成功！");--%>
<%--$("#changePwd").modal('hide');--%>
<%--} else {--%>
<%--$("#changePwd").modal('hide');--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--});--%>

<%--//弹出模态框--%>
<%--$("#login").click(function () {--%>
<%--// //清除表单数据和样式--%>
<%--reset_form("#stulogin form");--%>
<%--//弹出模态框--%>
<%--$("#stulogin").modal({--%>
<%--backdrop: "static"--%>
<%--});--%>
<%--});--%>

<%--$("#resert").click(function () {--%>
<%--// //清除表单数据和样式--%>
<%--reset_form("#stuAdd form");--%>
<%--//弹出模态框--%>
<%--$("#stuAdd").modal({--%>
<%--backdrop: "static"--%>
<%--});--%>
<%--});--%>


<%--//清除表单数据和样式--%>
<%--function reset_form(ele) {--%>
<%--$(ele)[0].reset();--%>
<%--//清除表单样式--%>
<%--$(ele).find("*").removeClass("has-success has-error");--%>
<%--$(ele).find(".help-block").text("");--%>
<%--}--%>


<%--//校验表单数据--%>
<%--function validate_add_form(eles) {--%>

<%--//校验email--%>
<%--var empEmail = $(eles).val();--%>
<%--var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;--%>
<%--if (!regEmail.test(empEmail)) {--%>
<%--//alert("邮箱格式不正确")--%>
<%--show_validate_msg(eles, "error", "邮箱格式不正确");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg(eles, "success", "");--%>
<%--}--%>
<%--return true;--%>
<%--}--%>

<%--function show_validate_msg(ele, status, msg) {--%>
<%--$(ele).parent().removeClass("has-success has-error");--%>
<%--$(ele).next("span").text(" ");--%>
<%--if ("success" == status) {--%>
<%--$(ele).parent().addClass("has-success");--%>
<%--$(ele).next("span").text(msg);--%>
<%--} else if ("error" == status) {--%>
<%--$(ele).parent().addClass("has-error");--%>
<%--$(ele).next("span").text(msg);--%>
<%--}--%>
<%--}--%>

<%--$("#stuEmail").change(function () {--%>
<%--validate_add_form("#stuEmail");--%>
<%--});--%>

<%--$("#stu_login_btn").click(function () {--%>

<%--if (!validate_add_form("#stuEmail")) {--%>
<%--return false;--%>
<%--}--%>
<%--var email = $("#stuEmail").val();--%>
<%--var pwd = $("#stupassword").val();--%>
<%--//2.发送ajax请求保存员工--%>
<%--$.ajax({--%>
<%--url: "${staticPath}/user/login",--%>
<%--type: "POST",--%>
<%--dataType: "json",--%>
<%--data: {"email": email, "password": pwd},--%>
<%--success: function (result) {--%>
<%--// console.log(result.code);--%>
<%--if (result.code == 100) {--%>
<%--//1.关闭模态框--%>
<%--$("#stulogin").modal('hide');--%>
<%--window.location.href = "${staticPath}/";--%>
<%--} else {--%>
<%--if (result.code == 404) {--%>
<%--show_validate_msg("#stuEmail", "error", result.extend.errors);--%>
<%--}--%>
<%--if (result.code == 200) {--%>
<%--show_validate_msg("#stupassword", "error", result.extend.errors);--%>
<%--}--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--});--%>


<%--// function Datetime() {--%>
<%--$('#ibrith').datetimepicker({--%>
<%--language: 'zh-CN',//显示中文--%>
<%--format: 'yyyy-mm-dd',//显示格式--%>
<%--minView: "month",//设置只显示到月份--%>
<%--initialDate: new Date(),--%>
<%--autoclose: true,//选中自动关闭--%>
<%--todayBtn: true,//显示今日按钮--%>
<%--locale: moment.locale('zh-cn')--%>
<%--});--%>
<%--//默认获取当前日期--%>
<%--var today = new Date();--%>
<%--var nowdate = (today.getFullYear()) + "-" + (today.getMonth() + 1) + "-" + today.getDate();--%>
<%--//对日期格式进行处理--%>
<%--var date = new Date(nowdate);--%>
<%--var mon = date.getMonth() + 1;--%>
<%--var day = date.getDate();--%>
<%--var mydate = date.getFullYear() + "-" + (mon < 10 ? "0" + mon : mon) + "-" + (day < 10 ? "0" + day : day);--%>
<%--document.getElementById("ibrith").value = mydate;--%>

<%--$("#niname").change(function () {--%>
<%--var nickname = $('#niname').val().trim();--%>
<%--var rniname = /^([a-zA-Z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})$/;--%>
<%--$.ajax({--%>
<%--url: "${staticPath}/user/nicheng",--%>
<%--data: {"nickname": nickname},--%>
<%--type: "get",--%>
<%--dataType: "json",--%>
<%--success: function (result) {--%>
<%--if (result.code == 100) {--%>
<%--//验证昵称--%>
<%--if (nickname == null || nickname == '') {--%>
<%--show_validate_msg("#niname", "error", "昵称不能为空！");--%>
<%--$("#user_save_btn").attr("ajax_va1", "error");--%>
<%--} else if (!rniname.test(nickname)) {--%>
<%--show_validate_msg("#niname", "error", "昵称可以是2-5位中文或者5-16位英文和数字的组合");--%>
<%--$("#user_save_btn").attr("ajax_va1", "error");--%>
<%--} else {--%>
<%--show_validate_msg("#niname", "success", "昵称可以使用！");--%>
<%--$("#user_save_btn").attr("ajax_va1", "success");--%>
<%--}--%>
<%--} else {--%>
<%--show_validate_msg("#niname", "error", "昵称已经被使用！");--%>
<%--$("#user_save_btn").attr("ajax_va1", "error");--%>
<%--validate_yz_button();--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--});--%>

<%--function validate_yz_button(ele) {--%>
<%--if (ele == 'error') {--%>
<%--$("#make_yz_btn").attr({'disabled': 'disabled'});--%>
<%--} else if (ele = 'success') {--%>
<%--$("#make_yz_btn").removeAttr('disabled');--%>
<%--}--%>
<%--}--%>

<%--$("#iemail").change(function () {--%>
<%--var email = $('#iemail').val().trim();--%>
<%--var remail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;--%>
<%--$.ajax({--%>
<%--url: "${staticPath}/user/yEmail",--%>
<%--data: {"email": email},--%>
<%--type: "get",--%>
<%--dataType: "json",--%>
<%--success: function (result) {--%>
<%--if (result.code == 100) {--%>
<%--//验证昵称--%>
<%--if (email == null || email == '') {--%>
<%--show_validate_msg("#iemail", "error", "邮箱不能为空！");--%>
<%--$("#user_save_btn").attr("ajax_va", "error");--%>
<%--validate_yz_button('error');--%>
<%--} else if (!remail.test(email)) {--%>
<%--show_validate_msg("#iemail", "error", "邮箱格式不对！");--%>
<%--$("#user_save_btn").attr("ajax_va", "error");--%>
<%--validate_yz_button('error');--%>
<%--} else {--%>
<%--show_validate_msg("#iemail", "success", "邮箱可以注册使用！");--%>
<%--$("#user_save_btn").attr("ajax_va", "success");--%>
<%--validate_yz_button('success');--%>
<%--}--%>
<%--} else {--%>
<%--show_validate_msg("#iemail", "error", "邮箱已经被使用！");--%>
<%--$("#user_save_btn").attr("ajax_va", "error");--%>
<%--validate_yz_button('error');--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--});--%>

<%--function check() {--%>
<%--var password = $('#ipwd').val().trim();--%>
<%--var age = $('#iage').val().trim();--%>
<%--var name = $('#iname').val().trim();--%>
<%--var phone = $('#iphone').val().trim();--%>
<%--var brith = $('#ibrith').val().trim();--%>
<%--var docuaddress = $('#iaddress').val().trim();--%>
<%--var yzm = $('#iyzm').val().trim();--%>

<%--var rpassword = /^[\w]{6,12}$/;--%>
<%--var rname = /^(^[\u2E80-\u9FFF]{2,15})$/;--%>
<%--var rage = /^([0-9]{2})$/;--%>
<%--var rbrith = /^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;--%>
<%--var rphone = /^1[3|4|5|7|8|9][0-9]\d{8}$/;--%>
<%--var rpwd = /^([a-zA-Z0-9]{6,16})$/;--%>
<%--var raddress = /^(([1|2][0-9])|[1-9])-([1-6][0-2][0-9]|[1-6][3][1-5])$/;--%>
<%--var ryzm = /^[0-9]{6}$/;--%>
<%--//验证姓名--%>
<%--if (name == null || name == '') {--%>
<%--show_validate_msg("#iname", "error", "姓名不能为空！");--%>
<%--return false;--%>
<%--} else if (!rname.test(name)) {--%>
<%--show_validate_msg("#iname", "error", "姓名可以是2-15位中文！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#iname", "success", "");--%>
<%--}--%>
<%--//验证年龄--%>
<%--if (age == null || age == '') {--%>
<%--show_validate_msg("#iage", "error", "年龄不能为空！");--%>
<%--return false;--%>
<%--} else if (!rage.test(age)) {--%>
<%--show_validate_msg("#iage", "error", "年龄只能为两位数字！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#iage", "success", "");--%>
<%--}--%>

<%--//验证出生年月--%>
<%--if (brith == null || brith == '') {--%>
<%--show_validate_msg("#ibrith", "error", "出生年月不能为空！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#ibrith", "success", "");--%>
<%--}--%>
<%--//验证手机号--%>
<%--if (phone == null || phone == '') {--%>
<%--show_validate_msg("#iphone", "error", "手机不能为空！");--%>
<%--return false;--%>
<%--} else if (!rphone.test(phone)) {--%>
<%--show_validate_msg("#iphone", "error", "手机格式不正确！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#iphone", "success", "");--%>
<%--}--%>

<%--//验证住址--%>
<%--if (docuaddress == null || docuaddress == '') {--%>
<%--show_validate_msg("#iaddress", "error", "住址不能为空！");--%>
<%--return false;--%>
<%--} else if (!raddress.test(docuaddress)) {--%>
<%--show_validate_msg("#iaddress", "error", "请输入正确的寝室住址！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#iaddress", "success", "");--%>
<%--}--%>
<%--//验证密码--%>
<%--if (password == null || password == '') {--%>
<%--show_validate_msg("#ipwd", "error", "密码不能为空！");--%>
<%--return false;--%>
<%--} else if (!rpwd.test(password)) {--%>
<%--show_validate_msg("#ipwd", "error", "密码格式不正确！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#ipwd", "success", "");--%>
<%--return true;--%>
<%--}--%>

<%--if (yzm == null || yzm == '') {--%>
<%--show_validate_msg("#iyzm", "error", "验证码不能为空！");--%>
<%--return false;--%>
<%--} else if (!ryzm.test(yzm)) {--%>
<%--show_validate_msg("#iyzm", "error", "验证码格式不正确！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#iyzm", "success", "");--%>
<%--return true;--%>
<%--}--%>
<%--}--%>

<%--<!--获取注册验证码-->--%>
<%--function getyzm2(obj) {--%>
<%--var email = $('#iemail').val().trim();--%>
<%--var remail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;--%>
<%--if (email == null || email == '') {--%>
<%--show_validate_msg("#iemail", "error", "邮箱不能为空！");--%>
<%--return false;--%>
<%--} else if (!remail.test(email)) {--%>
<%--show_validate_msg("#iemail", "error", "邮箱格式不对！");--%>
<%--return false;--%>
<%--} else {--%>
<%--show_validate_msg("#iemail", "success", "");--%>
<%--}--%>


<%--if (!check()) {--%>
<%--return false;--%>
<%--}--%>

<%--changetime(obj, '#iyzm');//倒计时60s--%>

<%--$.ajax({--%>
<%--type: 'get',--%>
<%--url: '${staticPath}/user/sendyzm2',--%>
<%--dataType: "json",--%>
<%--data: {"email": email},--%>
<%--success: function (result) {--%>
<%--if (result.code == 100) {--%>
<%--show_validate_msg("#iemail", "success", "");--%>
<%--$("#user_save_btn").attr("ajax_va2", "success");--%>
<%--window.setTimeout(show, 60000);--%>

<%--function show() {--%>
<%--$.ajax({--%>
<%--type: 'get',--%>
<%--data: {"email": email},--%>
<%--url: '${staticPath}/user/checkoutyzm',--%>
<%--dataType: "json",--%>
<%--success: function (result) {--%>
<%--if (result.code == 100) {--%>
<%--yzmre('#iyzm');--%>
<%--$(obj).removeAttr('disabled');--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--}--%>
<%--} else {--%>
<%--show_validate_msg("#iemail", "error", result.extend.va_msg);--%>
<%--$("#user_save_btn").attr("ajax_va2", "error");--%>
<%--yzmre('#iyzm');--%>
<%--$(obj).removeAttr('disabled');--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--}--%>

<%--$("#peocenter").click(function () {--%>
<%--window.location.href = "${staticPath}/user/personCon";--%>
<%--});--%>

<%--////////////////////////////评论区////////////////////////////--%>


<%--$("#leaveMSG").click(function () {--%>
<%--var id = $("#peocenter").attr("mark");--%>
<%--if (id == undefined) {--%>
<%--layer.msg("请您先登录！");--%>
<%--return false;--%>
<%--}--%>
<%--var msg = layer.open({--%>
<%--type: 2,--%>
<%--title: '留言板',--%>
<%--shadeClose: false,--%>
<%--shade: 0.6,--%>
<%--// maxmin: true, //开启最大化最小化按钮--%>
<%--//area: ['864px', '600px'],--%>
<%--content: '${staticPath}/leaveMsg'--%>
<%--});--%>
<%--layer.full(msg);--%>
<%--});--%>

<%--$("#naxin").click(function () {--%>
<%--var id = $("#peocenter").attr("mark");--%>

<%--if (id == undefined) {--%>
<%--layer.msg("请您先登录！");--%>
<%--return false;--%>
<%--}--%>
<%--var msg = layer.open({--%>
<%--type: 2,--%>
<%--title: '学生会纳新',--%>
<%--shadeClose: false,--%>
<%--shade: 0.6,--%>
<%--// maxmin: true, //开启最大化最小化按钮--%>
<%--//area: ['864px', '600px'],--%>
<%--content: '${staticPath}/newsMsg'--%>
<%--});--%>
<%--layer.full(msg);--%>
<%--});--%>


<%--$("#news_msg").click(function () {--%>
<%--var id = $("#peocenter").attr("mark");--%>

<%--if (id == undefined) {--%>
<%--layer.msg("请您先登录！");--%>
<%--return false;--%>
<%--}--%>
<%--var msg = layer.open({--%>
<%--type: 2,--%>
<%--title: '学生会动态',--%>
<%--shadeClose: false,--%>
<%--shade: 0.6,--%>
<%--// maxmin: true, //开启最大化最小化按钮--%>
<%--//area: ['864px', '600px'],--%>
<%--content: '${staticPath}/naXinJSP'--%>
<%--});--%>
<%--layer.full(msg);--%>
<%--});--%>


<%--</script>--%>
</body>
</html>
