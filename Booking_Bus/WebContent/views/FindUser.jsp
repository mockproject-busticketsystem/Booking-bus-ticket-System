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
</head>
<body class="dark-edition"  style="background: #DDDDDD;">
			<div style="">
				<form action="${pageContext.request.contextPath}/infoNhanvien"
					method="get" name="frm">
					<table class="table table-striped table-dark" id="table" border="1">
						<thead>
							<tr>
								<th scope="col" style="color: white;">Email</th>
								<th scope="col" style="color: white;">Role</th>
								<th scope="col" style="color: white;">Edit</th>
								<th scope="col" style="color: white;">Detail</th>
							</tr>
						</thead>
							<tbody>
								<tr>
									<td>${tkSearch.email}</td>
									<input type="hidden" value="${tkSearch.email}" name="email">
									<td>${tkSearch.role}</td>
									<td><a class="fa fa-pencil" id="select"
										style="color: white; text-decoration: none; font-size: 15px; font-size: 20px;"
										onclick="document.getElementById('modform').style.display='block';addRowHandlers();"
										style="width:auto;"></a></td>
									<%-- 								<td>&nbsp&nbsp&nbsp<a class="material-icons"
									style="color: white; text-decoration: none; 
									text-align: center;" href="http://localhost:8080/Booking_Bus/DeleteUserServlet?email_delete=${taikhoan.email}">&#xE872;</a>
								</td> --%>
									<td><c:if test="${tkSearch.role == 'nhanvien'}">
											<a href="infoNhanvien?email=${tkSearch.email}"
												class="btn btn-info">Detail</a>
										</c:if> <c:if test="${tkSearch.role == 'khachhang'}">
											<a href="infoKhachhang?email=${tkSearch.email}"
												class="btn btn-info">Detail</a>
										</c:if></td>
								</tr>
							</tbody>
					</table>
				</form>
			</div>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/data.js"></script>
		<button  onclick="history.back()">BACK</button>
</body>
</html>