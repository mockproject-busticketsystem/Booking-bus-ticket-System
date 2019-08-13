<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/main1.css">
<title>Booking Bus</title>
</head>
<body>
<div id="main">
		<jsp:include page="header2.jsp"></jsp:include>
		<div id="content">
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
						<h2>View All Ticket Booked</h2>
							<tr class="table100-head">
								<th class="column1">Mã Chuyến</th>
								<th class="column2">Địa Điểm Đi</th>
								<th class="column3">Địa Điểm Đến</th>
								<th class="column4">Ngày Đi</th>
								<th class="column5">Giờ Đi</th>
								<th class="column6">Mã Ghế</th>
								<th class="column7">Hàng Đợi</th>
								<th class="column8">Đơn Giá</th>
								<th class="column9">Satus</th>
								<th class="column10">Action</th>
							</tr>
						</thead>
						<tbody>
						<tr><td colspan='10'>Phiếu Đặt Chỗ</td></tr>
							<c:forEach var="item" items="${listVeStatusFalse}">
							<tr>
								<th class="column1"> ${item.chuyenDi.iD}</th>
								<th class="column2"> ${item.chuyenDi.maTuyen}</th>
								<th class="column3"> ${item.chuyenDi.maTuyen}</th>
								<th class="column4"> ${item.ngayDi}</th>
								<th class="column5"> ${item.chuyenDi.gioiDi} </th>
								<th class="column6"> ${item.maGhe} </th>
								<th class="column7"> ${item.hangDoi} </th>
								<th class="column8"> ${item.donGia} </th>
								<th class="column9"> ${item.status} </th>
								<th class="column10"> Action </th>
							</tr>
							</c:forEach>
							<tr><td colspan='10'>Vé Đã Thanh Toán</th></tr>
							<c:forEach var="item" items="${listVeStatusTrue}">
							<tr>
								<th class="column1"> ${item.chuyenDi.iD}</th>
								<th class="column2"> ${item.chuyenDi.maTuyen}</th>
								<th class="column3"> ${item.chuyenDi.maTuyen}</th>
								<th class="column4"> ${item.ngayDi}</th>
								<th class="column5"> ${item.chuyenDi.gioiDi} </th>
								<th class="column6"> ${item.maGhe} </th>
								<th class="column7"> ${item.hangDoi} </th>
								<th class="column8"> ${item.donGia} </th>
								<th class="column9"> ${item.status} </th>
								<th class="column10"> <span class="table-remove"><button type="button"
                                    class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span></th>
							</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>