<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="head.jsp" %>
    <title>个人中心</title>
</head>
<body>
<%@include file="navigator.jsp" %>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/user/index">主页</a></li>
            <li class="active">个人中心</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-6 col-sm-7">
                <h1>个人信息管理</h1>
                <div class="content-page">
                    <h3>基本信息</h3>
                    <form role="form" method="post" action="${pageContext.request.contextPath}/user/doUpdate"  onsubmit="return check(this)" id="mine-information">
                        <div class="form-group">
                            <label for="email-login">姓名</label>
                            <input type="text" class="form-control group-basic" disabled="disabled" name="uname"
                                   value="${sessionScope.user.uname}">
                        </div>
                        <div class="form-group">
                            <label for="email-login">邮箱</label>
                            <input type="text" id="email-login" class="form-control group-basic" disabled="disabled"
                                   value="${sessionScope.user.email}" name="email">
                        </div>
                        <div class="padding-top-20">
                            <button class="btn btn-default update" type="button">编辑</button>
                            <button class="btn btn-primary" type="submit">确定</button>
                        </div>
                    </form>
                    <hr>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>
<%@include file="footer.jsp" %>
<script>
    var editing = null;
    $("#mine-information button.update").click(function () {
        if (editing != null) {
            $("#mine-information .group-basic").each(function () {
                $(this).val($(this).data("original"));
                $(this).attr("disabled", "disabled");
            });
            $(this).text("编辑");
            editing = null;
        } else {
            editing = true;
            $("#mine-information .group-basic").each(function () {
                $(this).removeAttr("disabled");
                $(this).data("original", $(this).val());
            });
            $(this).text("取消");
        }
    });

    function check(form) {
        var flag = (editing != null);
        if(!flag){
            alert("当前不在编辑状态")
        }
        return flag;
    }
</script>
</body>
</html>
