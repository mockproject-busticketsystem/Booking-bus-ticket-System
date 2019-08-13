<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/css.css">
<link rel="stylesheet" href="../css/style_login.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
@charset "ISO-8859-1";

#menu {
	height: 70px;
	line-height: 40px;
	padding-left: 10px;
	padding-right: 10px;
	background-color: #28292E;
	/*margin-bottom:5px;*/
	clear: both;
	/*position: fixed;*/
	top: 0;
	width: 100%;
	/*  display: block;*/
	transition: top 0.3s;
}

#menu li.right {
	display: inline-block;
	float: right;
	width: 170px;
	height: 40px;
	line-height: 40px;
	margin-left: 20px;
	font-family: Britannic Bold;
	font-weight: bold;
	font-size: 18px;
	/*background-color: blue;  */
	text-align: center;
	margin-top: 15px;
}

#menu li a {
	color: white;
	text-decoration: none;
}

#menu a:hover {
	color: yellow;
	background-color: blue;
	font-size: 25px;
}

#menu img {
	float: left;
	margin-top: 15px;
	height: 50px;
	width: 200px;
}
</style>
<div id="menu">
	<img src="../img/logo_bus.png">
	<ul>
		<li class="right"><a href="loginView.jsp">Đăng nhập</a></li>
		<li class="right"><a data-toggle="modal" href="#myModal">Đăng
				ký</a></li>
		<li class="right"><a href="">Liên hệ</a></li>
		<li class="right"><a href="">Giới thiệu</a></li>
		<li class="right"><a href="">Trang chủ</a></li>

		<!--  <li class="right"><a href="">   <img src="img/facebook_icon.png">  </a></li>
                            <li class="right"><a href=""><img src="img/zalo_icon.png"> </a></li> -->
	</ul>
</div>
<!-- modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="contact-form1">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2>Đăng Ký</h2>
				<div class="contact-w3-agileits">
					<form action="${pageContext.request.contextPath}/register-customer"
						method="post" onsubmit="showAlter();">
						<!-- Ho ten -->
						<div class="form-sub-w3ls">
							<input placeholder="Họ Tên" type="text" name="Ten" required>
							<!-- CMND -->
							<input placeholder="CMND" name="CMND" type="text"
								pattern="[0-9]*" required>
							<!-- SDT -->
							<input placeholder="SDT" type="text" name="SDT" pattern="[0-9]*"
								required>
							<!-- Email -->
							<input placeholder="Email" class="mail" type="email" name="Email"
								required>
							<!-- Pass -->
							<input placeholder="Password" type="password" name="Pass"
								id="Pass" required>
							<!-- Confirm Pass -->
							<input placeholder="Confirm Password" type="password"
								name="ConfirmPass" id="ConfirmPass" required>
						</div>
						<div class="submit-w3l">
							<input type="submit" value="Register" />
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
</div>
<script type="text/javascript">
	var password = document.getElementById("Pass")
	  , confirm_password = document.getElementById("ConfirmPass");

	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("Passwords Don't Match");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
	</script>
