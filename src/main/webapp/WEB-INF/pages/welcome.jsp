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
                <div class="col-md-12 text-center">
                    <h1 style="font-weight: bold">个人成绩概览</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
                                    <div style="height: 400px; width: 100%;" id="classEchars">

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
        getClassEchars();
    });


    function getClassEchars() {
        var myChart= echarts.init(document.getElementById("classEchars"));
        var xData=[];
        var scores=[];
        $.ajax({
            type: "GET",
            url: "v1/api/score/getAllScores",
            dataType: "json",
            async: false,
            data:{year:null,team:null},
            success: function (result) {
                var data=result.result;
                $.each(data, function(index, value) {
                    xData.push(value.scoreClassName);
                    scores.push(value.scoreNum);
                })
            }
        });

        var option = {
            tooltip : {
                trigger: 'axis'
            },
            visualMap: {
                show:false,
                max: 100,
                inRange: {
                    color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#b4ffc0', '#b4fed1', '#7ffda1', '#6ef47a', '#4fd746', '#20a50d']
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
                        rotate:-30,
                        show: true,
                        textStyle: {
                            color: '#1c79ff',  //更改坐标轴文字颜色
                            fontSize : 10      //更改坐标轴文字大小
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
                    }
                }
            ]
        };

        myChart.setOption(option,true);

    }




</script>
</html>
