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
    <title>成绩录入</title>


    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../../static/bootstrap/css/bootstrap.css">
    <!-- fileinput core CSS -->
    <link rel="stylesheet" href="../../static/bootstrap-file-input/css/fileinput.css">
    <link rel="stylesheet" href="../../css/font-awesome.css">
    <link rel="stylesheet" href="../../static/sweetAlert/sweetalert2.css">
    <!-- Custom styles for this template -->
    <link href="../../css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="container-fluid">
            <div class="row">
                <label class="control-label btn-lg">成绩上传</label>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-info">
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
                <div class="col-md-12 col-xs-12 col-lg-12 col-sm-12">
                    <input type="file" name="excelFile" id="excelFile" multiple class="file-loading"/>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script src="../../js/jquery-3.2.1.js"></script>
<!-- fileinput core js -->
<script src="../../static/bootstrap-file-input/js/fileinput.js"></script>
<script src="../../static/bootstrap-file-input/js/locales/zh.js"></script>
<script src="../../static/sweetAlert/sweetalert2.all.min.js"></script>
<!-- Bootstrap core js -->
<script src="../../static/bootstrap/js/bootstrap.js"></script>


<script>
    $(function () {
       FileInput();//0.初始化fileinput
       setSelectYearAndTeam();
    });

    //初始化fileinput
   function FileInput() {
            //初始化上传控件的样式
       $("#excelFile").fileinput({
           language: 'zh', //设置语言
           uploadUrl: "/v1/api/excel/excelImport", //上传的地址
           allowedFileExtensions: ['xlsx', 'xls'],//接收的文件后缀
           //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
           uploadAsync: true, //默认异步上传
           showUpload: true, //是否显示上传按钮
           showRemove: true, //显示移除按钮
           showPreview: true, //是否显示预览
           showCaption: true,//是否显示标题
           browseClass: "btn btn-primary", //按钮样式
           dropZoneEnabled: false,//是否显示拖拽区域
           //maxFileSize:0,//单位为kb，如果为0表示不限制文件大小
           minFileCount: 1,
           maxFileCount: 1, //表示允许同时上传的最大文件个数
           enctype: 'multipart/form-data',
           validateInitialCount: true,
           previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
           msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
           uploadExtraData:function(){//向后台传递参数
               var data={
                   year:$("#yearSelect option:selected").val(),
                   team:$("#teamSelect option:selected").val()
               };
               return data;
           }
       }).on("fileuploaded", function (event, data, previewId, index) {
           if (data.response.resultCode == 20000) {
               swal(
                   '成功！',
                   data.response.resultMsg,
                   'success'
               )
           } else {
               swal("操作失败", data.response.resultMsg, "error");
           }
       });
   }
   
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

   }


</script>
</html>
