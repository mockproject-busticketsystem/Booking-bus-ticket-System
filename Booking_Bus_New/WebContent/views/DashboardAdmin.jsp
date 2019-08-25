<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Dashboard</title>
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
<link href="${pageContext.request.contextPath}/css/css_select.css"
	rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_modal.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#user_profile").on('click', function() {
			$("#info_admin").show();
			$("#users").hide();
		});
		$("#list_users").on('click', function() {6
			$("#info_admin").hide();
			$("#users").show();
		});
	
	});
	
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('#slct').on('change', function (e) {
	    var optionSelected = $("option:selected", this);
	    var valueSelected = this.value;
	    if( valueSelected == "NhanVien"){
	    	 $("#inputChucVu").show();
	    }
	    else
	    {
	    	$("#inputChucVu").hide();
	    }
	});
});
</script>
<style type="text/css">
#content .hidden {
	display: none
}

#users {
	padding-top: 80px;
}

#insert {
	float: right;
	padding-bottom: 20px;
	color: white;
	font-size: 40px;
	padding-right: 20px;
}

#insert_name {
	font-size: 30px;
	padding-right: 20px;
	float: right;
	color: white;
	margin-bottom: 0px;
	margin-top: -1px;
}
#table_length select{
	background-color: #9095A2;
}
#table_length label{
	color:black;
	font-size: 18px;
}
#table_filter label{
	color:black;
	font-size: 18px;
}

@import url(https://fonts.googleapis.com/css?family=Oswald:400);
.navigation {
  width: 100%;
  background-color: black;
}

img {
  width: 30px;
  border-radius: 50px;
  float: left;
}

.logout {
  font-size: .8em;
  font-family: 'Oswald', sans-serif;
	position: relative;
  right: -18px;
  bottom: -4px;
  overflow: hidden;
  letter-spacing: 3px;
  opacity: 0;
  transition: opacity .45s;
  -webkit-transition: opacity .35s;
  
}

.button {
	text-decoration: none;
	float: right;
  padding: 12px;
  margin: 15px;
  color: white;
  width: 25px;
  background-color: black;
  transition: width .35s;
  -webkit-transition: width .35s;
  overflow: hidden
}

.navigation a:hover {
  width: 130px;
  color: yellow;
}

.navigation a:hover .logout{
  opacity: .9;
}

.navigation a {
  text-decoration: none;
  width: 50px;
  border-radius: 30px;
}
.container2 {
	width: 350px;
	
}
.container2 label{
	margin-left: 50px;
	color: black;
}
.container2 input{
	margin-left: 25px;
	color: white;
}
.container2 .select{
	margin-left: 40px;
	border-radius: 30px;

}
.container2 button{
	margin-left: 25px;
	
}
	#table_filter{
	display: none;
	}
	#table{

	}
</style>
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
	var InsertNV = '${success}';
	if(InsertNV == "true")
	{
		alert("Thêm Thành Công!! :)");
	}
	else if(InsertNV == "false")
	{
		alert("Opps...Them Khong Thanh Cong!!"+ '${errorString}' );
	}
});
</script>

</head>

<body class="dark-edition" style="background: #F6F8FA;	width: 100%;;">

	<div class="wrapper">
		<div class="sidebar" data-color="purple" data-background-color="black" style="border-color: transparent;width: 250px;">
			<div class="logo">
				<a href="#" class="simple-text logo-normal"
					style="color: #F8FFFF; font-family: cursive;"> Màn hình
					chính </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
		
					<li class="nav-item "><a class="nav-link" id="user_profile">
							<i class="material-icons" style="color: #F8FFFF;">person</i>
							<p style="color: #F8FFFF;font-family: cursive;font-size: 20px;">Admin Profile</p>
					</a></li>
					
					<li class="nav-item"><a class="nav-link" id="list_users">
							<i class="material-icons" style="color: #F8FFFF;">content_paste</i>
							<p style="color:#F8FFFF;font-family: cursive;font-size: 20px;">Users</p>
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

		<div class="main-panel" >
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top "
				id="navigation-example">
				<div class="container-fluid">
					<div class="navbar-wrapper"></div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation" data-target="#navigation-example">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<div id="search">
							<form class="navbar-form"
								action="${pageContext.request.contextPath}/SearchUserByEmail"
								method="get">
								<div class="input-group no-border">
									<input type="email" value="" class="form-control"
										placeholder="Search Detail..." name="email_search" required>
									<button type="submit"
										class="btn btn-default btn-round btn-just-icon">
										<i class="material-icons">search</i>
										<div class="ripple-container"></div>
									</button>
								</div>
							</form>
						</div>
						<ul class="navbar-nav" >

							<!--  <li class="nav-item dropdown">
                <a class="nav-link" href="javscript:void(0)" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">notifications</i>
                  <span class="notification">5</span>
                  <p class="d-lg-none d-md-block">
                    Some Actions
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="javascript:void(0)">Mike John responded to your email</a>
                  <a class="dropdown-item" href="javascript:void(0)">You have 5 new tasks</a>
                  <a class="dropdown-item" href="javascript:void(0)">You're now friend with Andrew</a>
                  <a class="dropdown-item" href="javascript:void(0)">Another Notification</a>
                  <a class="dropdown-item" href="javascript:void(0)">Another One</a>
                </div>
              </li>-->

							<c:if test="${taikhoan.role == 'Admin'}">
								<li class="nav-item" style="float: right;"><a style="color: #24292E;"
									class="nav-link"> <strong>${admin.hoTen}</strong> <i class="material-icons">person</i>
										<p class="d-lg-none d-md-block"></p>
								</a></li>
							</c:if>
							<li><div class="navigation">
							<a class="button" href="${pageContext.request.contextPath}/DangXuat"><img src="${pageContext.request.contextPath}/img/tuan.jpg">
  							<div class="logout">LOGOUT</div></a>
							</div> </li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<!-- ListUser -->
			<c:if test="${taikhoan.role == 'Admin'}">
				<div id="users">
				<div class = "loc_insert">
				<div class="container" style="max-height: 80px;" >
  <div class="row">
    <div class="col-sm">

    </div>
    <div class="col-sm">
    <form  method="POST" action="${pageContext.request.contextPath}/DashboardAdmin">
							<label style="color: #24292E;font-family: cursive;font-size: 20px;font-weight: bold;">Lọc theo </label> <select name="filter" class="txtFrm"
								onchange="this.form.submit();">
								<option value="Admin"
									<c:if test="${ choosefilter.compareTo('Admin')==0}">
											selected 
									</c:if>>All</option>
								<option value="KhachHang"
									<c:if test="${ choosefilter.compareTo('KhachHang')==0}">
											selected
									</c:if>>Khach
									Hang</option>
								<option value="NhanVien"
									<c:if test="${choosefilter.compareTo('NhanVien')==0}">
											selected
									</c:if>>Nhan
									Vien</option>
							</select>
					</form>
    </div>
    <div class="col-sm">
    <p id="insert_name" style="color: #24292E;font-weight: bold;">Insert users</p>
     <a class="fa fa-plus-square" id="insert" href="#" style="color: #24292E;"
						onclick="document.getElementById('modform2').style.display='block';"></a>
					</div>
    </div>
  </div>
</div>
					
				<form action="${pageContext.request.contextPath}/infoNhanvien"
						method="get" name="frm" style="width:100%;border-color: transparent;">
						<table class="table table-striped table-bordered" id="table"
							border="1"  style="width:100%;border-color: transparent;">
							<thead style="background: #777777;">
								<tr>
									<th scope="col" style="color: white;text-align: center;">Email</th>
									<th scope="col" style="color: white;text-align: center;">Role</th>
									<!-- <th scope="col" style="color: white;text-align: center;">Edit</th> -->
									<th scope="col" style="color: white;text-align: center;">Detail</th>
								</tr>
							</thead>
							<tbody style="background: #DDDDDD;">
							<c:forEach items="${filter}" var="taikhoan">
								
									<c:if test="${taikhoan.role != 'Admin'}">
										<tr>
											<td style="color: black;">${taikhoan.email}</td>
											<input type="hidden" value="${taikhoan.email}" name="email">

											<td  style="color: black;">${taikhoan.role}</td>

											<!-- <td><a class="fa fa-pencil" id="select"
												style="color: black; text-decoration: none; font-size: 15px; font-size: 20px;"
												onclick="document.getElementById('modform').style.display='block';addRowHandlers();"
												style="width:auto;"></a></td> -->
												
											<td><c:if test="${taikhoan.role == 'NhanVien'}">
													<a href="infoNhanvien?email=${taikhoan.email}"
														class="btn btn-info">Detail</a>
												</c:if> <c:if test="${taikhoan.role == 'KhachHang'}">
													<a href="info_UpdateKhachhang?email=${taikhoan.email}"
														class="btn btn-info">Detail</a>
												</c:if> <c:if test="${taikhoan.role == 'Admin'}">
													<c:if test="${taikhoan.role == 'NhanVien'}">
														<a href="infoNhanvien?email=${taikhoan.email}"
															class="btn btn-info">Detail</a>
													</c:if>
													<c:if test="${taikhoan.role == 'KhachHang'}">
														<a href="info_UpdateKhachhang?email=${taikhoan.email}"
															class="btn btn-info">Detail</a>
													</c:if>
												</c:if></td>
										</tr>
									</c:if>
							</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</c:if>
			<!-- ListUser -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready( function () {
    $('#table').DataTable();
} );
    </script>

			<!-- Info Admin  -->
			<div id="info_admin" style="display: none; margin-top: 100px;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8">

							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title">Profile ${admin.hoTen}</h4>
									<p class="card-category">Complete your profile</p>
								</div>
								<div class="card-body">
									<form action = "${pageContext.request.contextPath}/UpdateNhanVienServlet" method="post">
										<div class="row">
											<div class="col-md-3">
												<div class="form-group">
													<label class="bmd-label-floating">CMND</label> <input
														type="text"  value="${admin.cMND}" class="form-control"
														disabled style="text-align: center;background: #202940;color: red;">
														<input type="hidden"  value="${admin.cMND}" name = "CMND">
												</div>
											</div>
												<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Email</label> <input
														type="text" value="${admin.email}" class="form-control" disabled 
														style="text-align: center;background: #202940;color: red;">
															
												</div>
											</div>
											
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Số điện thoại</label> <input
														type="text" value="${admin.sDT}" class="form-control"
														style="text-align: center;background: #202940;" name = "SDT">
												</div>
											</div>
										<div class="col-md-4">
												<div class="form-group">
													<label class="bmd-label-floating">Họ và tên </label> <input
														type="text" value="${admin.hoTen}" class="form-control"
														style="text-align: center;background: #202940;" name = "HoTen">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="bmd-label-floating">Chức vụ</label> <input
														type="text" value="${admin.chucVu}" class="form-control"
														style="text-align: center;background: #202940;"  name = "Chucvu">
												</div>
											</div>
										</div>
										<!-- 	<button type="submit" class="btn btn-primary pull-right">Update
											Profile</button> -->
										<div class="clearfix"></div>
										<button type="submit" onclick="return confirm('Are you sure you want to Update Information Admin?')" style="background: #8A34A0;">Update</button>
									</form>
								</div>

							</div>

						</div>
						<div class="col-md-4">
							<div class="card card-profile">
								<div class="card-avatar">
									<a href="#pablo" target="_blank"> <img class="img"
										src="${pageContext.request.contextPath}/img/tuan.jpg" />
									</a>
								</div>
								<div class="card-body">
									<h5 class="card-category">CEO</h5>
									<h4 class="card-title">${admin.hoTen}</h4>
									
										
								</div>
							</div>
						</div>
					</div>
						
				</div>
			</div>
			<!-- Info Admin  -->

			<!-- Modal -->

			<div id="modform" class="background-modal">
				<form class="modal-content animate"
					action="${pageContext.request.contextPath}/UpdateServlet"
					method="post">
					<div class="close-button">
						<span
							onclick="document.getElementById('modform').style.display='none'"
							class="close" title="Close Modal">&times;</span>
					</div>
					<h2 style="font-family: Algerian; text-align: center;">Update
						Profile</h2>
					<div class="container">
						<label><b>Email</b></label> <input type="text" id="email"
							name="email_edit" disabled> 
							<label><b>Role</b></label>
							 <input
							type="text" id="role" name="role_edit">
					<button type="submit" style=" border-radius: 30px;">Update</button>
				</form>
				<a class="btn btn-secondary" style="width: 365px;
				height: 50px;background: #4a4f54;color: white;  border-radius: 30px; "
				 onclick="document.getElementById('modform').style.display='none';document.getElementById('users').style.display='block';">Cancel</a>
					</div>
				<!-- Modal -->
			</div>


			<!-- partial -->
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/data.js"></script>

			<script src="./script.js"></script>
			<!-- End Modal -->
	


			<!-- content Nhân_Viên -->
			<div id="modform2" class="background-modal">
				<form class="modal-content animate" action="${pageContext.request.contextPath}/InsertUserNhanVien" method="post">
					<div class="close-button">
						<span
							onclick="document.getElementById('modform2').style.display='none'"
							class="close" title="Close Modal">&times;</span>
					</div>
					<h2 style="font-family: Algerian; text-align: center;">Insert
						User</h2>
					<div class="container2">
						<label ><b>CMND</b></label> 
						<input  style="background: #9095A2;" type="text" id="cmnd" name="cmnd_insert" required pattern="[0-9]*.{9,11}">
						 <label><b>Email</b></label>
						<input  style="background: #9095A2;" type="text" id="email" name="email_insert" required
							pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$">
						<label><b>Họ và tên</b></label>
						 <input  style="background: #9095A2;" type="text" id="hoten" name="hoten_insert" required>
						  <label><b>SDT</b></label> 
						  <input  style="background: #9095A2;" type="text" id="sdt" name="sdt_insert" pattern="[0-9]*.{10,11}" required> 
						<label><b>Password</b></label>
						<input  style="background: #9095A2;" type="password" id="pass" name="pass_insert" pattern=".{4,}">
						<label><b>Role</b></label>
						<div class="select">
							<select name="role_insert" id="slct" required>
								<option selected disabled>Choose role option</option>
								<option value="NhanVien">Nhân viên</option>
								<option value="KhachHang">Khách hàng</option>
								<option value="Admin">Admin</option>
							</select>
						</div>
						<div id="inputChucVu" style="display:none;">
						<label><b>Chức vụ</b></label>
						    <input  style="background: #9095A2;" type="text" id="chucvu" name="chucvu_insert">
						</div>
						<button type="submit">Insert</button>
						<button
							onclick="document.getElementById('modform2').style.display='none';">Cancel</button>
					</div>
				</form>

			</div>
			<!-- content Nhân_Viên-->



			<footer class="footer"> </footer>
			<script>
				const x = new Date().getFullYear();
				let date = document.getElementById('date');
				date.innerHTML = '&copy; ' + x + date.innerHTML;
			</script>
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="../assets/js/core/jquery.min.js"></script>
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap-material-design.min.js"></script>
	<script src="https://unpkg.com/default-passive-events"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chartist JS -->
	<script src="../assets/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="../assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/demo/demo.js"></script>

	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			md.initDashboardPageCharts();
		});
	</script>
</body>

</html>