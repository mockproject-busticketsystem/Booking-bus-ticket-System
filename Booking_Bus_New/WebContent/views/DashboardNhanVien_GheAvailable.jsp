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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nhanvien1.css">
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Mở dòng này thì show datepicker mà ko load dữ liệu, đóng thì ko sử dụng được datepicker @@ -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

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
	margin-left: 150px;
}
#head1 .logo1 p {
	font-family: TimeNewRoman;
	color: blue;
	position: relative;
	font-weight: bold;
	font-size: 48px;
	text-align: center;
	margin-right: 200px;
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
  </style>

  <script type="text/javascript">
jQuery.noConflict();
jQuery(document).ready(function ($) {
	$("#datepicker").datepicker({ 
		minDate:1,
		dateFormat: 'yy-mm-dd'
	});
});
</script>
<body>
    <div id="main_top">
        <div id="main2">
            <div class=top>
                <h4>Nhân Viên Quản Lý</h4>
                <hr class=new4>
                <div class=right>
					<form method="POST"
						action="${pageContext.request.contextPath}/LoadVe">

						<h4>
							<input type="submit" value="All Vé">
					</form>
					</h4>
				</div>
				<div class=right2>
					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien">
						<input type="hidden" name="idchuyen" value=${idchuyen}></input> <input
							type="hidden" name="ngaydi" value=${ngaydi}></input>
						<h4>
							<input type="submit" value="All Chuyến">
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
        <div id="main">
            <div id=head1>
                <div class=logo1>
                    <p>Nhân viên quản lý</p>
                </div>

            </div>
            <div id="users">

              <div class="all_ghe">
            <div class="title_datve" style="text-align: center;">Form Điền Thông Tin Cần Để xem ghế sẵn có</div>
            <p class="slogan_dv">Nhân viên vui lòng điền đầy đủ thông tin
              vào form để xem ghế có sẵn. Xin cảm ơn.</p>

            <form id="frmDatVe" class="frmDatVe" method="POST" 
              action="${pageContext.request.contextPath}/ViewSeatAvalable">
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
              <div class="item_dv datefm">
                <label>Giờ đi</label> <select name="giodi" id="giodi"
                  class="txtFrm" required="required" data-date-format="hh:ii">
                  <option value="">Chọn giờ đi</option>
                </select> <span><i class="glyphicon glyphicon-time"
                  style="font-size: 30px; margin-top: 4px; margin-right: 15px;"></i></span>
              </div>
              <!-- Het Time -->
              <!-- Ngay Di -->
              <div class="item_dv datefm">

                <label>Ngày đi</label> <input class="txtFrm form_date"
                  data-date="" data-date-format="dd/mm/yyyy" size="16"
                  type="text" name="ngaydi" value="" required="" id="datepicker"
                  class="hasDatepicker"> <span><i
                  class="fa fa-calendar"
                  style="font-size: 30px; margin-top: 3px;"></i></span>
              </div>
              <br> <br>
              <div class="item_dv">
                <input type="submit" id="btnDatVe"
                  class="btn btn-danger btn-block" value="Xem Ghế"
                  style="margin-left: 250px;">
              </div>
            </form>
            </br> </br> </br> </br> </br> </br> </br>


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

</script>
</body>

</html>