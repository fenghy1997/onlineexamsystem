<%--
  Created by IntelliJ IDEA.
  User: fhy
  Date: 2019/3/19
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/base.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <%--<link rel="icon" href="../../img/bb.ico">--%>
    <title>修改密码</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../../static/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" href="../../css/font-awesome.css">
    <link rel="stylesheet" href="../../static/sweetAlert/sweetalert2.css">
    <!-- Custom styles for this template -->
    <link href="../../css/style.css" rel="stylesheet">

</head>
<body>
<div align="center">
    <div class="modal-body" style="width:40%" id="stuAdd">
        <form class="form-horizontal" >
            <h1><b>修改密码</b></h1>
            <br>
            <div class="form-group">
                <label class="col-sm-2 control-label">原密码:</label>
                <div class="col-sm-9">
                    <input type="text"  class="form-control" id="opsd" placeholder="请输入您的原密码">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="ipwd" class="col-sm-2 control-label">新密码:</label>
                <div class="col-sm-9">
                    <input type="password" name="userPass" class="form-control" id="ipwd" placeholder="请输入您的密码">
                    <span class="help-block"></span>
                </div>

                <label for="ipwd" class="col-sm-2 control-label">确认密码:</label>
                <div class="col-sm-9">
                    <input type="password" name="userPass1" class="form-control" id="ipwd1"
                           placeholder="请再次输入您的密码">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">

                <div class="col-sm-2 control-label"><b>验证码:</b></div>
                <div class="col-sm-6">
                    <input id="iyzm" type="text" name="yzm" readonly class="form-control" placeholder="验证码"/>
                    <span class="help-block"></span>
                </div>
                <div class="col-sm-3">
                    <button type="button" id="make_yz_btn" class="btn btn-success" onclick="getyzm2(this);">
                        获取验证码
                    </button>
                </div>
            </div>
        </form>
    </div>

    <div>

        <button type="button" class="btn btn-primary" id="user_reset_btn">Save</button>
    </div>

</div>
<script src="${staticPath}/js/jquery-3.2.1.js"></script>
<script src="${staticPath}/js/bootstrap.min.js"></script>
<script src="${staticPath}/js/SmoothScroll.js"></script>
<script src="${staticPath}/js/theme-scripts.js"></script>
<script src="${staticPath}/static/sweetAlert/sweetalert2.all.min.js"></script>
<%--<script src="${staticPath}/js/change.js"></script>--%>
<%--<script src="${staticPath}/js/index.js"></script>--%>
<script>

    $("#user_reset_btn").click(function () {


        if (!check()) {
            return false;
        }

        if ($(this).attr("ajax_va1") == "error" ||
            $(this).attr("ajax_va") == "error" ||
            $(this).attr("ajax_va2") == "error") {
            return false;
        }


        var arr = $("#stuAdd form").serialize();
        $.ajax({
            url: "${staticPath}/v1/api/user/resetPwd",
            type: "POST",
            dataType: "json",
            data: arr,//序列化保存的数据
            success: function (result) {
                if (result.resultCode === 20000) {
                    swal("修改成功！","","success")
                    $('#stuAdd').modal('hide')
                } else {
                    swal("修改失败！","","success")
                }
            }
        });
    });

    function check() {
        var password = $('#ipwd').val().trim();
        var password1 = $('#ipwd1').val().trim();
        var oldpwd = $('#opsd').val().trim();
        var yzm = $('#iyzm').val().trim();
        var rpassword = /^[\w]{6,12}$/;
        var rname = /^(^[\u2E80-\u9FFF]{2,15})$/;
        var rphone = /^1[3|4|5|7|8|9][0-9]\d{8}$/;
        var rpwd = /^([a-zA-Z0-9]{6,16})$/;
        var ryzm = /^[0-9]{6}$/;
        //验证密码
        if (password == null || password == '') {
            show_validate_msg("#ipwd", "error", "密码不能为空！");
            return false;
        } else if (!rpwd.test(password)) {
            show_validate_msg("#ipwd", "error", "密码格式不正确！");
            return false;
        } else if (password != password1) {
            show_validate_msg("#ipwd", "error", "两次密码不一致，请重新输入！");
            return false;
        }
        else {
            show_validate_msg("#ipwd", "success", "");
            return true;
        }

        if (yzm == null || yzm == '') {
            show_validate_msg("#iyzm", "error", "验证码不能为空！");
            return false;
        } else if (!ryzm.test(yzm)) {
            show_validate_msg("#iyzm", "error", "验证码格式不正确！");
            return false;
        } else {
            show_validate_msg("#iyzm", "success", "");
            return true;
        }
    }

    function  changetime(obj,ele) {
        if (countdown == 0) {
            yzmre(ele);
            $(obj).removeAttr('disabled');
            $(obj).text("获取验证码");
            countdown = 60;
            return false;
        } else {
            yzmzt(ele);
            $(obj).attr({'disabled': 'disabled'});
            $(obj).text("重新发送(" + countdown + ")");
            countdown--;
        }
        setTimeout(function() {
            changetime(obj);
        },1000);
    }

    function yzmzt(ele) {
        $(ele).removeAttr('readonly');
    }

    function yzmre(ele) {
        $(ele).attr({'readonly': 'readonly'});
    }

    function show_validate_msg(ele,status,msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text(" ");
        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    <!--获取注册验证码-->
    function getyzm2(obj) {

        var email = null;
        var oldpwd = $('#opsd').val().trim();



        if (!check()) {
            return false;
        }

        changetime(obj, '#iyzm');//倒计时60s

        $.ajax({
            type: 'get',
            url: '${staticPath}/v1/api/mail/sendYZMpwd',
            dataType: "json",
            data: {"oldpwd": oldpwd},
            success: function (result) {
                if (result.resultCode === 20000) {
                    swal("发送成功!", result.resultMsg,"success");
                    $("#user_reset_btn").attr("ajax_va2", "success");
                    window.setTimeout(show, 60000);

                    function show() {
                        $.ajax({
                            type: 'get',
                            data: {"oldpwd": oldpwd},
                            url: '${staticPath}/v1/api/mail/checkOutYZMpwd',
                            dataType: "json",
                            success: function (result) {
                                if (result.resultCode === 20000) {
                                    yzmre('#iyzm');
                                    $(obj).removeAttr('disabled');
                                }
                            }
                        });
                    }
                } else {
                    swal("", "error", result.extend.va_msg);
                    $("#user_reset_btn").attr("ajax_va2", "error");
                    yzmre('#iyzm');
                    $(obj).removeAttr('disabled');
                }
            }
        });
    }


    var countdown = 60;

    function changetime(obj, ele) {
        if (countdown == 0) {
            yzmre(ele);
            $(obj).removeAttr('disabled');
            $(obj).text("获取验证码");
            countdown = 60;
            return false;
        } else {
            yzmzt(ele);
            $(obj).attr({'disabled': 'disabled'});
            $(obj).text("重新发送(" + countdown + ")");
            countdown--;
        }
        setTimeout(function () {
            changetime(obj);
        }, 1000);
    }
</script>
</body>
</html>
