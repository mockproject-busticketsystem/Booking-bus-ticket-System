<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/favicon.ico">

<title>Booking Bus</title>

<!-- <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
 -->
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/asset_info/img/apple-icon.png" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/asset_info/img/favicon.png" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/asset_info/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/asset_info/css/material-bootstrap-wizard.css"
	rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${pageContext.request.contextPath}/asset_info/css/demo.css"
	rel="stylesheet" />

<style type="text/css">
#follow_us{
	margin-bottom: 50px;
}
#footer_2{
	height: 380px;
	
	margin-top: -49.9px;
}
</style>
</head>
<script>
$(document).ready(function () {
	var success = '${success}';
	if(success == "true")
	{
		alert("Cap Nhap Thanh Cong!! :)");
	}
else if(success == "false")
	{
		alert("Opps...Cap Nhap Khong Thanh Cong!! "+"${err}" );
	}
});

</script>

<body>
	<div id="main" >
		<jsp:include page="header2.jsp"></jsp:include>
		<div id="content">
			<div class="row_tt" style="height: 600px;margin-bottom:50px;background-image: url('${pageContext.request.contextPath}/img/bg_info.jpg'); 
  background-size: contain;">
				<div class="col-sm-8 col-sm-offset-2">
					<!--      Wizard container        -->
					<div class="wizard-container">
						<div class="card wizard-card" data-color="green"
							id="wizardProfile">
							<!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
							<div class="wizard-header">
								<h3 class="wizard-title">Thông Tin Cá Nhân Khách Hàng</h3>
							</div>
							<div class="wizard-navigation">
								<ul>
									<li><a href="#about" data-toggle="tab">Thông Tin</a></li>
									<li><a href="#account" data-toggle="tab">Chỉnh Sửa
											Thông Tin</a></li>
									<li><a href="#address" data-toggle="tab">Thay Đổi Mật
											Khẩu</a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane" id="about">
									<div class="row">
										<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="material-icons">record_voice_over</i>
												</span>
												<div class="form-group label-floating">
													<label class="control-label">CMND</label> <input
														name="CMND" type="text" class="form-control"
														value="${khachHang.cMND}" readonly>
												</div>
											</div>
										</div>
										<!--Email -->
										<div class="col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="material-icons">email</i>
											</span>
											<div class="form-group label-floating">
												<label class="control-label">Email</label> <input
													name="Email" type="text" class="form-control"
													value="${khachHang.email}" readonly>
											</div>
										</div>
										</div>
										<!--ho Ten-->
										<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="material-icons">face</i>
												</span>
												<div class="form-group label-floating">
													<label class="control-label">Họ Tên</label> <input
														name="Hoten" type="text" class="form-control"
														value="${khachHang.hoTen}" readonly>
												</div>
											</div>
										</div>
										<!--Phone-->
										<div class="col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="material-icons">phone</i>
											</span>
											<div class="form-group label-floating">
												<label class="control-label">SĐT</label> <input name="SDT"
													type="text" class="form-control" value="${khachHang.sDT}"
													readonly>
											</div>
										</div>
										</div>
									</div>
								</div>
								<!--Buoc Chinh sua Thông Tin-->

								<div class="tab-pane" id="account">
									<form action="${pageContext.request.contextPath}/ChangeInfoCustom" method="Post">
										<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="material-icons">record_voice_over</i>
												</span>
												<div class="form-group label-floating">
													<label class="control-label">CMND</label> <input
														name="CMND" type="text" class="form-control"
														value="${khachHang.cMND}" readonly>
												</div>
											</div>
										</div>
										<!--Email -->
										<div class="col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="material-icons">email</i>
											</span>
											<div class="form-group label-floating">
												<label class="control-label">Email</label> <input
													name="Email" type="text" class="form-control"
													value="${khachHang.email}" readonly>
											</div>
										</div>
										</div>
										<!--Ho Ten-->
										<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="material-icons">face</i>
												</span>
												<div class="form-group label-floating">
													<label class="control-label">Họ Tên</label> <input
														name="hoTen" type="text" class="form-control"
														value="${khachHang.hoTen}">
												</div>
											</div>
										</div>
										<!-- Phone -->
										<div class="col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="material-icons">phone</i>
											</span>
											<div class="form-group label-floating">
												<label class="control-label">SĐT</label> <input name="SDT"
													type="text" class="form-control" value="${khachHang.sDT}">
											</div>
										</div>
										</div>
										<div class="pull-right">
											<input type='submit'
												class='btn btn-next btn-fill btn-success btn-wd'
												name='submit' value='Submit' />
										</div>
									</form>
								</div>

								<!--Cap Nhap Mat Khau-->
								<div class="tab-pane" id="address">
									<form action="${pageContext.request.contextPath}/ThayDoiMatKhau" method="Post">
										<div class="row">
											<div class="col-sm-7 col-sm-offset-1">
												<div class="form-group label-floating">
													<label class="control-label">Mật Khẩu Hiện Tại</label> <input
														type="password" id="curPass" name="curPass"
														class="form-control">
												</div>
											</div>
											<div class="col-sm-7 col-sm-offset-1">
												<div class="form-group label-floating">
													<label class="control-label">Mật Khẩu Mới</label> <input
														type="password" id="newPass" name="newPass"
														class="form-control">
												</div>
											</div>
											<div class="col-sm-7 col-sm-offset-1">
												<div class="form-group label-floating">
													<label class="control-label">Nhập Lại Mật Khẩu Mới</label>
													<input type="password" id="confirm_pass"
														name="confirm_pass" class="form-control">
												</div>

											</div>

										</div>
										<div class="wizard-footer">
											<div class="pull-right">
												<input type='submit'
													class='btn btn-finish btn-fill btn-success btn-wd'
													name='finish' value='Submit' onclick="validatePassword();" />
											</div>
											<div class="clearfix"></div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- Ket form 
				</form> -->
					</div>
				</div>
				<!-- wizard container -->

			</div>
			<!-- end row -->
				<footer id="footer_2" style="background: #28292E;">
	<div class="row">
     
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 footer_col">
						<div id="img">
							<img src="${pageContext.request.contextPath}/img/logo_bus.png">
						</div>
						</div>
      				<div class="col" style="margin-right: 40px;max-width: 170px;">
						<h3 class="footer_title">ABOUT</h3>
						<ul class="footer_linklists">
							<li><a href="#" title="Về Chúng Tôi">Về Chúng Tôi</a></li>
							<li><a href="#">Các chuyến xe</a></li>
							<li><a href="#blog" tile="Blog">Blog</a></li>
							<li><a href="#" title="Cửa Hàng">Cửa Hàng</a></li>
						</ul>
					</div>
      <div class="col"><div class="hotline_footer">
							<h3 class="footer_title">Always-on Support</h3>
							<p>Support 02871 087 088 (07:00-21:00)</p>
						</div>
						<div class="address_footer">
							<h3 class="footer_title">Address</h3>
							<p>1096 Kha Van Can, Linh Chieu, Quan Thu Duc Ho Chi Minh, Vietnam</p>
							<p>077 374 9328</p>
							<p>bookbus1803@gmail.com</p>
						</div></div>
						
      <div class="col" style="margin-right: 40px;max-width: 500px;">
      	<ul class="fl social" style="list-style-type: none;" id = "follow_us">
						<li><strong>Follow us</strong></li>
						<li><a href="https://in.linkedin.com/company/book-bus-asia"
							class="fa fa-linkedin-square" title="linkdin" target="_blank"
							style="font-size: 24px; color: white;"></a> <a
							href="https://www.facebook.com/www.bookbus.asia/"
							class="fa fa-facebook-square" target="_blank"
							style="font-size: 24px; color: white;"></a><a
							href="https://twitter.com/bookbusasia" class="fa fa-twitter"
							target="_blank" style="font-size: 24px; color: white;"></a>
							<a href="https://plus.google.com/u/0/106337264178239365499/posts"
							class="fa fa-google-plus-square" target="_blank"
							style="font-size: 24px; color: white;"></a> <a
							href="https://in.pinterest.com/asiabookbus/"
							class=" fa fa-pinterest-square" target="_blank"
							style="font-size: 24px; color: white;"></a><a
							href="https://www.instagram.com/bookbusasia/"
							class="fa fa-instagram" target="_blank"
							style="font-size: 24px; color: white;"></a></li>
						<li class="partners"><strong>Our Payments Partner</strong> <figure>
							<br><img src="https://bookbus.asia:443/img/cc-avenue.png"
								alt="cc-avenue"> </figure>
								<br>
							 <i
								class="fa fa-cc-discover"
								style="font-size: 24px; color: #FFA500;"></i> <i
								class=" fa fa-cc-paypal"
								style="font-size: 24px; color: #7CFC00;"></i> <i
								class="fa fa-cc-visa" style="font-size: 24px; color: #1E90FF;"></i>
								<i class="fa fa-cc-jcb" style="font-size: 24px; color: #32CD32;"></i>
								<i class="fa fa-cc-mastercard"
								style="font-size: 24px; color: #BA55D3;"></i>
					</li>
					</ul></div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div
							class="copyright_footer display_flex justify-content-spbetween">
							<div class="copyright_text copyright_col">Copyright © 2019
								BookBus. All rights reserved.</div>
							<div class="copyright_menu copyright_col">
								<ul>
									<li><a href="https://order.thecoffeehouse.com/policy">Privacy
											Policy</a></li>
									<li><a href="https://order.thecoffeehouse.com/term">Terms
											of Use</a></li>
								</ul>
							</div>
						</div>
					</div>
   				 </div>
			</footer>
		</div>
			
	</div>

</body>
<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath}/asset_info/js/jquery-2.2.4.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/asset_info/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/asset_info/js/jquery.bootstrap.js"
	type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script
	src="${pageContext.request.contextPath}/asset_info/js/material-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script
	src="${pageContext.request.contextPath}/asset_info/js/jquery.validate.min.js"></script>
<script type="text/javascript">
function validatePassword(){
	var password = document.getElementById("newPass").value
	  , confirm_password = document.getElementById("confirm_pass").value;
	  if(password != confirm_password) {
	    alert("Passwords Don't Match");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}
	/* password.onchange = validatePassword; */
	confirm_password.onkeyup = validatePassword;
	var success ='${success}';
	function showAlert()
	{
		if(success!="")
		{
		if(success=="true")
			{
			alert("Cập Nhập Thành Công :) :)");
			}
		else
		{
			var err = '${err}';
			alert("Cập Nhập Không Thành Công!!!"+err);
			
		}
		}
		
	}
	</script>
</html>
