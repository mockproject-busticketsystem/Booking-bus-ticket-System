<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_login.css">
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


#menu img {
	float: left;
	margin-top: 15px;
	height: 50px;
	width: 200px;
}

.modal-confirm {		
		color: #636363;
		width: 800px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative;
	}
	.modal-confirm h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-confirm .form-control, .modal-confirm .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-confirm .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-confirm .modal-footer {
		border: none;
		text-align: center;
		border-radius: 5px;
		font-size: 13px;
	}	
	.modal-confirm .icon-box {
		color: #fff;		
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -70px;
		width: 90px;
		height: 90px;
		border-radius: 50%;
		z-index: 9;
		background: #DBEDFF;
		padding: 15px;
		text-align: center;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-confirm .icon-box i {
		font-size: 58px;
		position: relative;
		top: 3px;
	}
	.modal-confirm.modal-dialog {
		margin-top: 80px;
	}
    .modal-confirm .btn {
        color: black;
        border-radius: 4px;
		background: #DBEDFF;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
    }
	.modal-confirm .btn:hover, .modal-confirm .btn:focus {
		background: #24292E;
		outline: none;
		 color: white;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>

<div id="menu">
 <a href="${pageContext.request.contextPath}/views/index.jsp">
	<img src="${pageContext.request.contextPath}/img/logo_bus.png">
	</a>
	<ul>
		<li class="right"><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
		<li class="right"><a data-toggle="modal" href="#myModal">Đăng ký</a></li>
		<li class="right" ><a href="#myModal2" data-toggle="modal">Liên hệ</a></li>
		<li class="right"><a href="${pageContext.request.contextPath}/views/gioithieu.jsp">Giới thiệu</a></li>
		<li class="right"><a href="${pageContext.request.contextPath}/views/index.jsp">Trang chủ</a></li>

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
								pattern="[0-9]*.{9,11}" required>
							<!-- SDT -->
							<input placeholder="SDT" type="text" name="SDT" pattern="[0-9]*.{10,11}"
								required>
							<!-- Email -->
							<input placeholder="Email" class="mail" type="email" name="Email"
								required>
							<!-- Pass -->
							<input placeholder="Password" type="password" name="Pass" pattern=".{4,}"
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

<!-- Modal HTML -->
<div id="myModal2" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons"><img src = '${pageContext.request.contextPath}/img/baner-bus.png'/>
				</i>
				</div>				
				<h4 class="modal-title">Chi Tiết Liên Hệ</h4>	
			</div>
			<div class="modal-body">
				 <div class="row">
      <div class="col-sm-6">	<p>
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
							
							</div>
      <div class="col-sm-6"><p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/images.png"
											style="cursor: default; height: 29px; width: 30px;">&nbsp;
											&nbsp;<a href="mailto:bookbus1803@gmail.com"><ins>bookbus1803@gmail.com</ins></a>
											</span></span></span>
							</p>

							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/w.png"
											style="cursor: default; height: 30px; width: 30px">&nbsp;&nbsp;
											<a href=""><ins>www.bookbuscar.com.vn</ins></a></span></span></span>
							</p></div>
    </div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-success btn-block" data-dismiss="modal">OK</button>
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
