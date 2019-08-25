<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.ResultSet,java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Nhân Viên</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nhanvien1.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/script.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style_ghengoi.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Mở dòng này thì show datepicker mà ko load dữ liệu, đóng thì ko sử dụng được datepicker @@ -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js"></script>
<style type="text/css">
#head1 .logo1 {
	width: 85%;
	floaf: left;
	background: url("${pageContext.request.contextPath}/img/logo1.png");
	background-repeat: no-repeat;
	margin-top: 20px;
	margin-left: 90px;
}

#head1 .logo1 p {
	font-family: TimeNewRoman;
	color: blue;
	position: relative;
	font-weight: bold;
	font-size: 48px;
	text-align: center;
	margin-right: 80px;
}

.right2 input {
	border-radius: 20px;
	width: 200px;
	font-size: 23px;
	color: black;
}

.right input {
	border-radius: 20px;
	width: 200px;
	font-size: 23px;
	color: black;
}

.all_ghe {
	float: left;
	width: 600px;
	margin-left: 60px;
}

.right_xemghe {
	float: right;
	margin-top: -20px;
	margin-right: 10px;
}

#main_xemghe {
	position: fixed;
	width: 87.4%;
	margin-left: 11.38%;
	margin-top: -12px;
}
#datepicker:hover{
 	background: white;
}
</style>

<script type="text/javascript">
jQuery.noConflict();
jQuery(document).ready(function ($) {
	$("#datepicker").datepicker({ 
		
		dateFormat: 'yy-mm-dd'
	});
});
</script>
<body>

	<div id=main2>
					<div class=top>
					<img src="img/icon_nhanvien.png"  height="62" width="62">
				<h1 style="margin-top:0px;font-size:40px;font-weight:550;">Nhân Viên Quản Lý</h1>
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

	<div id="main_head" ><div id=head1 >
				<div class=logo1>
						<p>Nhân viên quản lý</p>
				</div>
</div></div>

	<div id="main_xemghe">
	<div id="margin"></div>
		<div id="content"
			style="height: 600px; margin-left: 50px;">
			<div id="datve" class="clearfix" data-selected="true"
				data-label-id="0"
				style=" background: url(${pageContext.request.contextPath}/img/bgdatve.png);height:650px;">
				<div class="inner">
					<div class="all_ghe">
						<div class="title_datve" style="text-align: center;">Form
							Điền Thông Tin Cần Để xem ghế sẵn có</div>
						<p class="slogan_dv">Nhân viên vui lòng điền đầy đủ thông tin
							vào form để xem ghế có sẵn. Xin cảm ơn.</p>

						<form id="frmDatVe" class="frmDatVe" method="POST"
							action="${pageContext.request.contextPath}/viewAllSeatAvailableEmploy">
							<!-- Code diem di: Huyen -->
							<div class="item_dv">
								<label>Điểm đi</label> <select name="diemdi" class="txtFrm"
									id="diemdi" required="required " data-measuring="true">
									<option value="0">Chon Diem Di</option>
									<c:forEach var="item" items="${arrayDiemDi}">
										<option value="${item}">${item}</option>
									</c:forEach>
								</select>
							</div>
							<!-- Het diem di -->
							<!-- Code diem den -->
							<div class="item_dv">
								<label>Điểm đến</label> <select name="diemden" class="txtFrm"
									id="diemden" required="required" data-measuring="true">
									<option value="0">Chon Diem Den</option>
								</select>
							</div>
							<!-- Het diem den -->
							<!-- Code Time -->
							<div class="item_dv datefm" style="margin-left: 10px;">
								<label>Giờ đi</label> <select name="giodi" id="giodi"
									class="txtFrm" required="required" data-date-format="hh:ii">
									<option value="">Chọn giờ đi</option>
								</select> <span><i class="glyphicon glyphicon-time"
									style="font-size: 30px; margin-top: 4px; margin-right: 15px;"></i></span>
							</div>
							<!-- Het Time -->
							<!-- Ngay Di -->
							<div class="item_dv datefm">

								<label>Ngày đi</label> 
								
								<input class="txtFrm form_date"
									data-date="" data-date-format="dd/mm/yyyy" size="16"
									type="text" name="ngaydi" value="" required="" id="datepicker"
									class="hasDatepicker" readonly> <span><i
									class="fa fa-calendar"
									style="font-size: 30px; margin-top: 3px;"></i></span>
							</div>
							<br> <br>
							<div class="item_dv">
								<input type="submit" id="btnXemGhe"
									class="btn btn-danger btn-block" value="Xem Ghế"
									style="margin-left: 100px; margin-top: 25px;">
							</div>
						</form>
						</br> </br> </br> </br> </br> </br> </br>


					</div>

					<div class="right_xemghe" style=" width: 460px;">
						<div class="plane" id="plane" style="width: 500px;">
							<br> <br> <br>
							<div class="status_xe" style="margin-left: 50px;">
								<ul style="list-style-type: none;">
									<div class="ghedangchon">
										<div class="ml5"
											style="display: inline-block; width: 30px; height: 15px; border: 1px solid #A9A9A9; background-color: #006400;"></div>
										<span>Ghế đang chọn </span>
									</div>
									<br>
									<div class="ghekhongban" style="margin-top: -41px;">
										<div class="ml5"
											style="display: inline-block; width: 30px; height: 15px; border: 1px solid #A9A9A9; background-color: #dddddd; margin-left: 120px;"></div>
										<span>Ghế không bán</span>
									</div>
									<br>
									<div class="ghechuachon"
										style="margin-top: -41px; margin-left: 83px;">
										<div class="ml5"
											style="display: inline-block; width: 30px; height: 15px; border: 1px solid #A9A9A9; background-color: white; margin-left: 185px;"></div>
										<span>Ghế chưa chọn</span>
									</div>
								</ul>
							</div>

							<div class="exit exit--front fuselage"
								style="width: 440px; margin-left: 58px; border-top: 3px solid #333333"></div>
							<ol class="cabin fuselage"
								style="width: 440px; margin-left: 58px;">
								<label style="margin-left: 80px;">Floor2</label>
								<img src="${pageContext.request.contextPath}/img/banhlai.png"
									style="margin-top: -60px; margin-left: 115px; width: 50px;">
								<label>Floor1</label>
								<li class="row row--1">
									<ol class="seats" type="A">

										<li class="seat"><input type="checkbox" id="1A"
											value="1A" name="check" class="checkbox" onclick="array();" />
											<label for="1A">1A</label></li>

										<li class="seat"><input type="checkbox" id="1B"
											value="1B" name="check" class="checkbox" onclick="array();" />
											<label for="1B">1B</label></li>
										<li class="seat"><input type="checkbox" id="1C"
											value="1C" name="check" class="checkbox" onclick="array();" />
											<label for="1C">1C</label></li>
										<li class="seat"><input type="checkbox" id="1D"
											value="1D" name="check" class="checkbox" onclick="array();" />
											<label for="1D">1D</label> <input type="checkbox" id="1E"
											value="1E" name="check" class="checkbox" onclick="array();" />
											<label for="1E">1E</label> <input type="checkbox" id="1F"
											value="1F" name="check" class="checkbox" onclick="array();" />
											<label for="1F">1F</label></li>



									</ol>
								</li>
								<li class="row row--2">
									<ol class="seats" type="A">

										<li class="seat"><input type="checkbox" id="2A"
											value="2A" name="check" class="checkbox" onclick="array();" />
											<label for="2A">2A</label></li>

										<li class="seat"><input type="checkbox" id="2B"
											value="2B" name="check" class="checkbox" onclick="array();" />
											<label for="2B">2B</label></li>
										<li class="seat"><input type="checkbox" id="2C"
											value="2C" name="check" class="checkbox" onclick="array();" />
											<label for="2C">2C</label></li>

										<li class="seat"><input type="checkbox" id="2D"
											value="2D" name="check" class="checkbox" onclick="array();" />
											<label for="2D">2D</label><input type="checkbox" id="2E"
											value="2E" name="check" class="checkbox" onclick="array();" />
											<label for="2E">2E</label><input type="checkbox" id="2F"
											value="2F" name="check" class="checkbox" onclick="array();" />
											<label for="2F">2F</label></li>
									</ol>
								</li>

								<li class="row row--3">
									<ol class="seats" type="A">

										<li class="seat"><input type="checkbox" id="3A"
											value="3A" name="check" class="checkbox" onclick="array();" />
											<label for="3A">3A</label></li>

										<li class="seat"><input type="checkbox" id="3B"
											value="3B" name="check" class="checkbox" onclick="array();" />
											<label for="3B">3B</label></li>
										<li class="seat"><input type="checkbox" id="3C"
											value="3C" name="check" class="checkbox" onclick="array();" />
											<label for="3C">3C</label></li>

										<li class="seat"><input type="checkbox" id="3D"
											value="3D" name="check" class="checkbox" onclick="array();" />
											<label for="3D">3D</label><input type="checkbox" id="3E"
											value="3E" name="check" class="checkbox" onclick="array();" />
											<label for="3E">3E</label><input type="checkbox" id="3F"
											value="3F" name="check" class="checkbox" onclick="array();" />
											<label for="3F">3F</label></li>

									</ol>
								</li>

								<li class="row row--4">
									<ol class="seats" type="A">

										<li class="seat"><input type="checkbox" id="4A"
											value="4A" name="check" class="checkbox" onclick="array();" />
											<label for="4A">4A</label></li>

										<li class="seat"><input type="checkbox" id="4B"
											value="4B" name="check" class="checkbox" onclick="array();" />
											<label for="4B">4B</label></li>
										<li class="seat"><input type="checkbox" id="4C"
											value="4C" name="check" class="checkbox" onclick="array();" />
											<label for="4C">4C</label></li>

										<li class="seat"><input type="checkbox" id="4D"
											value="4D" name="check" class="checkbox" onclick="array();" />
											<label for="4D">4D</label> <input type="checkbox" id="4E"
											value="4E" name="check" class="checkbox" onclick="array();" />
											<label for="4E">4E</label> <input type="checkbox" id="4F"
											value="4F" name="check" class="checkbox" onclick="array();" />
											<label for="4F">4F</label></li>

										<li class="seat"></li>

									</ol>
								</li>

								<li class="row row--5">
									<ol class="seats" type="A">

										<li class="seat"><input type="checkbox" id="5A"
											value="5A" name="check" class="checkbox" onclick="array();" />
											<label for="5A">5A</label></li>

										<!--      <li class="seat"><input type="checkbox" id="5B" value="5B"
            name="check" class="checkbox" onclick="array();" /> <label
            for="5B">5B</label></li> -->
										<li class="seat"><input type="checkbox" id="5B"
											value="5B" name="check" class="checkbox" onclick="array();" />
											<label for="5B">5B</label></li>
										<li class="seat"><input type="checkbox" id="5C"
											value="5C" name="check" class="checkbox" onclick="array();" />
											<label for="5C">5C</label></li>

										<li class="seat"><input type="checkbox" id="5D"
											value="5D" name="check" class="checkbox" onclick="array();" /><label
											for="5D">5D</label> <input type="checkbox" id="5E" value="5E"
											name="check" class="checkbox" onclick="array();" /><label
											for="5E">5E</label> <input type="checkbox" id="5F" value="5F"
											name="check" class="checkbox" onclick="array();" /> <label
											for="5F">5F</label></li>
									</ol>
								</li>

							</ol>
							<div class="end_bus"
								style="margin-top: 0.8px; margin-left: 58px; width: 441px;"></div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
$(document).ready(function () {
    $("#diemden").on("change", function () {
    	var diemdi = $("#diemdi").val();// lay diem di
        var diemden = $("#diemden").val();//id of country select box of index.jsp page;
            $.ajax({
                url: "LoadThoiGian",//your jsp page name
                data: {diemdi : diemdi,
    				diemden : diemden},//sending request to state.jsp page.
                method: "POST",//HTTP method.
                success: function (data)
                {
                    $("#giodi").html(data);//output or response will display in state select box.
                },
                error : function(jqXHR, exception) {
    				console.log('Error occured!!');
    			}
            });
    });
});
$(document).ready(function () {
    $("#diemdi").on("change", function () {
        var diemdi = $("#diemdi").val();
        //id of country select box of index.jsp page;
            $.ajax({
                url: "loadDiemDen",//your jsp page name
                data: {diemdi: diemdi},//sending request to state.jsp page.
                method: "POST",//HTTP method.
                success: function (data)
                {
                    $("#diemden").html(data);//output or response will display in state select box.
                },
                error : function(jqXHR, exception) {
    				console.log('Error occured!!');
    			}
            });
    });
});
$(document).ready(function () {
	var submitSuccess;
	$("#frmDatVe").submit(function(e) {
	    e.preventDefault(); // avoid to execute the actual submit of the form.
	    var form = $(this);
	    var url = form.attr('action');
	    var diemdi = $("#diemdi").val();// lay diem di
	    var diemden = $("#diemden").val();//id of country select box of index.jsp page;
	    var ngaydi = $("#datepicker").val();
	    var gio = $("#giodi").val();
	    if (diemdi === ""||diemdi===null||diemden === ""||diemden===null||ngaydi === ""||ngaydi===null||gio === ""||gio===null)
	    {
	       alert("Mời bạn nhập đầy đủ thông tin");
	    }
	    else
	    {
	    $.ajax({
	           type: "Post",
	           url: url,
	          dataType: "json",
	          data: form.serialize(), // serializes the form's elements.
	           success: function (data)
		                {
	        	 $('input[type=checkbox]').attr('disabled',false);
		                		  $.each(data, function(index, product) { 
		                			 $('input:checkbox[value=' + product.maGhe + ']').attr('disabled', true);

		                		  });
		                		
		                		
		                },
		       error : function(jqXHR, exception) {
		    				console.log('Error occured!!');
		    			}
	          
	         });
	    }


	});
});
</script>

</body>

</html>