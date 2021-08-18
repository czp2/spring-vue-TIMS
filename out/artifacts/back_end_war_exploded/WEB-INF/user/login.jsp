<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="head.jsp" %>
    <title>登录</title>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<%@include file="navigator.jsp" %>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/user/index">主页</a></li>
            <li class="active">登录</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <!-- BEGIN CHECKOUT PAGE -->
                <div class="panel-group checkout-page accordion scrollable" id="checkout-page">
                    <!-- BEGIN CHECKOUT -->
                    <div id="checkout" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#checkout-content"
                                   class="accordion-toggle">
                                    拥有账户：快速登录
                                </a>
                            </h2>
                        </div>
                        <div id="checkout-content" class="panel-collapse collapse <c:if test="${login}">in</c:if>">
                            <div class="panel-body row">
                                <div class="col-md-6 col-sm-6">
                                    <h3>新游客</h3>
                                    <p>创建一个账户，开始留下你的足迹吧！</p>
                                    <button class="btn btn-primary" type="submit" data-toggle="collapse"
                                            data-parent="#checkout-page" data-target="#payment-address-content">去注册
                                    </button>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <h3>老游客</h3>
                                    <p>我是一名老游客！</p>
                                    <form role="form" action="${pageContext.request.contextPath}/user/doLogin"
                                          method="post">
                                        <div class="form-group">
                                            <label for="email-login">邮箱</label>
                                            <input type="text" id="email-login" class="form-control" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="password-login">密码</label>
                                            <input type="password" id="password-login" class="form-control"
                                                   name="upwd">
                                        </div>
                                        <div class="error">
                                            <p>${login_message}</p>
                                        </div>
                                        <div class="padding-top-20">
                                            <button class="btn btn-primary" type="submit">登录</button>
                                        </div>
                                        <hr>
                                        <div class="login-socio">
                                            <p class="text-muted">或者用以下登录:</p>
                                            <ul class="social-icons">
                                                <li><a href="javascript:;" data-original-title="facebook"
                                                       class="facebook" title="facebook"></a></li>
                                                <li><a href="javascript:;" data-original-title="Twitter" class="twitter"
                                                       title="Twitter"></a></li>
                                                <li><a href="javascript:;" data-original-title="Google Plus"
                                                       class="googleplus" title="Google Plus"></a></li>
                                                <li><a href="javascript:;" data-original-title="Linkedin"
                                                       class="linkedin" title="LinkedIn"></a></li>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END CHECKOUT -->

                    <!-- BEGIN PAYMENT ADDRESS -->
                    <div id="payment-address" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#payment-address-content"
                                   class="accordion-toggle">
                                    还未拥有账户：快速注册
                                </a>
                            </h2>
                        </div>
                        <div id="payment-address-content" class="panel-collapse collapse <c:if test="${!login}">in
</c:if>">
                            <div class="panel-body row">
                                <form action="${pageContext.request.contextPath}/user/doRegister" method="post">
                                    <div class="error">
                                        <p>${register_message}</p>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <h3>你的个人信息</h3>
                                        <div class="form-group">
                                            <label for="lastname">姓名 <span class="require">*</span></label>
                                            <input type="text" id="lastname" required class="form-control" name="uname">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">E-Mail <span class="require">*</span></label>
                                            <input type="text" id="email" required class="form-control" name="email">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <h3>你的账户密码</h3>
                                        <div class="form-group">
                                            <label for="password">密码 <span class="require">*</span></label>
                                            <input type="password" id="password" required class="form-control"
                                                   name="upwd">
                                        </div>
                                        <div class="form-group">
                                            <label for="password-confirm">确认密码 <span
                                                    class="require">*</span></label>
                                            <input type="text" id="password-confirm" required class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <button class="btn btn-primary  pull-right" type="submit">注册</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- END PAYMENT ADDRESS -->
                    </div>
                    <!-- END CHECKOUT PAGE -->
                </div>
                <!-- END CONTENT -->
            </div>
            <!-- END SIDEBAR & CONTENT -->
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
