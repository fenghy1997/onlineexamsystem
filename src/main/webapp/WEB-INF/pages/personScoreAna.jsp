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
    <title>个人成绩报告</title>
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
        for (var i = 5; i >0 ; i--) {
            year.push(fullYear-(i));
        }
        for (var i = 0; i <3 ; i++) {
            year.push(fullYear+i);
        }


        for (var i = 1; i < year.length; i++) {
            $("#yearSelect").append('<option value="' +year[i]+ '">' +year[i] + '</option>');
        }


    }

    function getClassEchars() {
        var myChart= echarts.init(document.getElementById("classEchars"));
        var myChart2= echarts.init(document.getElementById("classEchars2"));
        var myChart3= echarts.init(document.getElementById("classEchars3"));
        var myChart4= echarts.init(document.getElementById("classEchars4"));
        var year=$("#yearSelect option:selected").val();
        var team=$("#teamSelect option:selected").val();
        var xData=[];
        var scores=[];
        var scoreAvgCredit=[];
        var peiScore=[];
        var totalNum='';
        $.ajax({
            type: "GET",
            url: "v1/api/score/getAllScores",
            dataType: "json",
            async: false,
            data:{year:year,team:team},
            success: function (result) {
                var data=result.result;
                $.each(data, function(index, value) {
                    xData.push(value.scoreClassName);
                    scores.push(value.scoreNum);
                    scoreAvgCredit.push(value.scoreAvgCredit);
                    totalNum=value.scoreTotalNum;
                    var obj={};
                    obj.value=value.scoreNum;
                    obj.name=value.scoreClassName;
                    peiScore.push(obj);
                })
            }
        });

        var option = {
            title : {
                text: '各科成绩',
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
                        rotate:-20
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
                    }
                }
            ]
        };
        var optionpie = {
            title : {
                text: '各科成绩占比',
                subtext: '单位（%）',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            color:['#fe7979', '#fdaf68', '#51d5f4', '#6cd6d7', '#20a50d','#abd9e9', '#6df8b4', '#23ff60'],
            legend: {
                orient : 'vertical',
                x : 'left',
                data: xData
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'left',
                                max: 1548
                            }
                        }
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [
                {
                    name:'访问来源',
                    type:'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data: peiScore
                }
            ]
        };
        var baroption = {
            title : {
                text: '各科学分',
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
                        rotate:-20
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
                    name:'学分',
                    type:'bar',
                    data: scoreAvgCredit,
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
                    }
                }
            ]
        };
        var optiontotalpie = {
            title : {
                text: '总成绩',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
             color:['#fe7979', '#fdaf68', '#51d5f4', '#6cd6d7', '#20a50d','#abd9e9', '#6df8b4', '#23ff60'],
            // legend: {
            //     orient : 'vertical',
            //     x : 'left',
            //     data:
            // },

            calculable : true,
            series : [
                {
                    name:'访问来源',
                    type:'pie',
                    radius : '55%',
                    hoverAnimation:false,
                    silent:true,
                    center: ['50%', '60%'],
                    label: {
                        normal: {
                            show: true,
                            position: 'center',
                            formatter:function (argument) {
                                var html;
                                html='总成绩\r\n\r\n'+totalNum+'分';
                                return html;
                            },
                            textStyle:{
                                fontSize: 23,
                                color:'#040e0e',
                                fontWeight:20
                            }
                        }
                    },
                    data: [{value:100,name:'总成绩'}],
                    itemStyle: {
                        emphasis: {
//                                 shadowBlur: 10,
                            // shadowOffsetX: 100,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };


        myChart.setOption(option,true);
        myChart2.setOption(optionpie,true);
        myChart3.setOption(baroption,true);
        myChart4.setOption(optiontotalpie,true);
    }

    $('#yearSelect').on('change', function (e, clickedIndex, isSelected, previousValue) {
        getClassEchars();
    });
    $('#teamSelect').on('change', function (e, clickedIndex, isSelected, previousValue) {
        getClassEchars();
    });




</script>
</html>
