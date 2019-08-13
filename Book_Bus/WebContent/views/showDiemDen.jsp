<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book_Bus</title>
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
</head>
<body onload="showAlert();">
	<script type="text/javascript">
		function showAlert() {
			var list = '${arrayChuyenDi}';
			alert(typeof (list));
			alert(list);
			list.forEach(function(element) {
				console.log(element);
			});
		}
	</script>
	<%-- <select name="diemden" class="txtFrm" id="diemden" required="required ">
		<option value="0">Chọn điểm đến</option>
		<c:forEach var="item" items="${arrayDiemDen}">
			<option value="${item}">${item}</option>
		</c:forEach>
	</select> --%>
	<div class="item_dv datefm">
		<label>Giờ đi</label> <select name="giodi" id="giodi" class="txtFrm" required="required" data-date-format="hh:ii">
			<option value="">Chọn giờ đi</option>
			<c:forEach var="item" items="${arrayChuyenDi}">
				<option value="${item.iD}"> ${item.gioiDi} </option>
			</c:forEach>
		</select> <span><i class="glyphicon glyphicon-time"style="font-size: 30px; margin-top: 4px; margin-right: 15px;"></i></span>
	</div>
	<p></p>
</body>
</html>