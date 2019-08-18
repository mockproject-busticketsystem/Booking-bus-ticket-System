<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>Book Bus</title>

<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"/> -->
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/asset_info/img/apple-icon.png" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/asset_info/img/favicon.png" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css">
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/asset_info/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/asset_info/css/material-bootstrap-wizard.css" rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${pageContext.request.contextPath}/asset_info/css/demo.css" rel="stylesheet" />
</head>

<body>
<div id="main">
		<jsp:include page="header2.jsp"></jsp:include>
	<div id="content">
	<div class="row_tt"
		style="background-image: url('${pageContext.request.contextPath}/asset_info/img/wizard-book.jpg');height: 700px;">
		<!--   Big container   -->
		<div class="container" >
			<div class="row">
				<div class="col-sm-8 col-sm-offset-1">
					<!--      Wizard container        -->
					<div class="wizard-container" style="min-width:1000px;">
						<div class="card wizard-card" data-color="red" id="wizard" >
							<form action="" method="">
								<!--        You can switch " data-color="blue" "  with one of the next bright colors: "green", "orange", "red", "purple"             -->

								<div class="wizard-header">
									<h3 class="wizard-title">View All Ticket Booked</h3>
									<h5>This information ticket you book.</h5>
								</div>
								<div class="wizard-navigation"">
									<ul>
										<li><a href="#details" data-toggle="tab">Tickets are
												not paid yet</a></li>
										<li><a href="#captain" data-toggle="tab">Tickets are
												paid</a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div class="tab-pane" id="details">
										<!--Table o day-->
										<table id="example" class="table table-striped table-bordered"
											cellspacing="0">
											<thead>
												<tr>
													<th>Địa Điểm Đi</th>
													<th>Địa Điểm Đến</th>
													<th>Ngày Đi</th>
													<th>Giờ Đi</th>
													<th>Giờ Đến</th>
													<th>Mã Ghế</th>
													<th>Hàng Đợi</th>
													<th>Đơn Giá</th>
													<th>Ngày Giờ Đặt</th>
													<th>Cancel Ticket</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${listVeStatusFalse}">
													<tr>
														<td>${item.chuyenDi.tuyenDi.diaDiemDi}</td>
														<td>${item.chuyenDi.tuyenDi.diaDiemDen}</td>
														<td>${item.ngayDi}</td>
														<td>${item.chuyenDi.gioDi}</td>
														<td>${item.chuyenDi.gioDen}</td>
														<td>${item.maGhe}</td>
														<td>${item.chuyenDi.tuyenDi.hangDoi}</td>
														<td>${item.donGia}</td>
														<td>${item.ngayGioDat}</td>
														<td><span class="table-remove">
														<button type="button" id="buttonRe" class="btn btn-danger btn-rounded btn-sm my-0"
														onclick="deleteRow(this.parentNode.parentNode.rowIndex)">Remove</button></span></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="captain">
										<!--Table here -->
										<table id="example" class="table table-striped table-bordered"
											cellspacing="0">
											<thead>
												<tr>
													<th>Địa Điểm Đi</th>
													<th>Địa Điểm Đến</th>
													<th>Ngày Đi</th>
													<th>Giờ Đi</th>
													<th>Giờ Đến</th>
													<th>Mã Ghế</th>
													<th>Hàng Đợi</th>
													<th>Đơn Giá</th>
													<th>Ngày Giờ Đặt</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${listVeStatusTrue}">
													<tr>
														<td>${item.chuyenDi.tuyenDi.diaDiemDi}</td>
														<td>${item.chuyenDi.tuyenDi.diaDiemDen}</td>
														<td>${item.ngayDi}</td>
														<td>${item.chuyenDi.gioDi}</td>
														<td>${item.chuyenDi.gioDen}</td>
														<td>${item.maGhe}</td>
														<td>${item.chuyenDi.tuyenDi.hangDoi}</td>
														<td>${item.donGia}</td>
														<td>${item.ngayGioDat}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
							</form>
						</div>
					</div>
					<!-- wizard container -->
				</div>
			</div>
			<!-- row -->
		</div>
		<!--  big container -->
	</div>
	<footer id="footer_2"  >
	<div class="row" style="background: #28292E; max-width: 100%;margin-left: 0px;">
     
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 footer_col">
						<div id="img">
							<img src="${pageContext.request.contextPath}/img/logo_bus.png">
						</div>
						</div>
      				<div class="col" style="margin-right: 40px;max-width: 170px;">
						<h3 class="footer_title">ABOUT</h3>
						<ul class="footer_linklists">
							<li><a href="#" title="Về Chúng Tôi">Về Chúng Tôi</a></li>
							<li><a href="#">Các chuyến xe</a></li>
							<li><a href="#blog" tile="Blog">Blog</a></li>
							<li><a href="#" title="Cửa Hàng">Cửa Hàng</a></li>
						</ul>
					</div>
      <div class="col"><div class="hotline_footer">
							<h3 class="footer_title">Always-on Support</h3>
							<p>Support 02871 087 088 (07:00-21:00)</p>
						</div>
						<div class="address_footer">
							<h3 class="footer_title">Address</h3>
							<p>1096 Kha Van Can, Linh Chieu, Quan Thu Duc Ho Chi Minh, Vietnam</p>
							<p>077 374 9328</p>
							<p>bookbus1803@gmail.com</p>
						</div></div>
						
      <div class="col" style="margin-right: 40px;max-width: 500px;">
      	<ul class="fl social" style="list-style-type: none;" id = "follow_us">
						<li><strong>Follow us</strong></li>
						<li><a href="https://in.linkedin.com/company/book-bus-asia"
							class="fa fa-linkedin-square" title="linkdin" target="_blank"
							style="font-size: 24px; color: white;"></a> <a
							href="https://www.facebook.com/www.bookbus.asia/"
							class="fa fa-facebook-square" target="_blank"
							style="font-size: 24px; color: white;"></a><a
							href="https://twitter.com/bookbusasia" class="fa fa-twitter"
							target="_blank" style="font-size: 24px; color: white;"></a>
							<a href="https://plus.google.com/u/0/106337264178239365499/posts"
							class="fa fa-google-plus-square" target="_blank"
							style="font-size: 24px; color: white;"></a> <a
							href="https://in.pinterest.com/asiabookbus/"
							class=" fa fa-pinterest-square" target="_blank"
							style="font-size: 24px; color: white;"></a><a
							href="https://www.instagram.com/bookbusasia/"
							class="fa fa-instagram" target="_blank"
							style="font-size: 24px; color: white;"></a></li>
						<li class="partners"><strong>Our Payments Partner</strong> <figure>
							<br><img src="https://bookbus.asia:443/img/cc-avenue.png"
								alt="cc-avenue"> </figure>
								<br>
							 <i
								class="fa fa-cc-discover"
								style="font-size: 24px; color: #FFA500;"></i> <i
								class=" fa fa-cc-paypal"
								style="font-size: 24px; color: #7CFC00;"></i> <i
								class="fa fa-cc-visa" style="font-size: 24px; color: #1E90FF;"></i>
								<i class="fa fa-cc-jcb" style="font-size: 24px; color: #32CD32;"></i>
								<i class="fa fa-cc-mastercard"
								style="font-size: 24px; color: #BA55D3;"></i>
					</li>
					</ul></div>
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
			</footer>
	</div>
	
	</div>

</body>

<script type="text/javascript">
var table = document.getElementById("example"),rIndex;
for(var i = 1; i < table.rows.length; i++)
{
    table.rows[i].onclick = function()
    {
        rIndex = this.rowIndex;
        console.log(rIndex);
       var diemDi = this.cells[0].innerHTML;
       var diemDen = this.cells[1].innerHTML;
       var ngayDi = this.cells[2].innerHTML;
        var gioDi = this.cells[3].innerHTML;
       var maGhe= this.cells[5].innerHTML;
       var hangDoi = this.cells[6].innerHTML;
        $.ajax({
            url: "DeleteTicketbyCustom",//your jsp page name */
           data: {diemDi:diemDi, diemDen:diemDen, ngayDi:ngayDi, gioDi:gioDi, maGhe:maGhe, hangDoi:hangDoi
				},//sending request to state.jsp page.
            method: "POST",//HTTP method.
            success: function (data)
            {
            	 $("#example").html(data);
         	/* table.deleteRow(rIndex); */
            },
            error : function(jqXHR, exception) {
				console.log('Error occured!!');
			}
        }); 
            	/* <c:forEach var="item" items="${listVeStatusFalse}">
            	alert("${item.chuyenDi.tuyenDi.diaDiemDi}");
            	var ve = "${item.chuyenDi.tuyenDi.diaDiemDi}";
            	alert(typeof(ve) + "----"+ ve+"---"+typeof("${item}")+"----"+"${item}");
            	request.setAttribute(vexe,);
            	
            	</c:forEach> */
        
        
    };
}
</script>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/asset_info/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/asset_info/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/asset_info/js/jquery.bootstrap.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/asset_info/js/material-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="${pageContext.request.contextPath}/asset_info/js/jquery.validate.min.js"></script>
</html>
