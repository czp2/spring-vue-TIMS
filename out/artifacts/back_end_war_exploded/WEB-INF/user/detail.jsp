<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="head.jsp" %>
    <title>景点详情</title>
</head>
<body>
<%@include file="navigator.jsp" %>

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/user/index">景点展示</a></li>
            <li class="active">${view.vname}</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-5">
                <div class="sidebar-products clearfix">
                    <h2>推荐景点</h2>
                    <c:forEach items="${recommends}" var="recommend">
                        <div class="item">
                            <a href="${pageContext.request.contextPath}/user/detail/${recommend.vid}"><img
                                    src="${pageContext.request.contextPath}/img/${recommend.line}"
                                    alt="Some Shoes in Animal with Cut Out"></a>
                            <h3><a href="${pageContext.request.contextPath}/user/detail/1">${recommend.vname}</a></h3>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <div class="product-page">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="product-main-image">
                                <img src="${pageContext.request.contextPath}/img/${view.line}" alt="杭州西湖"
                                     class="img-responsive">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <h1>${view.vname}</h1>
                            <h4>${view.address}</h4>
                            <div class="description">
                                <p>${view.details}
                                </p>
                            </div>
                            <div class="review">
                                <div class="rateit" data-rateit-value="${star}" data-rateit-ispreset="true"
                                     data-rateit-readonly="true"></div>
                                <a href="#myTab"><c:if test="${comments == null}">0</c:if>${comments.size()}
                                    条点评</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                                    href="#writeView">去写点评
                            </a>
                            </div>
                        </div>

                        <div class="product-page-content">
                            <ul id="myTab" class="nav nav-tabs">
                                <li class="active"><a href="#Reviews" data-toggle="tab">点评</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade in active" id="Reviews">
                                    <!--<p>There are no reviews for this product.</p>-->
                                    <c:forEach items="${comments}" var="comment">
                                        <div class="review-item clearfix">
                                            <div class="review-item-submitted">
                                                <strong>${comment.user.uname}</strong>
                                                <em><fmt:formatDate value="${comment.createtime}" type="both"/></em>
                                                <div class="rateit" data-rateit-value="${comment.star}"
                                                     data-rateit-ispreset="true"
                                                     data-rateit-readonly="true"></div>
                                            </div>
                                            <div class="review-item-content">
                                                <p>${comment.content}</p>
                                            </div>
                                        </div>
                                    </c:forEach>


                                    <c:choose>
                                        <c:when test="${sessionScope.user!=null}">
                                            <!-- BEGIN FORM-->
                                            <form action="" class="reviews-form" role="form"
                                                  id="writeView"
                                                  method="post">
                                                <h2>创建一条点评</h2>
                                                <div class="form-group">
                                                    <label for="review">评论<span class="require">*</span></label>
                                                    <textarea class="form-control" rows="8" id="review" required
                                                              name="content"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="star">打分</label>
                                                    <input type="range" value="4" step="1" id="star" name="star">
                                                    <div class="rateit" data-rateit-backingfld="#star"
                                                         data-rateit-resetable="false" data-rateit-ispreset="true"
                                                         data-rateit-min="0" data-rateit-max="5">
                                                    </div>
                                                </div>
                                                <div class="padding-top-20">
                                                    <button type="submit" class="btn btn-primary">提交</button>
                                                </div>
                                            </form>
                                            <!-- END FORM-->
                                        </c:when>
                                        <c:otherwise>
                                            <div id="writeView"><a href="${pageContext.request.contextPath}/user/login">请先登录，再进行点评！
                                            </a></div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>

<%@include file="footer.jsp" %>
<script>
    $("#star").change(function () {
        console.log($(this).val())
    });
</script>
</body>
</html>
