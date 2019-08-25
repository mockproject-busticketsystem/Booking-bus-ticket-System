<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<title>Profile</title>
<!--     Fonts and icons     -->
<!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> -->
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
	<c:if test="${not empty nv.cMND}">
		<form
			action="${pageContext.request.contextPath}/UpdateNhanVienServlet"
			method="post">
			<div id="content">

				<div class="container-fluid">
					<div class="row">

						<div class="col-md-8">

							<div class="card">

								<div class="card-header card-header-primary">

									<h4 class="card-title">Profile ${nv.email}</h4>
									<p class="card-category">Complete your profile</p>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label class="bmd-label-floating">Id</label> <input
													type="text" value="${nv.cMND}" class="form-control"
													disabled style="color: red; background: #202940;">
												<input type="hidden" value="${nv.cMND}" name="CMND">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">Email</label> <input
													type="text" disabled
													style="color: red; background: #202940;"
													value="${nv.email}" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">Số điện thoại</label> <input
													type="text" value="${nv.sDT}" class="form-control"
													name="SDT" pattern="[0-9]*.{10,11}" required>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">Họ và tên </label> <input
													type="text" value="${nv.hoTen}" class="form-control"
													name="HoTen" required>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="bmd-label-floating">Chức vụ</label> <input
													type="text" value="${nv.chucVu}" name="Chucvu"
													class="form-control" style="text-align: center;">
											</div>
										</div>
									</div>
									<!-- <button onclick="history.back()">BACK</button> -->
									<div class="clearfix"></div>

								</div>

							</div>

						</div>
						<div class="col-md-4">
							<div class="card card-profile">
								<div class="card-avatar">
									<a href="#pablo"> <c:if
											test="${nv.email == 'hai@gmail.com'}">
											<img class="img"
												src="${pageContext.request.contextPath}/img/tuan1.jpg" />
										</c:if> <c:if test="${nv.email == 'nguyenthidieuhuyenpy@gmail.com'}">
											<img class="img"
												src="${pageContext.request.contextPath}/img/huyen.jpg" />
										</c:if>
									</a>
								</div>
								<div class="card-body">

									<h5 class="card-category" style="margin-top: 50px;">${nv.chucVu}</h5>
									<h4 class="card-title">${nv.hoTen}</h4>
									<a href="#pablo" class="btn btn-primary btn-round">Upload</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- content Nhân_Viên-->

			<button type="submit"
				onclick="return confirm('Are you sure you want to Update Information Clerk?')">Update</button>

		</form>
	</c:if>
	<c:if test="${empty nv.cMND}">
		<form
			action="${pageContext.request.contextPath}/InsertNhanVien"
			method="post">
			<div id="content">
				<div class="container-fluid">
					<div class="row">

						<div class="col-md-8">

							<div class="card">

								<div class="card-header card-header-primary">

									<h4 class="card-title">Profile </h4>
									<p class="card-category">Complete your profile</p>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label class="bmd-label-floating">Id</label> <input
													type="text" class="form-control"
													 style="background: #202940;" name="CMND">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">Email</label> <input
													type="text" 
													style=" background: #202940;" class="form-control" name = "email">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">Số điện thoại</label> <input
													type="text" class="form-control"
													name="SDT" pattern="[0-9]*.{10,11}" required>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">Họ và tên </label> <input
													type="text" class="form-control"
													name="HoTen" required>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="bmd-label-floating">Chức vụ</label>
												 <input
													type="text" name="Chucvu"
													class="form-control" style="text-align: center;">
											</div>
										</div>
									</div>
									<!-- <button onclick="history.back()">BACK</button> -->
									<div class="clearfix"></div>

								</div>

							</div>

						</div>
						<div class="col-md-4">
							<div class="card card-profile">
								<div class="card-avatar">
									<a href="#pablo"> <c:if
											test="${nv.email == 'hai@gmail.com'}">
											<img class="img"
												src="${pageContext.request.contextPath}/img/tuan1.jpg" />
										</c:if> <c:if test="${nv.email == 'nguyenthidieuhuyenpy@gmail.com'}">
											<img class="img"
												src="${pageContext.request.contextPath}/img/huyen.jpg" />
										</c:if>
									</a>
								</div>
								<div class="card-body">

									<h5 class="card-category" style="margin-top: 50px;">${nv.chucVu}</h5>
									<h4 class="card-title">${nv.hoTen}</h4>
									
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- content Nhân_Viên-->

			<button type="submit"
				onclick="return confirm('Are you sure you want to Update Information Clerk?')">Update</button>

		</form>
	</c:if>
	<form action="${pageContext.request.contextPath}/DashboardAdmin"
		method="post" style="margin-left: 250px; margin-top: -62px;">
		<button type="submit">BACK</button>
	</form>
</body>
</html>