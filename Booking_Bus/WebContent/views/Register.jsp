<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<title>Booking Bus</title>

<link rel="stylesheet" href="../css/css.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/poppuo-box.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="icon" type="image/png" href="../pictures/baner-bus.png" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>

	<div id="main">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="content">
			<div id="datve" class="clearfix" data-selected="true"
				data-label-id="0">
				<div class="inner" style="margin-left: 370px">
						<!-- for register popup -->
						<div id="small-dialog1" class="mfp-hide">
							<div class="contact-form1">
								<div class="contact-w3-agileits">
									<form action="#" method="post">
										<!-- Ho ten -->
										<div class="form-sub-w3ls">
											<input placeholder="Họ Tên" type="text" required="">
											<div class="icon-agile">
												<i class="fa fa-user" aria-hidden="true"></i>
											</div>
										<!-- CMND -->
											<input placeholder="CMND" type="text" required="">
											<div class="icon-agile">
												<i class="fa fa-envelope-o" aria-hidden="true"></i>
											</div>
										<!-- SDT -->
											<input placeholder="SDT" type="email" required="">
											<div class="icon-agile">
												<i class="fa fa-envelope-o" aria-hidden="true"></i>
											</div>
										<!-- Email -->
											<input placeholder="Email" class="mail" type="email"
												required="">
											<div class="icon-agile">
												<i class="fa fa-envelope-o" aria-hidden="true"></i>
											</div>
										<!-- Pass -->
											<input placeholder="Password" type="password" required="">
											<div class="icon-agile">
												<i class="fa fa-unlock-alt" aria-hidden="true"></i>
											</div>
										<!-- Confirm Pass -->
											<input placeholder="Confirm Password" type="password"
												required="">
											<div class="icon-agile">
												<i class="fa fa-unlock-alt" aria-hidden="true"></i>
											</div>
										</div>
										<div class="submit-w3l">
											<input type="submit" value="Register">
										</div>
									</form>
								</div>
							</div>
						<!-- //for register popup -->
						<!-- Ket thuc right -->
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>

		<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

		<!-- pop-up-box-js-file -->
		<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
		<!--//pop-up-box-js-file -->
		<script>
			$(document).ready(
					function() {
						$('.w3_play_icon,.w3_play_icon1,.w3_play_icon2')
								.magnificPopup({
									type : 'inline',
									fixedContentPos : false,
									fixedBgPos : true,
									overflowY : 'auto',
									closeBtnInside : true,
									preloader : false,
									midClick : true,
									removalDelay : 300,
									mainClass : 'my-mfp-zoom-in'
								});

					});
		</script>
</body>
</html>