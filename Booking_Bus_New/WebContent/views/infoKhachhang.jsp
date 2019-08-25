<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Profile</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/material-dashboard.css?v=2.1.0"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/css.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/css_info.css"
	rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(document).ready(function () {
	var updated = '${updated}';
	if(updated == "true")
	{
		alert("Cap Nhap Thanh Cong!! :)");
	}
else if(updated == "false")
	{
		alert("Opps...Cap Nhap Khong Thanh Cong!! " );
	}
});

</script>
</head>
<body class="dark-edition" style="background: #DDDDDD;">
	<!-- content Nhân_Viên -->
	<c:if test = "${empty cus.cMND}">
	<form action="${pageContext.request.contextPath}/InsertKhachHang"
		method="post">
		<div id="content">

			<div class="container-fluid">
				<div class="row">

					<div class="col-md-8">
	
						<div class="card">
							<div class="card-header card-header-primary">
								<h4 class="card-title">Profile ${cus.email}</h4>
								<p class="card-category">Complete your profile</p>
							</div>
							<div class="card-body">


								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating">CMND</label> <input
												type="text"  class="form-control"
												 style=" background: #202940;" name = "CMND">
										</div> 
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="bmd-label-floating">Email</label> <input
												type="text" class="form-control" value = "${email}"
												style="text-align: center; background: #202940;" name = "email">
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating">Số điện thoại</label> <input
												type="text" value="${cus.sDT}" class="form-control"
												name="SDT" pattern="[0-9]*.{10,11}" required>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating">Họ và tên </label> <input
												type="text" value="${cus.hoTen}" class="form-control"
												name="HoTen" required>
										</div>
									</div>
								</div>
								<div class="row"></div>
								<!-- 	<button type="submit" class="btn btn-primary pull-right">Update
											Profile</button> -->
								<div class="clearfix"></div>


							</div>

						</div>

					</div>
					<div class="col-md-4">
						<div class="card card-profile">
							<div class="card-avatar">
								<a href="#pablo"> <c:if
										test="${cus.email == 'hang@gmail.com'}">
										<img class="img"
											src="${pageContext.request.contextPath}/img/dung.jpg" />
									</c:if> <c:if test="${cus.email == 'trinhnguyen@email.com'}">
										<img class="img"
											src="${pageContext.request.contextPath}/img/hau.jpg" />
									</c:if>
								</a>
							</div>
							<div class="card-body">
								<h4 class="card-title">${cus.hoTen}</h4>
						
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		<!-- content Nhân_Viên-->

		<button type="submit"
			onclick="return confirm('Are you sure you want to Update Information Customer?')">Update</button>
	</form>
	</c:if>
	
	
	<c:if test = "${not empty cus.cMND}">
	<form action="${pageContext.request.contextPath}/info_UpdateKhachhang"
		method="post">
		<div id="content">

			<div class="container-fluid">
				<div class="row">

					<div class="col-md-8">
	
						<div class="card">
							<div class="card-header card-header-primary">
								<h4 class="card-title">Profile ${cus.email}</h4>
								<p class="card-category">Complete your profile</p>
							</div>
							<div class="card-body">


								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating">CMND</label> 
											<input
												type="text" class="form-control" disabled value = "${cus.cMND}"
												 style=" background: #202940; color: red;"> 
												 <input type="hidden" value="${cus.cMND}" name = "CMND">
										</div> 
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="bmd-label-floating">Email</label> <input
												type="text" class="form-control" disabled value = "${cus.email}"
												style="text-align: center; background: #202940;color: red;" >
												<input type="hidden" value = "${cus.email}" name = "email">
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating">Số điện thoại</label> <input
												type="text" class="form-control" value = "${cus.sDT}"
												name="SDT" pattern="[0-9]*.{10,11}" required >
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating">Họ và tên </label> <input
												type="text" class="form-control"  value = "${cus.hoTen}"
												name="HoTen" required>
										</div>
									</div>
								</div>
								<div class="row"></div>
								<!-- 	<button type="submit" class="btn btn-primary pull-right">Update
											Profile</button> -->
								<div class="clearfix"></div>


							</div>

						</div>

					</div>
					<div class="col-md-4">
						<div class="card card-profile">
							<div class="card-avatar">
								<a href="#pablo"> <c:if
										test="${cus.email == 'hang@gmail.com'}">
										<img class="img"
											src="${pageContext.request.contextPath}/img/dung.jpg" />
									</c:if> <c:if test="${cus.email == 'trinhnguyen@email.com'}">
										<img class="img"
											src="${pageContext.request.contextPath}/img/hau.jpg" />
									</c:if>
								</a>
							</div>
							<div class="card-body">
								<br>
								<a class="btn btn-primary btn-round">${cus.hoTen}</a>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		<!-- content Nhân_Viên-->

		<button type="submit"
			onclick="return confirm('Are you sure you want to Update Information Customer?')">Update</button>
	</form>
	</c:if>
	<form action="${pageContext.request.contextPath}/DashboardAdmin"
		method="post" style="margin-left: 250px; margin-top: -62px;">
		<button type="submit">BACK</button>
	</form>
</body>
</html>