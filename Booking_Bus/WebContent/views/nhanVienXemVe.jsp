<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Nhân Viên Xem Chuyến</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nhanvien.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	type="text/css">
<body>
	<div id=main_top>
		<div id=main2>
			<div class=top>
				<h5>Nhân Viên Quản Lý</h5>
				<hr class=new4>
	<div class=right>
					<form method="POST"
						action="${pageContext.request.contextPath}/LoadVe">

						<h4>
							<input type="submit" value="All Vé">
					</form>
					</h4>
				</div>
				<div class=right>
					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien">

						<h4>
							<input type="submit" value="All Chuyến">
					</form>
					</h4>
				</div>
				<div class=right2>
					
						<h4>
							<input type="submit" value="Xem Sơ Đồ Ghế">
				
					</h4>
				</div>
	

			</div>
		</div>
		<div id="main">
			<div id=head>
				<div class=logo>
					<p>Thông Tin Chuyến Đi</p>
				</div>



			</div>


			<c:set var="a" value="0" />

			<div id="head1">
				<c:forEach items="${allve}" var="ve">
					<c:if test="${a.equals('0')}">
						<h4>
							<div class="left1" style="margin-left:30px" >Id Chuyến &nbsp</div>
								<div class=left2> ${ve.iDChuyen}</div>
							<div class=left1>
								Giờ Xe Chạy </br> </br> Ngày Đi
							</div>
							<div class=left2>
								 ${ve.gioDi} </br> </br> ${ve.ngayDi}
							</div>
							<div class=left1>
								Khởi Hành </br> </br> Điểm Đến
							</div>
							<div class=left2>
								 ${ve.diaDiemDi} </br> </br>  ${ve.diaDiemDen}
							</div>
							<div class=left1>Vị Trí Chờ Xe  &nbsp</div>
								<div class=left2> ${ve.hangDoi}</div>
						</h4>
						<c:set var="a" value="1" />
					</c:if>
				</c:forEach>
			</div>
			</br>
			<div id="content">


				<table id="mydataTable" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th scope="col" style="color: black;">CMND</th>
							<th scope="col" style="color: black;">Họ Tên</th>
							<th scope="col" style="color: black;">SDT</th>


							<th scope="col" style="color: black;">Đơn Giá</th>
							<th scope="col" style="color: black;">Số Lượng Vé</th>
							<th scope="col" style="color: black;">Thành Tiền</th>

							<th scope="col" style="color: black;">Status</th>
							<th scope="col" style="color: black;">Xem Ghế</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allve}" var="ve">

							<tr>
								<td>${ve.cMND}</td>
								<td>${ve.hoTen}</td>
								<td>${ve.sDT}</td>
								<td>${ve.donGia}</td>
								<td>${ve.soLuong}</td>
								<td>${ve.soLuong*ve.donGia}</td>
								<td><c:choose>
									<c:when test="${ve.status == false}">
								<img  src="${pageContext.request.contextPath}/img/x.png"  height="22" width="22">
									
									</c:when>
									<c:when test="${ve.status}">
										<img src="${pageContext.request.contextPath}/img/accept.png"  height="22" width="22">
									
									</c:when>
									</c:choose></td>
								<form method="POST"
									action="${pageContext.request.contextPath}/DashboardNhanVien/XemGhe">
									
								<input type="hidden" name="cmnd" value="${ve.cMND}"></input>
									<input type="hidden" name="cmnd" value="${ve.cMND}"></input> <input
										type="hidden" name="hoten" value="${ve.hoTen}"></input> <input
										type="hidden" name="idchuyen" value="${ve.iDChuyen}"></input>
									<input type="hidden" name="ngaydi" value="${ve.ngayDi}"></input>
									<input type="hidden" name="giodi" value="${ve.gioDi}"></input>
									<input type="hidden" name="diemdi" value="${ve.diaDiemDi}">
									</input> <input type="hidden" name="diemden" value="${ve.diaDiemDen}"></input>
									<input type="hidden" name="sdt" value="${ve.sDT}"></input>
											
									<td><input type="submit" value="xem ghế" style="border-radius:20px"></input></td>
								</form>
							</tr>



						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#mydataTable').DataTable();
		});
	</script>
</body>

</html>