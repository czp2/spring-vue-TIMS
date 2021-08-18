<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="head.jsp" %>
    <title>景点展示</title>
</head>
<body>
<%@include file="navigator.jsp" %>
<c:forEach items="views">

</c:forEach>
<div class="title-wrapper">
    <div class="container">
        <div class="container-inner">
            <h1><span>旅游</span> 热门景点</h1>
            <em>国内旅游、国外旅游、自助旅游、自驾旅游、油轮签证、主题旅游等各种最新热门旅游推荐</em>
        </div>
    </div>
</div>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li class="active">景点展示</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <!-- BEGIN PRODUCT LIST -->
                <div class="row product-list">
                    <!-- PRODUCT ITEM START -->
                    <c:forEach items="${views}" var="view" begin="0" end="2">
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/img/${view.line}"
                                     class="img-responsive"
                                     alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/img/${view.line}"
                                       class="btn btn-default fancybox-button">放大</a>
                                    <a href="${pageContext.request.contextPath}/user/detail/${view.vid}"
                                       class="btn btn-default">查看详情</a>
                                </div>
                            </div>
                            <h3><a href="${pageContext.request.contextPath}/user/detail/${view.vid}">${view.vname}</a>
                            </h3>
                        </div>
                    </div>
                    </c:forEach>
                            <!-- PRODUCT ITEM END -->
                </div>
                <div class="row product-list">
                    <!-- PRODUCT ITEM START -->
                    <c:forEach items="${views}" var="view" begin="3" end="5">
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/img/${view.line}"
                                         class="img-responsive"
                                         alt="Berry Lace Dress">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/img/${view.line}"
                                           class="btn btn-default fancybox-button">放大</a>
                                        <a href="${pageContext.request.contextPath}/user/detail/${view.vid}"
                                           class="btn btn-default">查看详情</a>
                                    </div>
                                </div>
                                <h3><a href="${pageContext.request.contextPath}/user/detail/${view.vid}">${view.vname}</a>
                                </h3>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- PRODUCT ITEM END -->
                </div>
                <!-- END PRODUCT LIST -->
                <!-- BEGIN PAGINATOR -->

                <div class="row">
                    <div class="col-md-4 col-sm-4 items-info">Items ${pageable.fromIndex} to ${pageable.toIndex} of
                        ${pageable.total}
                        total
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <ul class="pagination pull-right">
                            <li><a href="${pageContext.request.contextPath}/user/index?page=${pid-1}">&laquo;</a></li>
                            <c:forEach begin="1" end="${pageable.pages}" varStatus="status">
                                <c:choose>
                                    <c:when test="${status.count == pid}">
                                        <li><span>${status.count}</span></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/user/index?page=${status.count}">${status.count}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/user/index?page=${pid+1}">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
                <!-- END PAGINATOR -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>
<%@include file="footer.jsp" %>
<script>
    $("#showView").addClass("active");
</script>
</body>
</html>
