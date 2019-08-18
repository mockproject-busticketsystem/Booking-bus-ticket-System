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

<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/asset_info/img/apple-icon.png" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/asset_info/img/favicon.png" />

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
	<div class="image-container set-full-height"
		style="background-image: url('${pageContext.request.contextPath}/asset_info/img/wizard-book.jpg')">
		<!--   Big container   -->
		<div class="container">
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
													<th>Ngày Đặt</th>
													<th>Cancel Ticket</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${listVeStatusFalse}">
													<tr>
														<td>${item.chuyenDi.tuyenDi.diaDiemDi}</td>
														<td>${item.chuyenDi.tuyenDi.diaDiemDen}</td>
														<td>${item.ngayDi}</td>
														<td>${item.chuyenDi.gioiDi}</td>
														<td>${item.chuyenDi.gioiDen}</td>
														<td>${item.maGhe}</td>
														<td>${item.hangDoi}</td>
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
													<th>Ngày Đặt</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${listVeStatusTrue}">
													<tr>
														<th>${item.chuyenDi.tuyenDi.diaDiemDi}</th>
														<th>${item.chuyenDi.tuyenDi.diaDiemDen}</th>
														<th>${item.ngayDi}</th>
														<th>${item.chuyenDi.gioiDi}</th>
														<th>${item.chuyenDi.gioiDen}</th>
														<th>${item.maGhe}</th>
														<th>${item.hangDoi}</th>
														<th>${item.donGia}</th>
														<th>${item.ngayGioDat}</th>
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
