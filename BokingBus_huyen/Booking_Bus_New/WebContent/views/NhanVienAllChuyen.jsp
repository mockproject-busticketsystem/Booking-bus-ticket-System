<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Nhân Viên</title>
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
		<style type="text/css">
	#mydataTable_filter{
	display: none;
	}
	</style>
<body>
	<div id=main_top>
			<div id=main2>
					<div class=top>
					<img src="img/icon_nhanvien.png"  height="62" width="62">
				<h1>Nhân Viên Quản Lý</h1>
				<hr class=new4>
				<div class=right>
					<form method="POST"
						action="${pageContext.request.contextPath}/LoadVe">

						<h4>
							<input type="submit" value="Thông Tin Vé">
					</form>
					</h4>
				</div>
				<div class=right2>
					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien">
						<input type="hidden" name="idchuyen" value=${idchuyen}></input> <input
							type="hidden" name="ngaydi" value=${ngaydi}></input>
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
						action="${pageContext.request.contextPath}/DangXuat">
						<h4>
							<input type="submit" value="Đăng Xuất">
					</form>
					</h4>
				</div>

			</div>
		</div>
		
			<div id="main_head" ><div id=head >
				<div class=logo>
					<p>Xem Tất Cả Chuyến</p>
				</div>

			</div></div>
		<div id="main">
			<div id=head>
<div class=margin2></div>

				<div class=filterright>
					<h5>
					<form method="POST"
							action="${pageContext.request.contextPath}/LoadChuyen">
							<th scope="col"><input type="text" name="search"></input>
							<input type="submit" onclick="this.form.submit();" value =search name ="search" style="width:90px;"></input></th>
					
					</h5>

				</div>
			</div>
			</br>
			</br>
			<div class="margin"></div>
			<div id="head">

				<div class=filterleft style="margin-left: 23%;">
					<h5>
					
							<th scope="col">Chọn Điểm Đi  <input type="hidden" name="ktchondiemdi" value="${chondiemdi}"></input><select name="chondiemdi"
								class="txtFrm" id="chondiemdi" required="required "
								onchange="this.form.submit();">

									<option value="0">All</option>
									<c:forEach items="${loaddiemdi}" var="listItem">
										<option value="${listItem.diaDiemDi}"
											<c:if test="${listItem.diaDiemDi.equals(chondiemdi)}">
											selected
									</c:if>>${listItem.diaDiemDi}</option>
									</c:forEach>
							</select>
					
						</th>
					</h5>
				</div>
				<div class=filterleft>
					<h5>
					
							<th scope="col">Chọn Điểm Đến <select name="chondiemden"
								class="txtFrm" id="chondiemden" required="required "
								onchange="this.form.submit();">
									<option values="0">filter value</option>
									<c:forEach items="${loaddiemden}" var="listItem">
										<option value="${listItem.diaDiemDen}"
											<c:if test="${listItem.diaDiemDen.equals(chondiemden)}">
											selected
									</c:if>>${listItem.diaDiemDen}</option>
									</c:forEach>
							</select>
							</th>
						</form>
					</h5>
				</div>
			</div>
			<div id="content">
<div class=margin></div>

				<table id="mydataTable" class="table table-striped table-bordered"
					style="width: 100%">

					<thead>

						<tr>
							<th scope="col" style="color: black;">Id</th>
							<th scope="col" style="color: black;">Điểm Đi</th>

							<th scope="col" style="color: black;">Điểm Đến</th>
							<th scope="col" style="color: black;">Giờ Đi</th>
							<th scope="col" style="color: black;">Giờ Đến</th>
							<th scope="col" style="color: black;">Đơn Giá</th>
							<th scope="col" style="color: black;">Hàng Đợi</th>
							<th scope="col" style="color: black;">Chuyến Đã Đặt</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${AllChuyen}" var="ve">

							<tr>
								<td>${ve.iDChuyen}</td>
								<td>${ve.diaDiemDi}</td>
								<td>${ve.diaDiemDen}</td>
								<td>${ve.gioDi}</td>
								<td>${ve.gioDen}</td>
								<td>${ve.donGia}</td>
								<td>${ve.hangDoi}</td>
								<form method="POST"
									action="${pageContext.request.contextPath}/DashboardNhanVien">
									<input type="hidden" name="idchuyen" value=${idchuyen}></input>
									<input type="hidden" name="ngaydi" value=${ngaydi}></input>
									
									<input type="hidden" name="tempCD" value="1"></input>
									<input type="hidden" name="choosethuoctinh" value="Diem Di"></input>
									<input type="hidden" name="choosethuoctinh2" value="Diem Den"></input>
									<input type="hidden" name="choosevalues" value="${ve.diaDiemDi}"></input>
									<input type="hidden" name="choosevalues2" value="${ve.diaDiemDen}"></input>
									
									
										<td><input type="submit" value="Tình Trạng Vé" style="border-radious:20px">
								</td></form>
							</tr>

						</c:forEach>
					</tbody>
				</table>

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