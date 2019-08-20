<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Dashboard Nhan Vien</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/css/nhanvien.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/material-dashboard.css?v=2.1.0"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/css.css"
	rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	type="text/css">
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	type="text/css">


</head>

<body class="dark-edition" style="background: #F6F8FA;">

	<div class="wrapper">
		<div class="sidebar" data-color="purple" data-background-color="black"
			style="border-color: transparent; width: 250px;">
			<div class="logo">
				<a href="#" class="simple-text logo-normal"
					style="color: #F8FFFF; font-family: cursive;"> MÃ n hÃ¬nh
					chÃ­nh </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">

					<li class="nav-item "><a class="nav-link" id="user_profile"
						href="#"> <i class="material-icons" style="color: #F8FFFF;">person</i>
							<p style="color: #F8FFFF; font-family: cursive; font-size: 20px;">Xem
								táº¥t cáº£ vÃ©</p>
					</a></li>

					<li class="nav-item"><a class="nav-link" id="list_users"
						href="#"> <i class="material-icons" style="color: #F8FFFF;">content_paste</i>
							<p style="color: #F8FFFF; font-family: cursive; font-size: 20px;">
								Xem táº¥t cáº£<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp chuyáº¿n
								Äi
							</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" id="list_users"
						href="#"> <i class="material-icons" style="color: #F8FFFF;">event_seat</i>
							<p style="color: #F8FFFF; font-family: cursive; font-size: 20px;">
								Xem táº¥t cáº£<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp gháº¿ cÃ³
								sáºµn
							</p>
					</a></li>


					<!-- <li class="nav-item active-pro ">
                <a class="nav-link" href="./upgrade.html">
                    <i class="material-icons">unarchive</i>
                    <p>Upgrade to PRO</p>
                </a>
            </li> -->
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<div id=head>
				<div class=logo>
					<p>ThÃ´ng Tin Chuyáº¿n Äi</p>
				</div>
			</div>
			<%-- <div id="head">

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

						<th scope="col">Chọn giá trị <select name="choosevalues"
							class="txtFrm" id="choosevalues" required="required "
							onchange="this.form.submit();">
								<option>filter value</option>
								<c:choose>
									<c:when test="${choosethuoctinh.equals('Id Chuyen')}">
										<c:forEach items="${distinct}" var="listItem">
											<option value="${listItem.iDChuyen}"
												<c:if test="${choosevalues.equals(listItem.iDChuyen.toString())==true}">
											selected
										
									</c:if>>${listItem.iDChuyen}</option>
										</c:forEach>

									</c:when>
									<c:when test="${choosethuoctinh.equals('Ngay Di')}">
										<c:forEach items="${distinct}" var="listItem">
											<option value="${listItem.ngayDi}"
												<c:if test="${choosevalues.equals(listItem.ngayDi.toString())==true}">
											selected
										
									</c:if>>${listItem.ngayDi}</option>
										</c:forEach>

									</c:when>
									<c:when test="${choosethuoctinh.equals('Gio Di')}">
										<c:forEach items="${distinct}" var="listItem">
											<option value="${listItem.gioDi}"
												<c:if test="${choosevalues.equals(listItem.gioDi.toString())==true}">
											selected
									</c:if>>${listItem.gioDi}</option>
										</c:forEach>
									</c:when>
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

									<c:when test="${choosethuoctinh.equals('Don Gia')}">
										<c:forEach items="${distinct}" var="listItem">
											<option value="${listItem.donGia}"
												<c:if test="${choosevalues.equals(listItem.donGia)==true}">
											selected
									</c:if>>${listItem.donGia}</option>
										</c:forEach>
									</c:when>
									<c:when test="${choosethuoctinh.equals('Hang Doi')}">
										<c:forEach items="${distinct}" var="listItem">
											<option value="${listItem.hangDoi}"
												<c:if test="${choosevalues.equals(listItem.hangDoi)==true}">
											selected
									</c:if>>${listItem.hangDoi}</option>
										</c:forEach>
									</c:when>

								</c:choose>


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
									<c:when test="${choosethuoctinh2.equals('Id Chuyen')}">
										<c:forEach items="${distinct2}" var="listItem">
											<option value="${listItem.iDChuyen}"
												<c:if test="${choosevalues2.equals(listItem.iDChuyen.toString())==true}">
											selected
										
									</c:if>>${listItem.iDChuyen}</option>
										</c:forEach>

									</c:when>
									<c:when test="${choosethuoctinh2.equals('Ngay Di')}">
										<c:forEach items="${distinct2}" var="listItem">
											<option value="${listItem.ngayDi}"
												<c:if test="${choosevalues2.equals(listItem.ngayDi.toString())==true}">
											selected
										
									</c:if>>${listItem.ngayDi}</option>
										</c:forEach>

									</c:when>
									<c:when test="${choosethuoctinh2.equals('Gio Di')}">
										<c:forEach items="${distinct2}" var="listItem">
											<option value="${listItem.gioDi}"
												<c:if test="${choosevalues2.equals(listItem.gioDi.toString())==true}">
											selected
									</c:if>>${listItem.gioDi}</option>
										</c:forEach>
									</c:when>
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

									<c:when test="${choosethuoctinh2.equals('Don Gia')}">
										<c:forEach items="${distinct2}" var="listItem">
											<option value="${listItem.donGia}"
												<c:if test="${choosevalues2.equals(listItem.donGia)==true}">
											selected
									</c:if>>${listItem.donGia}</option>
										</c:forEach>
									</c:when>
									<c:when test="${choosethuoctinh2.equals('Hang Doi')}">
										<c:forEach items="${distinct2}" var="listItem">
											<option value="${listItem.hangDoi}"
												<c:if test="${choosevalues2.equals(listItem.hangDoi)==true}">
											selected
									</c:if>>${listItem.hangDoi}</option>
										</c:forEach>
									</c:when>

								</c:choose>


						</select>
							</h5></th>
					</form>
				</div>


			</div>
 --%>

			<div id="content">


				<table id="mydataTable" class="table table-striped table-bordered"
					style="width: 100%" style=" overflow-x:auto!important; ">

					<thead>

						<tr>
							<th scope="col" style="color: black;">CMND</th>
							<th scope="col" style="color: black;">Điểm Đi</th>
							<th scope="col" style="color: black;">Điểm Đến</th>
							<th scope="col" style="color: black;">Ngày Đi</th>
							<th scope="col" style="color: black;">Giờ Đi</th>
							<th scope="col" style="color: black;">Giờ Đến</th>
							<th scope="col" style="color: black;">Đơn Giá</th>
							<th scope="col" style="color: black;">Mã Ghế</th>
							<th scope="col" style="color: black;">Hàng Đợi</th>
							<th scope="col" style="color: black;">Status</th>
							<th scope="col" style="color: black;">Ngày Đặt</th>
							<th scope="col" style="color: black;">Chi Tiết</th>
							<th scope="col" style="color: black;">Xóa Vé</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${viewAllTicket}" var="ve">
							<tr>
								<td>${ve.cMND}</td>
								<td>${ve.chuyenDi.tuyenDi.diaDiemDi}</td>
								<td>${ve.chuyenDi.tuyenDi.diaDiemDen}</td>
								<td>${ve.ngayDi}</td>
								<td>${ve.chuyenDi.gioDi}</td>
								<td>${ve.chuyenDi.gioDen}</td>
								<td>${ve.donGia}</td>
								<td>${ve.maGhe}</td>
								<td>${ve.chuyenDi.tuyenDi.hangDoi}</td>
								<td>${ve.status}</td>
								<td>${ve.ngayGioDat}</td>
								<td><span class="table-remove">
										<button type="button" id="buttonRe"
											class="btn btn-danger btn-rounded btn-sm my-0">Chi
											Tiết</button>
								</span></td>
								<td><span class="table-remove">
										<button type="button" id="buttonRe"
											class="btn btn-danger btn-rounded btn-sm my-0">Xóa</button>
								</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>



			<!-- ListUser -->
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
					$('#table').DataTable();
				});
			</script>



			<!-- partial -->
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/data.js"></script>

			<script src="./script.js"></script>
			<!-- End Modal -->






			<footer class="footer"> </footer>
			<script>
				const x = new Date().getFullYear();
				let date = document.getElementById('date');
				date.innerHTML = '&copy; ' + x + date.innerHTML;
			</script>
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap-material-design.min.js"></script>
	<script src="https://unpkg.com/default-passive-events"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chartist JS -->
	<script src="${pageContext.request.contextPath}/assets/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${pageContext.request.contextPath}/assets/js/material-dashboard.js?v=2.1.0"></script>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="${pageContext.request.contextPath}/assets/demo/demo.js"></script>

	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			md.initDashboardPageCharts();

		});
	</script>
	
	<!-- Cua Hau  -->
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