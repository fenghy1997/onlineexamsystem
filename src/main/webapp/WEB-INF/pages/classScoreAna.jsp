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
    <title>班级成绩报告</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${staticPath}/static/bootstrap/css/bootstrap.css">
    <!-- fileinput core CSS -->
    <link rel="stylesheet" href="${staticPath}/static/bootstrap-file-input/css/fileinput.css">
    <link rel="stylesheet" href="${staticPath}/css/font-awesome.css">
    <link rel="stylesheet" href="${staticPath}/static/sweetAlert/sweetalert2.css">
    <!-- Custom styles for this template -->
    <link href="${staticPath}/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="container-fluid">
            <div class="row">
                <label class="control-label btn-lg"></label>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">

                                <div id="yearSetTableToolBar">
                                    <div class="col-sm-4 col-lg-3 col-md-3 col-xs-12">
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon btn-success"><span style="margin: 0px 10px">年份</span></span>
                                            <select class="selectpicker form-control" style="height: 40px"
                                                    name="period" id="yearSelect"
                                                    data-style="btn-default btn-outline"
                                                    noneSelectedText="不限">
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div id="teamSetTableToolBar">
                                    <div class="col-sm-4 col-lg-3 col-md-3 col-xs-12">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-addon btn-success"><span style="margin: 0px 10px">学期</span></span>
                                            <select class="selectpicker form-control" style="height: 40px"
                                                    name="period" id="teamSelect"
                                                    data-style="btn-default btn-outline"
                                                    noneSelectedText="不限">
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div id="classSetTableToolBar">
                                    <div class="col-sm-4 col-lg-3 col-md-3 col-xs-12">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-addon btn-success"><span style="margin: 0px 10px">学期</span></span>
                                            <select class="selectpicker form-control" style="height: 40px"
                                                    name="period" id="classSelect"
                                                    data-style="btn-default btn-outline"
                                                    noneSelectedText="不限">
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div id="classNameSetTableToolBar">
                                    <div class="col-sm-4 col-lg-3 col-md-3 col-xs-12">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-addon btn-success"><span style="margin: 0px 10px">科目</span></span>
                                            <select class="selectpicker form-control" style="height: 40px"
                                                    name="period" id="classNameSelect"
                                                    data-style="btn-default btn-outline"
                                                    noneSelectedText="不限">
                                            </select>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-6 col-lg-6 col-md-6 col-xs-6">
                                    <div style="height: 400px; width: 100%;" id="classEchars">

                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-6 col-md-6 col-xs-6">
                                    <div style="height: 400px; width: 100%;" id="classEchars2">

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-lg-6 col-md-6 col-xs-6">
                                    <div style="height: 400px; width: 100%;" id="classEchars3">

                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-6 col-md-6 col-xs-6">
                                    <div style="height: 400px; width: 100%;" id="classEchars4">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script src="${staticPath}/js/jquery-3.2.1.js"></script>
<!-- fileinput core js -->
<script src="${staticPath}/static/bootstrap-file-input/js/fileinput.js"></script>
<script src="${staticPath}/static/bootstrap-file-input/js/locales/zh.js"></script>
<script src="${staticPath}/static/sweetAlert/sweetalert2.all.min.js"></script>
<!-- Bootstrap core js -->
<script src="${staticPath}/static/bootstrap/js/bootstrap.js"></script>

<script src="${staticPath}/js/echarts.min.js"></script>


<script>
    $(function () {
        setSelectYearAndTeam();
        getClassEchars();
    });

    function setSelectYearAndTeam() {
        var stateName=['第一学期','第二学期']
        for (var i = 1; i < 3; i++) {
            $("#teamSelect").append('<option value="' +i+ '">' +stateName[i-1] + '</option>');
        }

        var dataTime=new Date();
        var year=[];
        var fullYear = dataTime.getFullYear();
        for (var i = 3; i >0 ; i--) {
            year.push(fullYear-(i));
        }
        for (var i = 0; i <3 ; i++) {
            year.push(fullYear+i);
        }


        for (var i = 1; i < year.length; i++) {
            $("#yearSelect").append('<option value="' +year[i]+ '">' +year[i] + '</option>');
        }

        $.ajax({
            type: "GET",
            url: "v1/api/class/getClassName",
            dataType: "json",
            success: function (result) {
                var data=result.result;
                $.each(data, function(index, value) {
                    $("#classSelect").append('<option value="' +value.className+ '">' +value.className + '</option>');
                });
                var year=$("#yearSelect option:selected").val();
                var team=$("#teamSelect option:selected").val();
                var className=$("#classSelect option:selected").val();
                $.ajax({
                    type: "Post",
                    url: "v1/api/score/getScoreClassName",
                    contentType:"application/json",
                    dataType: "json",
                    data: JSON.stringify({scoreTime:year,scoreTeam:team,className:className}),
                    success: function (result) {
                        var data=result.result;
                        $.each(data, function(index, value) {
                            $("#classNameSelect").append('<option value="' +value+ '">' +value + '</option>');
                        });
                    }
                });
            }
        });

    }

    function getClassEchars() {
        var myChart= echarts.init(document.getElementById("classEchars"));
        var myChart2= echarts.init(document.getElementById("classEchars2"));
        var myChart3= echarts.init(document.getElementById("classEchars3"));
        var myChart4= echarts.init(document.getElementById("classEchars4"));
        var option = {
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'邮件营销',
                    type:'line',
                    stack: '总量',
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name:'联盟广告',
                    type:'line',
                    stack: '总量',
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name:'视频广告',
                    type:'line',
                    stack: '总量',
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name:'直接访问',
                    type:'line',
                    stack: '总量',
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name:'搜索引擎',
                    type:'line',
                    stack: '总量',
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };

        myChart.setOption(option,true);
        myChart2.setOption(option,true);
        myChart3.setOption(option,true);
        myChart4.setOption(option,true);
    }




</script>
</html>
