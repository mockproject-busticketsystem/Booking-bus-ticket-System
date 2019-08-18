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
	<div id="main">
		<div id="head">
			<br>
		<h4>Id Chuyến : ${idchuyen} Ngày Đi : ${ngaydi} Giờ Xe Chạy : ${giodi} Địa Điểm
				Khởi Hành : ${diemdi} Địa Điểm Đến : ${diemden}
				</h4></div>
				
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
					<c:forEach items="${ghe}" var="chongoi">
						
						<tbody>
							
							<td>${chongoi.maGhe}</td>
							<td>${chongoi.status}</td>
							<td></td>
							<form method="POST"
							action="${pageContext.request.contextPath}/DashboardNhanVien/XemGhe">
							<input type="hidden" name="cmnd" value=${cmnd}></input>
										<input type="hidden" name="idchuyen" value=${idchuyen}></input>
										<input type="hidden" name="ngaydi" value=${ngaydi}></input>
												<input type="hidden" name="giodi" value=${giodi}></input>
												<input type="hidden" name="diemdi" value=${diemdi}></input>
													<input type="hidden" name="diemden" value=${diemden}></input>
														<input type="hidden" name="maghe" value=${chongoi.maGhe}></input>
							<td>	<c:if test="${chongoi.status.equals('false')}"><input type="submit" name="update" value="Update"></c:if></td>
							
								<td><input type="submit" name="delete" onclick = "return confirm('Bạn có muốn xóa vé này không ?')"value="Delete"></td>
									</form>
						</tbody>

					
					</c:forEach>
				</table>
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
        $(document).ready( function () {
    $('#mydataTable').DataTable();
} );
    </script>
</body>
</html>