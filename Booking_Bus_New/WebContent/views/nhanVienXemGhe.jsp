<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Nhân Viên Xem Ghế</title>
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
							<input type="submit" value="Thông Tin Vé">
					</form>
					</h4>
				</div>
				<div class=right>
					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien">

						<h4>
							<input type="submit" value="Tình Trạng Vé">
					</form>
					</h4>
				</div>
					<div class=right2>
					<form method="POST"
						action="${pageContext.request.contextPath}/LoadChuyen">
						<h4>
							<input type="submit" value="Xem Chuyến">
					</form>
					</h4>
				</div>
						<div class=right2>
					<form method="POST"
						action="${pageContext.request.contextPath}/LoadBangGhe">
						<h4>
							<input type="submit" value="Xem Sơ Đồ Ghế">
				</form>
					</h4>
				</div>
			
	
				<div class=right2>
					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien/XemVe">
						<input type="hidden" name="idchuyen" value=${idchuyen}></input> <input
							type="hidden" name="ngaydi" value=${ngaydi}></input>
						<h4>
							<input type="submit" value="Back Chuyến" >
					</form>
					</h4>
				</div>
		<div class=right2>
						<form method="POST"
						action="${pageContext.request.contextPath}/DangXuat">
						<h4>
							<input type="submit" value="Đăng Xuất">
					</form>
					</h4>
				</div>




			</div>


		</div>
		<div id="main">
			<div id=head>
				<div class=logo>
					<p>Thanh Toán</p>
				</div>



			</div>


			<div id="head1">
				<h4>
					<div class="left1" style="margin-left: 30px">Id Chuyến &nbsp</div>
					<div class=left2>${idchuyen}</div>
					<div class=left1>
						Giờ Xe Chạy </br> </br>Ngày Đi
					</div>
					<div class=left2>
						${giodi} </br> </br> ${ngaydi}
					</div>
					<div class=left1>
						Khởi Hành </br> </br> Điểm Đến
					</div>
					<div class=left2>
						${diemdi}</br> </br> ${diemden}
					</div>
					<div class=left1>
						Người đặt </br> </br>SĐT
					</div>
					<div class=left2>
						${hoten}</br> </br> ${sdt}
					</div>
				</h4>
			</div>
			</br>
			<div id="content">

				<div class=left>
					<table id="mydataTable" class="table table-striped table-bordered"
						style="width: 100%">
						<thead>
							<tr>
								<th scope="col" style="color: black;">Ghế</th>
								<th scope="col" style="color: black;">Status</th>
								<th scope="col" style="color: black;">Ngày Giờ Đặt</th>
								<th scope="col" style="color: black;">Update Status</th>
								<th scope="col" style="color: black;">Delete</th>

							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${ghe}" var="chongoi">


								<tr>
									<td>${chongoi.maGhe}</td>
									<td><c:choose>
											<c:when test="${chongoi.status == true}">
												<img src="${pageContext.request.contextPath}/img/accept.png"
													height="22" width="22">

											</c:when>
											<c:when test="${chongoi.status == false}">
												<img src="${pageContext.request.contextPath}/img/x.png"
													height="22" width="22">

											</c:when>
										</c:choose></td>
									<td>${chongoi.ngayGioDat}</td>
									<form method="POST"
										action="${pageContext.request.contextPath}/DashboardNhanVien/XemGhe">
										<input type="hidden" name="cmnd" value="${cmnd}"></input> <input
											type="hidden" name="idchuyen" value="${idchuyen}"></input> <input
											type="hidden" name="ngaydi" value="${ngaydi}"></input> <input
											type="hidden" name="giodi" value="${giodi}"></input> <input
											type="hidden" name="diemdi" value="${diemdi}"></input> <input
											type="hidden" name="diemden" value="${diemden}"></input> <input
											type="hidden" name="maghe" value="${chongoi.maGhe}"></input><input
											type="hidden" name="statuschoose" value="${chongoi.status}"></input>
										
										<td><c:if test="${chongoi.status==((false))}">
												<input type="submit" name="update" value="Update"
													style="border-radius: 20px">
											</c:if></td>

										<td><c:if test="${checkDelete==(true)}"><input type="submit" name="delete" value="Delete"
											style="border-radius: 20px"></c:if></td>
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