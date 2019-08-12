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

<!-- CSS Just for demo purpose, don't include it in your project -->
<!-- <script>
function myFunction() {
  var x = document.getElementById("content");
  var y = document.getElementById("table");
  var z = document.getElementById("list_users");
  if (x.style.display === "none") {
    x.style.display = "block";
      y.style.display = "none";
      	z.style.display = "none";
  } else if (y.style.display === "none"){
    x.style.display = "none";
     y.style.display = "block";
     z.style.display = "none";
  }
  else{
	  x.style.display = "none";
	     y.style.display = "none";
	     z.style.display = "block";
  }
}
</script> -->
<script type="text/javascript">
	/* $(document).ready(function() {
	 $("#user_profile").on('click', function() {
	 $("#content").show();
	 $("#users").hide(); 
	 });
	 $("#list_users").on('click', function() {
	 $("#content").hide();
	 $("#users").show(); 
	 });
	 }); */
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
</style>
<!-- <script type="text/javascript">
	 $(document).ready(function() {
		 $("#table").on('click','td',function(event) {
			 var t = document.getElementById("table");
			 var a = "";
			 var b = "";
				for (var r = 0; r < t.rows.length; r++) {
				    for (var c = 0; c < t.rows[r].cells.length; c++) {
				    	
				        a = t.rows[1].cells[0].innerHTML;
				        b = t.rows[2].cells[0].innerHTML;
				    }
				}
				alert(a);
				alert(b);
		});
	});
	</script> -->
</head>

<body class="dark-edition">
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="black"
			data-image="${pageContext.request.contextPath}/assets/img/sidebar-3.jpg">
			<div class="logo">
				<a href="#" class="simple-text logo-normal"> Màn hình chính </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item "><a class="nav-link" id="user_profile">
							<i class="material-icons">person</i>
							<p>User Profile</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" id="list_users">
							<i class="material-icons">content_paste</i>
							<p>Users</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						onclick="myFunction();"> <i class="material-icons">library_books</i>
							<p>Typography</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="./icons.html">
							<i class="material-icons">bubble_chart</i>
							<p>Icons</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="./map.html">
							<i class="material-icons">location_ons</i>
							<p>Maps</p>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="myFunction();"> <i class="material-icons">content_paste</i>
							<p>Tuan</p>
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
						<!-- 	<form class="navbar-form">
							<div class="input-group no-border">
								<input type="text" value="" class="form-control"
									placeholder="Search...">
								<button type="submit"
									class="btn btn-default btn-round btn-just-icon">
									<i class="material-icons">search</i>
									<div class="ripple-container"></div>
								</button>
							</div>
						</form> -->

						<ul class="navbar-nav">

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
							<li class="nav-item" style="float: right;"><a
								class="nav-link"> Trương Thái Tuấn <i class="material-icons">person</i>
									<p class="d-lg-none d-md-block"></p>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div id="users" style="">
				<h3 id="insert_name">Insert users</h3>
				<a class="fa fa-plus-square" id="insert" href="#"
					onclick="document.getElementById('modform2').style.display='block';"></a>

				<form id="frmfilter" class="frmfilter" method="POST"
					action="${pageContext.request.contextPath}/DashboardAdmin">
					<div class="filter">
						<label>Lọc</label> <select name="filter" class="txtFrm"
							onchange="this.form.submit();">
							<option value="admin"
								<c:if test="${ choosefilter.compareTo('admin')==0}">
											selected
									</c:if>>Admin</option>
							<option value="khachhang"
								<c:if test="${ choosefilter.compareTo('khachhang')==0}">
											selected
									</c:if>>Khach
								Hang</option>
							<option value="nhanvien"
								<c:if test="${choosefilter.compareTo('nhanvien')==0}">
											selected
									</c:if>>Nhan
								Vien</option>
						</select>
					</div>
				</form>

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

						<c:forEach items="${filter}" var="taikhoan">
							<tbody>
								<tr>
									<td>${taikhoan.email}</td>
									<input type="hidden" value="${taikhoan.email}" name="email">
									<td>${taikhoan.role}</td>
									<td><a class="fa fa-pencil" id="select"
										style="color: white; text-decoration: none; font-size: 15px; font-size: 20px;"
										onclick="document.getElementById('modform').style.display='block';addRowHandlers();"
										style="width:auto;"></a></td>
									<%-- 								<td>&nbsp&nbsp&nbsp<a class="material-icons"
									style="color: white; text-decoration: none; 
									text-align: center;" href="http://localhost:8080/Booking_Bus/DeleteUserServlet?email_delete=${taikhoan.email}">&#xE872;</a>
								</td> --%>
									<td><c:if test="${choosefilter == 'nhanvien'}">
											<a href="infoNhanvien?email=${taikhoan.email}"
												class="btn btn-info">Detail</a>
										</c:if> <c:if test="${choosefilter == 'khachhang'}">
											<a href="infoKhachhang?email=${taikhoan.email}"
												class="btn btn-info">Detail</a>
										</c:if></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</form>
			</div>

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
							name="email_edit"> <label><b>Role</b></label> <input
							type="text" id="role" name="role_edit">
						<button type="submit">Update</button>
						<button
							onclick="document.getElementById('modform').style.display='none'">Cancel</button>
					</div>


				</form>

			</div>
			<!-- partial -->
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/data.js"></script>

			<script src="./script.js"></script>
			<!-- End Modal -->
			<div id="table" style="display: none;">TUAN</div>


			<!-- content Nhân_Viên -->
			<div id="modform2" class="background-modal">
				<form class="modal-content animate"
					action="${pageContext.request.contextPath}/InsertUserNhanVien"
					method="post">
					<div class="close-button">
						<span
							onclick="document.getElementById('modform2').style.display='none'"
							class="close" title="Close Modal">&times;</span>
					</div>
					<h2 style="font-family: Algerian; text-align: center;">Insert
						User</h2>
					<div class="container">
						<label><b>CMND</b></label> <input type="text" id="cmnd"
							name="cmnd_insert" required pattern="^[0-9]*$"> <label><b>Password</b></label>
						<input type="text" id="pass" name="pass_insert"> <label><b>Email</b></label>
						<input type="text" id="email" name="email_insert" required
							pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$">
						<label><b>Họ và tên</b></label> <input type="text" id="hoten"
							name="hoten_insert" required> <label><b>SDT</b></label> <input
							type="text" id="sdt" name="sdt_insert" required> <label><b>Chức
								vụ</b></label> <input type="text" id="chucvu" name="chucvu_insert">
						<label><b>Role</b></label>
						<div class="select">
							<select name="role_insert" id="slct" required>
								<option selected disabled>Choose role option</option>
								<option value="nhanvien">Nhân viên</option>
								<option value="khachhang">Khách hàng</option>
								<option value="admin">Admin</option>
							</select>
						</div>
						<button type="submit">Insert</button>
						<button
							onclick="document.getElementById('modform2').style.display='none'">Cancel</button>
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
		$(document)
				.ready(
						function() {
							$()
									.ready(
											function() {
												$sidebar = $('.sidebar');

												$sidebar_img_container = $sidebar
														.find('.sidebar-background');

												$full_page = $('.full-page');

												$sidebar_responsive = $('body > .navbar-collapse');

												window_width = $(window)
														.width();

												$('.fixed-plugin a')
														.click(
																function(event) {
																	// Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
																	if ($(this)
																			.hasClass(
																					'switch-trigger')) {
																		if (event.stopPropagation) {
																			event
																					.stopPropagation();
																		} else if (window.event) {
																			window.event.cancelBubble = true;
																		}
																	}
																});

												$(
														'.fixed-plugin .active-color span')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-color',
																						new_color);
																	}

																	if ($full_page.length != 0) {
																		$full_page
																				.attr(
																						'filter-color',
																						new_color);
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.attr(
																						'data-color',
																						new_color);
																	}
																});

												$(
														'.fixed-plugin .background-color .badge')
														.click(
																function() {
																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'background-color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-background-color',
																						new_color);
																	}
																});

												$('.fixed-plugin .img-holder')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.parent(
																					'li')
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.parent(
																					'li')
																			.addClass(
																					'active');

																	var new_image = $(
																			this)
																			.find(
																					"img")
																			.attr(
																					'src');

																	if ($sidebar_img_container.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		$sidebar_img_container
																				.fadeOut(
																						'fast',
																						function() {
																							$sidebar_img_container
																									.css(
																											'background-image',
																											'url("'
																													+ new_image
																													+ '")');
																							$sidebar_img_container
																									.fadeIn('fast');
																						});
																	}

																	if ($full_page_background.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$full_page_background
																				.fadeOut(
																						'fast',
																						function() {
																							$full_page_background
																									.css(
																											'background-image',
																											'url("'
																													+ new_image_full_page
																													+ '")');
																							$full_page_background
																									.fadeIn('fast');
																						});
																	}

																	if ($('.switch-sidebar-image input:checked').length == 0) {
																		var new_image = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						"img")
																				.attr(
																						'src');
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$sidebar_img_container
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																		$full_page_background
																				.css(
																						'background-image',
																						'url("'
																								+ new_image_full_page
																								+ '")');
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																	}
																});

												$('.switch-sidebar-image input')
														.change(
																function() {
																	$full_page_background = $('.full-page-background');

																	$input = $(this);

																	if ($input
																			.is(':checked')) {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar_img_container
																					.fadeIn('fast');
																			$sidebar
																					.attr(
																							'data-image',
																							'#');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page_background
																					.fadeIn('fast');
																			$full_page
																					.attr(
																							'data-image',
																							'#');
																		}

																		background_image = true;
																	} else {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar
																					.removeAttr('data-image');
																			$sidebar_img_container
																					.fadeOut('fast');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page
																					.removeAttr(
																							'data-image',
																							'#');
																			$full_page_background
																					.fadeOut('fast');
																		}

																		background_image = false;
																	}
																});

												$('.switch-sidebar-mini input')
														.change(
																function() {
																	$body = $('body');

																	$input = $(this);

																	if (md.misc.sidebar_mini_active == true) {
																		$(
																				'body')
																				.removeClass(
																						'sidebar-mini');
																		md.misc.sidebar_mini_active = false;

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar();

																	} else {

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar(
																						'destroy');

																		setTimeout(
																				function() {
																					$(
																							'body')
																							.addClass(
																									'sidebar-mini');

																					md.misc.sidebar_mini_active = true;
																				},
																				300);
																	}

																	// we simulate the window Resize so the charts will get updated in realtime.
																	var simulateWindowResize = setInterval(
																			function() {
																				window
																						.dispatchEvent(new Event(
																								'resize'));
																			},
																			180);

																	// we stop the simulation of Window Resize after the animations are completed
																	setTimeout(
																			function() {
																				clearInterval(simulateWindowResize);
																			},
																			1000);

																});
											});
						});
	</script>
	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			md.initDashboardPageCharts();

		});
	</script>
</body>

</html>