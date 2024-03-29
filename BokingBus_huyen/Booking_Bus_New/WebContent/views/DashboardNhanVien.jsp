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
<body>
	<div id=main_top>
		<div id=main2>
			<div class=top>
				<img src="${pageContext.request.contextPath}/img/icon_nhanvien.png"
					height="62" width="62">
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
		<div id="main_head">
			<div id=head>
				<div class=logo>
					<p>Xem Tất Cả Chuyến Đã Đặt</p>
				</div>

			</div>
		</div>
		<div id="main">



			<div id="head">

				<div class=left>

					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien">
						<th scope="col">
							<h5>
								Chọn thuộc tính muốn lọc <select name="choosethuoctinh"
									class="txtFrm" id="choosethuoctinh" required="required "
									onchange="this.form.submit();">

									<c:forEach items="${thuoctinh}" var="listItem">
										<option value="${listItem}"
											<c:if test="${listItem.equals(choosethuoctinh)==true}">
											selected
									</c:if>>${listItem}</option>
									</c:forEach>
								</select>
						</th>

						<th scope="col">Chọn giá trị <input type="hidden"
							name="ktchondiemdi" value="${choosevalues}"></input><select
							name="choosevalues" class="txtFrm" id="choosevalues"
							required="required " onchange="this.form.submit();">
								<option>filter value</option>
								<c:choose>


									<c:when test="${choosethuoctinh.equals('Diem Di')}">
										<c:forEach items="${distinct}" var="listItem">
											<option value="${listItem.diaDiemDi}"
												<c:if test="${choosevalues.equals(listItem.diaDiemDi)==true}">
											selected
									</c:if>>${listItem.diaDiemDi}</option>
										</c:forEach>
									</c:when>

									<c:when test="${choosethuoctinh.equals('Diem Den')}">
										<c:forEach items="${distinct}" var="listItem">
											<option value="${listItem.diaDiemDen}"
												<c:if test="${choosevalues.equals(listItem.diaDiemDen)==true}">
											selected
									</c:if>>${listItem.diaDiemDen}</option>
										</c:forEach>
									</c:when>
								</c:choose>

								<c:if test="${tempCD.equals('1')}">
									<option value="${choosevalues}" selected>${choosevalues}</option>
								</c:if>

						</select>

							</h5></th>
						<th scope="col">
							<h5>
								Chọn thuộc tính muốn lọc <select name="choosethuoctinh2"
									class="txtFrm" id="choosethuoctinh2" required="required "
									onchange="this.form.submit();">

									<c:forEach items="${thuoctinh}" var="listItem">
										<c:if
											test="${choosethuoctinh.equals('All')==false && choosevalues.equals('filter value')==false}">
											<c:if test="${listItem.equals(choosethuoctinh)==false }">
												<option value="${listItem}"
													<c:if test="${listItem.equals(choosethuoctinh2)==true}">
											selected
									</c:if>>${listItem}</option>
											</c:if>
										</c:if>
									</c:forEach>
								</select>
						</th>
						<th scope="col">Chọn giá trị <select name="choosevalues2"
							class="txtFrm" id="choosevalues2" required="required "
							onchange="this.form.submit();">

								<option>filter value</option>
								<c:choose>

									<c:when test="${choosethuoctinh2.equals('Diem Di')}">
										<c:forEach items="${distinct2}" var="listItem">
											<option value="${listItem.diaDiemDi}"
												<c:if test="${choosevalues2.equals(listItem.diaDiemDi)==true}">
											selected
									</c:if>>${listItem.diaDiemDi}</option>
										</c:forEach>

									</c:when>

									<c:when test="${choosethuoctinh2.equals('Diem Den')}">
										<c:forEach items="${distinct2}" var="listItem">
											<option value="${listItem.diaDiemDen}"
												<c:if test="${choosevalues2.equals(listItem.diaDiemDen)==true}">
											selected
									</c:if>>${listItem.diaDiemDen}</option>
										</c:forEach>
									</c:when>

								</c:choose>
								<c:if test="${tempCD.equals('1')}">
									<option value="${choosevalues2}" selected>${choosevalues2}</option>
								</c:if>

						</select>
							</h5></th>
					</form>
				</div>


			</div>


			<div id="content">


				<table id="mydataTable" class="table table-striped table-bordered"
					style="width: 100%">

					<thead>

						<tr>
							<th scope="col" style="color: black;">Chuyến</th>
							<th scope="col" style="color: black;">Ngày Đi</th>
							<th scope="col" style="color: black;">Giờ</th>
							<th scope="col" style="color: black;">Điểm Đi</th>
							<th scope="col" style="color: black;">Điểm Đến</th>
							<th scope="col" style="color: black;">Đơn Giá</th>
							<th scope="col" style="color: black;">Hàng Đợi</th>
							<th scope="col" style="color: black;">Đã Đặt</th>
							<th scope="col" style="color: black;">Tổng Giá</th>
							<th scope="col" style="color: black;">Status</th>
							<th scope="col" style="color: black;">View vé</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${AllInfor}" var="ve">

							<tr>
								<td>${ve.iDChuyen}</td>
								<td>${ve.ngayDi}</td>
								<td>${ve.gioDi}</td>
								<td>${ve.diaDiemDi}</td>
								<td>${ve.diaDiemDen}</td>
								<td>${ve.donGia}</td>
								<td>${ve.hangDoi}</td>
								<td>${ve.soLuong}</td>
								<td>${ve.soLuong*ve.donGia}</td>
								<td><c:choose>
										<c:when test="${ve.soLuong==ve.statuscount}">
											<img src="${pageContext.request.contextPath}/img/accept.png"
												height="22" width="22">

										</c:when>
										<c:when test="${ve.soLuong!=ve.statuscount}">
											<img src="${pageContext.request.contextPath}/img/x.png"
												height="22" width="22">

										</c:when>
									</c:choose></td>
								<form method="POST"
									action="${pageContext.request.contextPath}/DashboardNhanVien/XemVe">
									<input type="hidden" name="idchuyen" value=${ve.iDChuyen}></input>
									<input type="hidden" name="ngaydi" value=${ve.ngayDi}></input>
								<td><input type="submit" value="xem vé" style="width: 80px"></td>

								</form>
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