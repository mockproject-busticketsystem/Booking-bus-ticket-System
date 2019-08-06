<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<title>Booking Bus</title>
<link rel="stylesheet" href="../css/css.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/poppuo-box.css" media="all">
<link rel="stylesheet" href="../css/style.css" type="text/css"
	media="all">
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
<link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">

</head>
<body>

	<div id="main">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="content">
			<div id="datve" class="clearfix" data-selected="true"
				data-label-id="0">
				<div class="inner">
					<div class="left_datve">
						<div class="title_datve">BookBus</div>
						<div class="text mota_about">
							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/11.png"
											style="cursor: default; height: 30px; width: 30px">&nbsp;&nbsp;&nbsp;1096
											Kha Vạn Cân, Phường Linh Chiểu, Quận Thủ Đức, TP. Hồ Chí Minh</span></span></span>
							</p>

							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/live-support-yahoo.png"
											style="cursor: default; height: 30px; width: 30px">&nbsp;&nbsp;&nbsp;<ins>077
												374 9328</ins></span></span></span>
							</p>

							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/images.png"
											style="cursor: default; height: 29px; width: 30px;">&nbsp;
											&nbsp;<ins>bookbus1803@gmail.com</ins></span></span></span>
							</p>

							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/w.png"
											style="cursor: default; height: 30px; width: 30px">&nbsp;&nbsp;<ins>www.bookbuscar.com.vn</ins></span></span></span>
							</p>
						</div>
						<div class="img_about">
							<img class="w100" src="../img/bookbus.jpg" alt="BookBus">
						</div>
					</div>
					<!-- Code right o day -->
					<div class="right_datve" style="margin-top: 70px">
						<div class="W3">
							<h2>Login here</h2>
							<form action="${pageContext.request.contextPath}/login"
								method="post">
								<input type="email" Name="Username" value="${user.email}"
									placeholder="EMAIL" required="" /> <input type="password"
									Name="Password" value="${user.pass}" placeholder="PASSWORD"
									required="" />
								<ul class="agileinfotickwthree">
									<!-- <ul style="display: inline-block;width: 100%;margin-bottom: 40px;text-align: left;padding-left: 10px;"> -->
									<li><input type="checkbox" name="checkRemember" checked=""
										value="Y" /> <label for="brand1">Rememberme</label> <a
										href="#">Forgot password?</a></li>
								</ul>
								<div class="aitssendbuttonw3ls">
									<input type="submit" value="LOGIN">
									<p>
										To register new account <span>→</span> <a
											class="w3_play_icon1" href="#small-dialog1"> Click Here</a>
									</p>
									<div class="clear"></div>
								</div>
							</form>
						</div>
						<!-- Bat dau regester -->

					</div>
					<!-- Ket thuc right -->
					<!-- for register popup -->
					<div id="small-dialog1" class="mfp-hide">
						<div class="contact-form1">
							<div class="contact-w3-agileits">
								<h3>Register Form</h3>
								<form action="#" method="post">
									<div class="form-sub-w3ls">
										<input placeholder="User Name" type="text" required="">
										<div class="icon-agile">
											<i class="fa fa-user" aria-hidden="true"></i>
										</div>
									</div>
									<div class="form-sub-w3ls">
										<input placeholder="Email" class="mail" type="email"
											required="">
										<div class="icon-agile">
											<i class="fa fa-envelope-o" aria-hidden="true"></i>
										</div>
									</div>
									<div class="form-sub-w3ls">
										<input placeholder="Password" type="password" required="">
										<div class="icon-agile">
											<i class="fa fa-unlock-alt" aria-hidden="true"></i>
										</div>
									</div>
									<div class="form-sub-w3ls">
										<input placeholder="Confirm Password" type="password"
											required="">
										<div class="icon-agile">
											<i class="fa fa-unlock-alt" aria-hidden="true"></i>
										</div>
									</div>
									<div class="login-check">
										<label class="checkbox"><input type="checkbox"
											name="checkbox" checked="">I Accept Terms &
											Conditions</label>
									</div>
									<div class="submit-w3l">
										<input type="submit" value="Register">
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- //for register popup -->
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>