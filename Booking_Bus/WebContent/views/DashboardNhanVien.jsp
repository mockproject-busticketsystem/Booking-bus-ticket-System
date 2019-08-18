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

	<div id="main">
		<div id="head">
			<div class=left>
				<h3 style="float: right;margin-right: -370px;">Welcome ${hoTen}</h3>
					<form method="POST"
					action="${pageContext.request.contextPath}/DashboardNhanVien">
					<th scope="col">
						<h4>
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

					<th scope="col">Chọn giá trị của thuộc tính để lọc <select
						name="choosevalues" class="txtFrm" id="choosevalues"
						required="required " onchange="this.form.submit();">
							<option>filter value</option>
							<c:choose>
								<c:when test="${choosethuoctinh.equals('Id Chuyen')}">
									<c:forEach items="${distinctidchuyen}" var="listItem">
										<option value="${listItem.iDChuyen}"
											<c:if test="${choosevalues.equals(listItem.iDChuyen.toString())==true}">
											selected
										
									</c:if>>${listItem.iDChuyen}</option>
									</c:forEach>

								</c:when>
								<c:when test="${choosethuoctinh.equals('Ngay Di')}">
									<c:forEach items="${distinctngaydi}" var="listItem">
										<option value="${listItem.ngayDi}"
											<c:if test="${choosevalues.equals(listItem.ngayDi.toString())==true}">
											selected
										
									</c:if>>${listItem.ngayDi}</option>
									</c:forEach>

								</c:when>
								<c:when test="${choosethuoctinh.equals('Gio Di')}">
									<c:forEach items="${distinctgiodi}" var="listItem">
										<option value="${listItem.gioDi}"
											<c:if test="${choosevalues.equals(listItem.gioDi.toString())==true}">
											selected
									</c:if>>${listItem.gioDi}</option>
									</c:forEach>
								</c:when>
								<c:when test="${choosethuoctinh.equals('Diem Di')}">
									<c:forEach items="${distinctdiemdi}" var="listItem">
										<option value="${listItem.diaDiemDi}"
											<c:if test="${choosevalues.equals(listItem.diaDiemDi)==true}">
											selected
									</c:if>>${listItem.diaDiemDi}</option>
									</c:forEach>
								</c:when>

								<c:when test="${choosethuoctinh.equals('Diem Den')}">
									<c:forEach items="${distinctdiemden}" var="listItem">
										<option value="${listItem.diaDiemDen}"
											<c:if test="${choosevalues.equals(listItem.diaDiemDen)==true}">
											selected
									</c:if>>${listItem.diaDiemDen}</option>
									</c:forEach>
								</c:when>

								<c:when test="${choosethuoctinh.equals('Don Gia')}">
									<c:forEach items="${distinctdongia}" var="listItem">
										<option value="${listItem.donGia}"
											<c:if test="${choosevalues.equals(listItem.donGia)==true}">
											selected
									</c:if>>${listItem.donGia}</option>
									</c:forEach>
								</c:when>
								<c:when test="${choosethuoctinh.equals('Hang Doi')}">
									<c:forEach items="${distincthangdoi}" var="listItem">
										<option value="${listItem.hangDoi}"
											<c:if test="${choosevalues.equals(listItem.hangDoi)==true}">
											selected
									</c:if>>${listItem.hangDoi}</option>
									</c:forEach>
								</c:when>

							</c:choose>


					</select>

						</h4></th>
					<th scope="col">
						<h4>
							Chọn thuộc tính muốn lọc2 <select name="choosethuoctinh2"
								class="txtFrm" id="choosethuoctinh2" required="required "
								onchange="this.form.submit();">

								<c:forEach items="${thuoctinh}" var="listItem">
									<c:if test="${listItem.equals(choosethuoctinh)==false}">
										<option value="${listItem}"
											<c:if test="${listItem.equals(choosethuoctinh2)==true}">
											selected
									</c:if>>${listItem}</option>
									</c:if>
								</c:forEach>
							</select>
					</th>
					<th scope="col">Chọn giá trị của thuộc tính để lọc2 <select
						name="choosevalues2" class="txtFrm" id="choosevalues2"
						required="required " onchange="this.form.submit();">
							<option>filter value</option>
							<c:choose>
								<c:when test="${choosethuoctinh2.equals('Id Chuyen')}">
									<c:forEach items="${distinctidchuyen2}" var="listItem">
										<option value="${listItem.iDChuyen}"
											<c:if test="${choosevalues2.equals(listItem.iDChuyen.toString())==true}">
											selected
										
									</c:if>>${listItem.iDChuyen}</option>
									</c:forEach>

								</c:when>
								<c:when test="${choosethuoctinh2.equals('Ngay Di')}">
									<c:forEach items="${distinctngaydi2}" var="listItem">
										<option value="${listItem.ngayDi}"
											<c:if test="${choosevalues2.equals(listItem.ngayDi.toString())==true}">
											selected
										
									</c:if>>${listItem.ngayDi}</option>
									</c:forEach>

								</c:when>
								<c:when test="${choosethuoctinh2.equals('Gio Di')}">
									<c:forEach items="${distinctgiodi2}" var="listItem">
										<option value="${listItem.gioDi}"
											<c:if test="${choosevalues2.equals(listItem.gioDi.toString())==true}">
											selected
									</c:if>>${listItem.gioDi}</option>
									</c:forEach>
								</c:when>
								<c:when test="${choosethuoctinh2.equals('Diem Di')}">
									<c:forEach items="${distinctdiemdi2}" var="listItem">
										<option value="${listItem.diaDiemDi}"
											<c:if test="${choosevalues2.equals(listItem.diaDiemDi)==true}">
											selected
									</c:if>>${listItem.diaDiemDi}</option>
									</c:forEach>
								</c:when>

								<c:when test="${choosethuoctinh2.equals('Diem Den')}">
									<c:forEach items="${distinctdiemden2}" var="listItem">
										<option value="${listItem.diaDiemDen}"
											<c:if test="${choosevalues2.equals(listItem.diaDiemDen)==true}">
											selected
									</c:if>>${listItem.diaDiemDen}</option>
									</c:forEach>
								</c:when>

								<c:when test="${choosethuoctinh2.equals('Don Gia')}">
									<c:forEach items="${distinctdongia2}" var="listItem">
										<option value="${listItem.donGia}"
											<c:if test="${choosevalues2.equals(listItem.donGia)==true}">
											selected
									</c:if>>${listItem.donGia}</option>
									</c:forEach>
								</c:when>
								<c:when test="${choosethuoctinh2.equals('Hang Doi')}">
									<c:forEach items="${distincthangdoi2}" var="listItem">
										<option value="${listItem.hangDoi}"
											<c:if test="${choosevalues2.equals(listItem.hangDoi)==true}">
											selected
									</c:if>>${listItem.hangDoi}</option>
									</c:forEach>
								</c:when>

							</c:choose>


					</select>
						</h4></th>
				</form>
			</div>


		</div>


		<div id="content">


			<table id="mydataTable" class="table table-striped table-bordered"
				style="width: 100%">

				<thead>

					<tr>
						<th scope="col" style="color: black;">Id Tuyến</th>
						<th scope="col" style="color: black;">Ngày Đi</th>
						<th scope="col" style="color: black;">Giờ Đi</th>
						<th scope="col" style="color: black;">Điểm Đi</th>
						<th scope="col" style="color: black;">Điểm Đến</th>
						<th scope="col" style="color: black;">Đơn Giá</th>
						<th scope="col" style="color: black;">Hàng Đợi</th>
						<th scope="col" style="color: black;">Số Lượng</th>
						<th scope="col" style="color: black;">Tổng Giá</th>
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
							<form method="POST"
								action="${pageContext.request.contextPath}/DashboardNhanVien/XemVe">
								<input type="hidden" name="idchuyen" value=${ve.iDChuyen}></input>
								<input type="hidden" name="ngaydi" value=${ve.ngayDi}></input>
								<td><input type="submit" value="xem vé"></td>

							</form>
						</tr>

					</c:forEach>
				</tbody>
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