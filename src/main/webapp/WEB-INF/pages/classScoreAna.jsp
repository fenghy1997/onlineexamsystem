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
                                <c:if test="${sessionScope.userinfo.status==1}">
                                <div id="classSetTableToolBar">
                                    <div class="col-sm-4 col-lg-3 col-md-3 col-xs-12">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-addon btn-success"><span style="margin: 0px 10px">班级</span></span>
                                            <select class="selectpicker form-control" style="height: 40px"
                                                    name="period" id="classSelect"
                                                    data-style="btn-default btn-outline"
                                                    noneSelectedText="不限">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
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
                                <div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
                                    <div style="height: 400px; width: 100%;" id="classEchars">

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
                                    <div style="height: 400px; width: 100%;" id="classEchars2">

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
    var status=${sessionScope.userinfo.status}
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
        for (var i = 5; i >0 ; i--) {
            year.push(fullYear-(i));
        }
        for (var i = 0; i <3 ; i++) {
            year.push(fullYear+i);
        }


        for (var i = 1; i < year.length; i++) {
            $("#yearSelect").append('<option value="' +year[i]+ '">' +year[i] + '</option>');
        }
        getDataClassWithName();
        getSourceName();
    }

    function getDataClassWithName() {
        $("#classSelect").empty();

        $.ajax({
            type: "GET",
            url: "v1/api/class/getClassName",
            dataType: "json",
            async: false,
            success: function (result) {
                var data=result.result;
                $.each(data, function(index, value) {
                    $("#classSelect").append('<option value="' +value.className+ '">' +value.className + '</option>');
                });
            }
        });
    }

    function getSourceName(){
        $("#classNameSelect").empty();
        var year=$("#yearSelect option:selected").val();
        var team=$("#teamSelect option:selected").val();
        var className=$("#classSelect option:selected").val();
        $.ajax({
            type: "Post",
            url: "v1/api/score/getScoreClassName",
            contentType:"application/json",
            dataType: "json",
            async: false,
            data: JSON.stringify({scoreTime:year,scoreTeam:team,className:className}),
            success: function (result) {
                var data=result.result;
                $.each(data, function(index, value) {
                    $("#classNameSelect").append('<option value="' +value+ '">' +value + '</option>');
                });

            }
        });
    }

    function getClassEchars() {
        var myChart= echarts.init(document.getElementById("classEchars"));
         var myChart2= echarts.init(document.getElementById("classEchars2"));
        // var myChart3= echarts.init(document.getElementById("classEchars3"));
        // var myChart4= echarts.init(document.getElementById("classEchars4"));
        var year=$("#yearSelect option:selected").val();
        var team=$("#teamSelect option:selected").val();
        var scoreClassName=$("#classNameSelect option:selected").val();
        var className=$("#classSelect option:selected").val();

        var xData=[];
        var scores=[];
        var totalNum=[];
        $.ajax({
            type: "Post",
            url: "v1/api/score/getAllScoresWithClass",
            contentType:"application/json",
            dataType: "json",
            async: false,
            data: JSON.stringify({scoreTime:year,scoreTeam:team,className:className,scoreClassName:scoreClassName}),
            success: function (result) {
                var data=result.result;
                console.log(data);
                $.each(data, function(index, value) {
                    xData.push(value.userName);
                    scores.push(value.scoreNum);
                    totalNum.push(value.scoreTotalNum);
                })
            }
        });

        var option = {
            title : {
                text: '成绩分布',
                x:'center'
            },
            tooltip : {
                trigger: 'axis'
            },
            visualMap: {
                show:false,
                max: 100,
                inRange: {
                    color: ['#313695', '#4575b4', '#d15f79', '#abd9e9', '#6df8b4', '#23ff60', '#fe7979', '#fdaf68', '#51d5f4', '#6cd6d7', '#20a50d']
                }
            },
            legend: {
                data:['学科成绩']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : xData,
                    axisLabel: {
                        interval:0,
                        rotate:-40,
                        show: true,
                        textStyle: {
                            color: '#ea7a69',  //更改坐标轴文字颜色
                            fontSize : 10,      //更改坐标轴文字大小
                            width: 5
                        }
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisTick:{
                        show:true
                    },
                    // y 轴线
                    axisLine:{
                        show:true
                    },
                    // 分割线设置
                    splitLine:{
                        show:true
                    },
                    axisLabel:{
                        show:true
                    }
                }
            ],
            series : [
                {
                    name:'成绩',
                    type:'bar',
                    data: scores,
                    itemStyle: {
                        normal: {
                            barBorderRadius:[4, 4, 4, 4],
                            label: {
                                show: true, //开启显示
                                position: 'top', //在上方显示
                                textStyle: { //数值样式
                                    color: 'black',
                                    fontSize: 14
                                }
                            }
                        }
                    },
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        };
        var optionTotal = {
            title : {
                text: '总成绩分布',
                x:'center'
            },
            tooltip : {
                trigger: 'axis'
            },
            visualMap: {
                show:false,
                max: 600,
                min:200,
                inRange: {
                    color: ['#313695', '#4575b4', '#d15f79', '#abd9e9', '#6df8b4', '#23ff60', '#fe7979', '#fdaf68', '#51d5f4', '#6cd6d7', '#20a50d']
                }
            },
            legend: {
                data:['学科成绩']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : xData,
                    axisLabel: {
                        interval:0,
                        rotate:-40,
                        show: true,
                        textStyle: {
                            color: '#ea7a69',  //更改坐标轴文字颜色
                            fontSize : 10,      //更改坐标轴文字大小
                            width: 5
                        }
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisTick:{
                        show:true
                    },
                    // y 轴线
                    axisLine:{
                        show:true
                    },
                    // 分割线设置
                    splitLine:{
                        show:true
                    },
                    axisLabel:{
                        show:true
                    }
                }
            ],
            series : [
                {
                    name:'总成绩',
                    type:'bar',
                    data: totalNum,
                    itemStyle: {
                        normal: {
                            barBorderRadius:[4, 4, 4, 4],
                            label: {
                                show: true, //开启显示
                                position: 'top', //在上方显示
                                textStyle: { //数值样式
                                    color: 'black',
                                    fontSize: 14
                                }
                            }
                        }
                    },
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        };

        myChart.setOption(option,true);
        myChart2.setOption(optionTotal,true);
    }

    $('#yearSelect').on('change', function (e, clickedIndex, isSelected, previousValue) {
        getSourceName();
        getClassEchars();
    });

    $('#teamSelect').on('change', function (e, clickedIndex, isSelected, previousValue) {
        getSourceName();
        getClassEchars();
    });

    $('#classSelect').on('change', function (e, clickedIndex, isSelected, previousValue) {
        getSourceName();
        getClassEchars();
    });

    $('#classNameSelect').on('change', function (e, clickedIndex, isSelected, previousValue) {
        getClassEchars();
    });



</script>
</html>
