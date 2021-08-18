<%@ page contentType="text/html;charset=UTF-8"%>
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-4 col-sm-4 padding-top-10">
                2020 &copy; 软件172 ALL Rights Reserved.
            </div>
            <!-- END COPYRIGHT -->
            <!-- BEGIN PAYMENTS -->
            <div class="col-md-4 col-sm-4">
                <ul class="list-unstyled list-inline pull-right">
                    <li><img src="${pageContext.request.contextPath}/assets/corporate/img/payments/western-union.jpg" alt="We accept Western Union"
                             title="We accept Western Union"></li>
                    <li><img src="${pageContext.request.contextPath}/assets/corporate/img/payments/american-express.jpg" alt="We accept American Express"
                             title="We accept American Express"></li>
                    <li><img src="${pageContext.request.contextPath}/assets/corporate/img/payments/MasterCard.jpg" alt="We accept MasterCard"
                             title="We accept MasterCard"></li>
                    <li><img src="${pageContext.request.contextPath}/assets/corporate/img/payments/PayPal.jpg" alt="We accept PayPal"
                             title="We accept PayPal"></li>
                    <li><img src="${pageContext.request.contextPath}/assets/corporate/img/payments/visa.jpg" alt="We accept Visa" title="We accept Visa">
                    </li>
                </ul>
            </div>
            <!-- END PAYMENTS -->
            <!-- BEGIN POWERED -->
            <div class="col-md-4 col-sm-4 text-right">
                <p class="powered">软件172</p>
            </div>
            <!-- END POWERED -->
        </div>
    </div>
</div>
<!-- END FOOTER -->

<script src="${pageContext.request.contextPath}/assets/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/corporate/scripts/back-to-top.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="${pageContext.request.contextPath}/assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
<!-- pop up -->
<script src="${pageContext.request.contextPath}/assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script>
<!-- slider for products -->
<script src='${pageContext.request.contextPath}/assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script>
<!-- product zoom -->
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<!-- Quantity -->
<script src="${pageContext.request.contextPath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
<!-- for slider-range -->

<script src="${pageContext.request.contextPath}/assets/corporate/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Layout.initSliderRange();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->