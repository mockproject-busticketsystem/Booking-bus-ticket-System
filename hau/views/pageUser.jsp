<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.ResultSet,java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Booking Bus</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer2.css">

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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/script.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div id="main">
		<jsp:include page="header2.jsp"></jsp:include>
		<div id="content">
			<div id="datve" class="clearfix" data-selected="true"
				data-label-id="0"
				style=" background: url(${pageContext.request.contextPath}/img/bgdatve.png);">
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
							<img class="w100"
								src="${pageContext.request.contextPath}/img/bookbus.jpg"
								alt="BookBus">
						</div>
					</div>
					<div class="right_datve">
						<div class="title_datve">Form đặt vé online</div>
						<p class="slogan_dv">Quý khách vui lòng điền đầy đủ thông tin
							vào form để đặt vé xem online. Xin cảm ơn</p>


						<form id="frmDatVe" class="frmDatVe" method="POST"action="${pageContext.request.contextPath}/khachhang">
							<div class="item_dv">
								<label>Điểm đi</label> <select name="diemdi" class="txtFrm"
									id="diemdi" required="required" data-measuring="true"
									onchange="this.form.submit();">
									<option value="0">Chọn điểm đi</option>
									 <c:forEach items="${diaDiemDi}" var="listItem">
									<option value="${listItem.diaDiemDi}" 
									<c:if test="${chonDiemDi!=null && listItem.diaDiemDi.equals(chonDiemDi)==true}">
											selected
									</c:if>


									>${listItem.diaDiemDi}</option>
									</c:forEach>
								</select>
							</div>
							<div class="item_dv">
								<label>Điểm đến</label> <select name="diemden" class="txtFrm"
									id="diemden" required="required "
									onchange="this.form.submit();">
									<option value="0">Chọn điểm đến</option>
										 <c:forEach items="${diaDiemDen}" var="listItem">
									<option value="${listItem.diaDiemDen}"
										<c:if test="${chonDiemDen!=null && listItem.diaDiemDen.equals(chonDiemDen)==true}">
											selected
									</c:if>
									>${listItem.diaDiemDen}</option>
									</c:forEach>

								</select>

							</div>






						</form>

						</br>
						</br> </br>
						</br> </br> </br>
						</br>

						<form id="frmDatVe" class="frmDatVe" method="POST" 
							action="${pageContext.request.contextPath}/idtuyen">

							<div class="item_dv datefm">

								<label>Ngày đi</label> <input class="txtFrm form_date"
									data-date="" data-date-format="dd/mm/yyyy" size="16"
									type="text" name="ngaydi" value="" required="" id="datepicker"
									class="hasDatepicker"> <span><i
									class="fa fa-calendar"
									style="font-size: 30px; margin-top: 3px;"></i></span>
							</div>
							<div class="item_dv datefm">
								<label>Giờ đi</label> <select name="giodi" id="giodi"
									class="txtFrm" required="required" data-date-format="hh:ii">
									<option value="">Chọn giờ đi</option>
									<option value="7:00">7:00</option>
									<option value="11:00">11:00</option>
									<option value="18:00">18:00</option>
									<option value="19:00">19:00</option>
									<option value="20:00">20:00</option>
									<option value="21:00">21:00</option>
								</select> <span><i class="glyphicon glyphicon-time"
									style="font-size: 30px; margin-top: 4px; margin-right: 15px;"></i></span>
							</div>







							</br>
							</br>
							</br>
							</br>
							</br>
							</br>  <input type="text" required name="di"
								value="<%= request.getParameter("diemdi")%>"> </br>
							<input type="text" required name="den"
								value="<%=request.getParameter("diemden")%>"> </br>
							<div class="item_dv">
								Gia : <input type="text" required name="gia" id="gia" disabled
									value=<%=request.getAttribute("dongia")%>>
							


							</div>
							<br> <br>
							<div class="item_dv">
								<input  type="submit" id="btnDatVe"
									class="btn btn-danger btn-block" value="Đặt vé"
									style="margin-left: 250px;" >
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
		<div class="content_main">
			<div class="box_sanpham">
				<div class="name_sanpham">
					<a title="TUYẾN TP.VŨNG TÀU - TP.HCM" itemprop="url">
						<h2 itemprop="name">TUYẾN TP.HCM - TP.VŨNG TÀU</h2>
					</a>
				</div>
				<div class="info_sanpham clearfix">
					<div class="info">
						<p>
							<strong>Loại xe : </strong>xe VIP Limousine 9 chỗ
						</p>

						<p>
							Hotline: <strong>&nbsp;0889.200.200 bấm phím 1</strong>
						</p>

						<p>
							<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								0963.200.200</strong>
						</p>

						<p>
							<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								0901.200.200&nbsp;</strong>
						</p>

						<p>Thời gian: 3&nbsp;tiếng/chuyến</p>

						<p>Khởi hành : từ 5h đến 18h tối</p>

						<p>Giá vé: 350.000đ/1 hành khách</p>
					</div>
					<div class="img_sanpham">
						<a title="TUYẾN TP.HCM - TP.VŨNG TÀU" itemprop="url"> <img
							src="${pageContext.request.contextPath}/img/xe1.jpg"
							class="w100 trans03">
						</a>
					</div>
				</div>
			</div>
			<div class="box_sanpham">
				<div class="name_sanpham">
					<a title="TUYẾN TP.HCM - TP.NHA TRANG" itemprop="url">
						<h2 itemprop="name">TUYẾN TP.HCM - TP.NHA TRANG</h2>
					</a>
				</div>
				<div class="info_sanpham clearfix">
					<div class="info">
						<p>Loại xe : Xe thường 16 chỗ.</p>

						<p>
							HOTLINE: <strong>0889.200.200 bấm phím 1</strong>
						</p>

						<p>
							<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; 0901.200.200</strong>
						</p>

						<p>
							<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; 0909.200.200&nbsp;</strong>
						</p>

						<p>Thời gian :8&nbsp;tiếng/ 1 chuyến</p>

						<p>Khởi hành:&nbsp;từ 04h đến 18h tối</p>

						<p>Giá vé: 250.000 - 280.000đ/ hành khách</p>
					</div>
					<div class="img_sanpham">
						<a title="TUYẾN TP.HCM - TP.ĐÀ LẠT" itemprop="url"> <img
							src="${pageContext.request.contextPath}/img/xe2.jpg"
							alt="TUYẾN TP.HCM - TP.ĐÀ LẠT" class="w100 trans03">
						</a>
					</div>
				</div>
			</div>
			<div class="box_sanpham">
				<div class="name_sanpham">
					<a title="TỪ TP.HCM - BX.ĐÀ NẴNG" itemprop="url">
						<h2 itemprop="name">TỪ TP.HCM - BX.ĐÀ NẴNG</h2>
					</a>
				</div>
				<div class="info_sanpham clearfix">
					<div class="info">
						<p>LOẠI XE THƯỜNG MIỀN ĐÔNG</p>

						<p>
							&nbsp;HOTLINE: <strong>0979.200.200</strong>
						</p>

						<p>
							<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp;0907.200.200</strong>
						</p>

						<p>
							<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp;0889.200.200 bấm phím 2</strong>
						</p>

						<p>Thời gian Khởi hành : 04h đến 18h tối</p>

						<p>
							Giá vé: 110.000đ/1 hành khách<br> &#8203;
						</p>
					</div>
					<div class="img_sanpham">
						<a title="TỪ TP.VŨNG TÀU - BX.MIỀN ĐÔNG" itemprop="url"> <img
							src="${pageContext.request.contextPath}/img/bookbus.jpg"
							alt="TỪ TP.VŨNG TÀU - BX.MIỀN ĐÔNG" class="w100 trans03">
						</a>
					</div>
				</div>
			</div>
			<div class="box_sanpham">
				<div class="name_sanpham">
					<a title="TP.NHA TRANG <-> BX.MIỀN ĐÔNG" itemprop="url">
						<h2 itemprop="name">TP.NHA TRANG &lt;-&gt; BX.MIỀN ĐÔNG</h2>
					</a>
				</div>
				<div class="info_sanpham clearfix">
					<div class="info">
						<p>
							<strong>LOẠI XE THƯỜNG NHA TRANG</strong>
						</p>

						<p>
							Hotline :&nbsp; &nbsp;<strong>0889.200.200 bấm phím 3</strong>
						</p>

						<p>
							<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; 0901.250.000</strong>
						</p>

						<p>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>0907.200.200</strong>
						</p>

						<p>Thời gian :30 phút/1 chuyến</p>

						<p>Khởi hành :&nbsp;&nbsp;từ 04h đến 17h30 tối</p>

						<p>Giá vé: 110.000đ</p>

						<p>&nbsp;</p>

						<p>
							<strong>LOẠI XE VIP NHA TRANG &lt;-&gt; TP.HCM</strong>
						</p>

						<p>
							Hotline tại TT.Long Hải:&nbsp;<strong>0901.200.200</strong>
						</p>

						<p>
							<strong>02543.661.661&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp;02543.661.662&nbsp;</strong>
						</p>

						<p>
							<strong>02543.661.663</strong>
						</p>

						<p>
							<strong>0889.200.200 bấm phím 3</strong>
						</p>


						<p>
							Hotline tại&nbsp; TP.HCM: <strong>0889.200.200 bấm phím
								5</strong>
						</p>

						<p>
							<strong>0962.200.20&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp;0931.200.200</strong>&nbsp; &nbsp; &nbsp;
							&nbsp;
						</p>

						<p>Thời gian :30 phút/1 chuyến</p>

						<p>Khởi hành :&nbsp;&nbsp;từ 05h đến 17h30 tối</p>

						<p>Giá vé: 160&nbsp;000đ</p>

						<p>&nbsp;</p>
					</div>
					<div class="img_sanpham">
						<a title="BẾN XE LONG ĐIỀN <-> BX.MIỀN ĐÔNG" itemprop="url"> <img
							src="${pageContext.request.contextPath}/img/xe3.jpg"
							alt="BẾN XE LONG ĐIỀN <-> BX.MIỀN ĐÔNG" class="w100 trans03">
						</a>
					</div>
				</div>
			</div>
		</div>
		<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 footer_col">
					<div id="img">
						<img src="${pageContext.request.contextPath}/img/logo_bus.png">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 footer_col">
					<h3 class="footer_title">ABOUT</h3>
					<ul class="footer_linklists">
						<li><a href="#" title="Về Chúng Tôi">Về Chúng Tôi</a></li>
						<li><a href="#">Các chuyến xe</a></li>
						<li><a href="#blog" tile="Blog">Blog</a></li>
						<li><a href="#" title="Cửa Hàng">Cửa Hàng</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 footer_col">
					<div class="hotline_footer">
						<h3 class="footer_title">Always-on Support</h3>
						<p>Support 02871 087 088 (07:00-21:00)</p>
					</div>
					<div class="address_footer">
						<h3 class="footer_title">Address</h3>
						<p>1096 Kha Van Can, Linh Chieu, Quan Thu Duc Ho Chi Minh,
							Vietnam</p>
						<p>077 374 9328</p>
						<p>bookbus1803@gmail.com</p>
					</div>
				</div>
				<ul class="fl social" style="list-style-type: none;">
					<li><strong>Follow us</strong></li>
					<li><a href="https://in.linkedin.com/company/book-bus-asia"
						class="fa fa-linkedin-square" title="linkdin" target="_blank"
						style="font-size: 24px; color: white;"></a>&nbsp&nbsp <a
						href="https://www.facebook.com/www.bookbus.asia/"
						class="fa fa-facebook-square" target="_blank"
						style="font-size: 24px; color: white;"></a>&nbsp&nbsp <a
						href="https://twitter.com/bookbusasia" class="fa fa-twitter"
						target="_blank" style="font-size: 24px; color: white;"></a>&nbsp&nbsp
						<a href="https://plus.google.com/u/0/106337264178239365499/posts"
						class="fa fa-google-plus-square" target="_blank"
						style="font-size: 24px; color: white;"></a>&nbsp&nbsp <a
						href="https://in.pinterest.com/asiabookbus/"
						class=" fa fa-pinterest-square" target="_blank"
						style="font-size: 24px; color: white;"></a>&nbsp&nbsp <a
						href="https://www.instagram.com/bookbusasia/"
						class="fa fa-instagram" target="_blank"
						style="font-size: 24px; color: white;"></a>&nbsp&nbsp</li>
					<li class="partners"><strong>Our Payments Partner</strong> <figure>
						<br>
						<img src="https://bookbus.asia:443/img/cc-avenue.png"
							alt="cc-avenue"> </figure> <br> <br> <br> <span
						class="bbus_cmnsp card" id="icon_pay"> <i
							class="fa fa-cc-discover"
							style="font-size: 24px; color: #FFA500;"></i>&nbsp&nbsp <i
							class=" fa fa-cc-paypal" style="font-size: 24px; color: #7CFC00;"></i>&nbsp&nbsp
							<i class="fa fa-cc-visa" style="font-size: 24px; color: #1E90FF;"></i>&nbsp&nbsp
							<i class="fa fa-cc-jcb" style="font-size: 24px; color: #32CD32;"></i>&nbsp&nbsp
							<i class="fa fa-cc-mastercard"
							style="font-size: 24px; color: #BA55D3;"></i>&nbsp&nbsp
					</span></li>
				</ul>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div
						class="copyright_footer display_flex justify-content-spbetween">
						<div class="copyright_text copyright_col">Copyright © 2019
							BookBus. All rights reserved.</div>
						<div class="copyright_menu copyright_col">
							<ul>
								<li><a href="https://order.thecoffeehouse.com/policy">Privacy
										Policy</a></li>
								<li><a href="https://order.thecoffeehouse.com/term">Terms
										of Use</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</footer>
	</div>
</body>
</html>