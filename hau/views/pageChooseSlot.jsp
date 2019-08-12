<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.ResultSet,java.sql.PreparedStatement"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Booking Bus</title>

<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="icon" type="image/png" href="pictures/baner-bus.png" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>

</head>
<body>
	<div id="main">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="content">
			<div id="datve" class="clearfix" data-selected="true"
				data-label-id="0">
				<div class="inner">
					<div class="left_datve">
						<div class="title_datve">BookBus</div>
						<div class="text mota_about">
							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/11.png"
											style="cursor: default; height: 30px; width: 30px">&nbsp;&nbsp;&nbsp;1096
											Kha Vạn Cân, Phường Linh Chiểu, Quận Thủ Đức, TP. Hồ Chí Minh</span></span></span>
							</p>

							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/live-support-yahoo.png"
											style="cursor: default; height: 30px; width: 30px">&nbsp;&nbsp;&nbsp;<ins>077
												374 9328</ins></span></span></span>
							</p>

							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/images.png"
											style="cursor: default; height: 29px; width: 30px;">&nbsp;
											&nbsp;<ins>bookbus1803@gmail.com</ins></span></span></span>
							</p>

							<p>
								<span style="line-height: 2"><span style="color: #000000"><span
										style="font-size: 15px; font-weight: bold;"><img alt=""
											src="https://www.innhanhphuocloctho.vn/hoangnhu/upload/images/w.png"
											style="cursor: default; height: 30px; width: 30px">&nbsp;&nbsp;<ins>www.bookbuscar.com.vn</ins></span></span></span>
							</p>
						</div>
						<div class="img_about">
							<img class="w100" src="img/bookbus.jpg" alt="BookBus">
						</div>
					</div>
					<div class="right_datve">
						<div class="title_datve">Form đặt vé online</div>
						<p class="slogan_dv">Quý khách vui lòng điền đầy đủ thông tin
							vào form để đặt vé xem online. Xin cảm ơn</p>
						<form id="frmDatVe" class="frmDatVe" method="POST">
							<div class="item_dv">
								<c:forEach items="${customer}" var="user">
									<label>Họ và tên:<br> ${user.hoTen}
									</label>
								</c:forEach>
							</div>
							<div class="item_dv">
								<label>Điện thoại</label> <input type="text" class="txtFrm"
									name="dienthoai" required="required"
									pattern="^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$">
							</div>






<form method="POST" id="oke">
							<div class="item_dv">
								<label>Điểm đi</label> <select name="diemdi" class="txtFrm"
									id="diemdi" required="required" data-measuring="true"
									onchange="form.oke.submit();">
									<option value="0">Chọn điểm đi</option>
									<%
									try
									{
										String Query="SELECT DISTINCT DiaDiemDi FROM tuyendi";
										Class.forName("com.mysql.jdbc.Driver").newInstance();
										Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/booking_bus?autoReconnect=true&useSSL=false","root","123456789");
										PreparedStatement ps = conn.prepareStatement(Query);
										ResultSet rs = ps.executeQuery();
										while(rs.next())
										{
											%>
									<option value="<%=rs.getString("DiaDiemDi")%>"
									
									<%
									if(request.getParameter("diemdi")!=null){
										if(rs.getString("DiaDiemDi").equals(request.getParameter("diemdi"))==true)
										{	
											out.print("selected");
										}
									}
									%>
									
									><%=rs.getString("DiaDiemDi")%></option>
									<% 
										}
										
									}
									catch(Exception ex)
									{
										ex.printStackTrace();
									}
									%>

								</select>
							</div>


							<div class="item_dv">
								<label>Điểm đến</label> <select name="diemden" class="txtFrm"
									id="diemden" required="required">
									<option value="0">Chọn điểm đến</option>
									<%
									try
									{
										String query="SELECT * FROM tuyendi where DiaDiemDi=?";
										Class.forName("com.mysql.jdbc.Driver").newInstance();
										Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/booking_bus?autoReconnect=true&useSSL=false","root","123456789");
										PreparedStatement ps = conn.prepareStatement(query);
										ps.setString(1, request.getParameter("diemdi"));
										ResultSet rs = ps.executeQuery();
										while(rs.next())
										{
											%>
									<option value="<%=rs.getString("DiaDienDen")%>"><%=rs.getString("DiaDienDen")%></option>
									<% 
										}
										
									}
									catch(Exception ex)
									{
										ex.printStackTrace();
									}
									%>

								</select>
							</div>
</form>
							<div class="item_dv datefm">
								<label>Ngày đi</label> <input class="txtFrm form_date"
									data-date="" data-date-format="dd/mm/yyyy" size="16"
									type="text" name="ngaydi" value="" required="required"
									id="datepicker" class="hasDatepicker"> <span><i
									class="fa fa-calendar"
									style="font-size: 30px; margin-top: 3px;"></i></span>
							</div>
							<div class="item_dv datefm">
								<label>Giờ đi</label> <input type="text"
									class="txtFrm form_time" data-date="" data-date-format="hh:ii"
									id="giodi" name="giodi" required="required"> <span><i
									class="glyphicon glyphicon-time"
									style="font-size: 30px; margin-top: 4px;"></i></span>
							</div>
							<div class="item_dv">
								<label>Số vé</label> <input type="number" min="0" value="0"
									class="txtFrm" id="sove" name="sove" required="required">
							</div>
							<div class="item_dv">
								<label>Ghi chú</label>
								<textarea name="noidung" id="noidung" rows="4"></textarea>
							</div>
							<div class="item_dv">
								<input type="submit" id="btnDatVe"
									class="btn btn-danger btn-block" value="Đặt vé">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>