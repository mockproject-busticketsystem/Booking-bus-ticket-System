<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Nhân Viên Xem Chuyến</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nhanvien.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	type="text/css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_ghengoi.css">

<style type="text/css">

#content{
	margin-left: auto;
	margin-right: auto;
	width: 450px;
	margin-top: 15px; 
}
</style>
<body>
	<script type="text/javascript">
$(document).ready(function() {
var maghe = [
<c:forEach items="${maghe}" var="mg">
    '<c:out value="${mg.maGhe}" />',  
</c:forEach>
];
for(var i = 0;i < maghe.length;i++){
/* 	alert(maghe[i]); */
	$('input:checkbox[value=' + maghe[i] + ']').attr('disabled', true); 
}
});
</script>
	<div id=main_top>
		<div id=main2>
			<div class=top>
				<h4>main</h4>
				<hr class=new4>

				<div class=right>
					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien">

						<h4>
							<input type="submit" value="Back Nhân Viên">
					</form>
					</h4>
				</div>
				<div class=right2>
					<form method="POST"
						action="${pageContext.request.contextPath}/DashboardNhanVien/XemVe">
						<input type="hidden" name="idchuyen" value=${idchuyen}></input> <input
							type="hidden" name="ngaydi" value=${ngaydi}></input>
						<h4>
							<input type="submit" value="Back Chuyến Đi">
					</form>
					</h4>
				</div>
				

			</div>
		</div>
		<div id="main">
			<div id=head style="margin-top: -10px;">
				<div class=logo>
					<p>Thông Tin Chuyến Đi</p>
				</div>
			</div>
			<c:set var="a" value="0" />

			<div id="head1" style="margin-top: -22px;">
				<c:forEach items="${allve}" var="ve">
					<c:if test="${a.equals('0')}">
						<h4>
							<div class="left1" style="margin-left:30px" >Id Chuyến &nbsp</div>
								<div class=left2> ${ve.iDChuyen}</div>
							<div class=left1>
								Giờ Xe Chạy </br> </br> Ngày Đi
							</div>
							<div class=left2>
								 ${ve.gioDi} </br> </br> ${ve.ngayDi}
							</div>
							<div class=left1>
								Khởi Hành </br> </br> Điểm Đến
							</div>
							<div class=left2>
								 ${ve.diaDiemDi} </br> </br>  ${ve.diaDiemDen}
							</div>
							<div class=left1>Vị Trí Chờ Xe  &nbsp</div>
								<div class=left2> ${ve.hangDoi}</div>
						</h4>
						<c:set var="a" value="1" />
					</c:if>
				</c:forEach>
			</div>
			</br>
			<div id="content">
			  <div class="status_xe">
        <ul style="list-style-type: none;">
        	 <div class="ghedangchon">
          <div class="ml5"
            style="display: inline-block; width: 30px; height: 15px;
             border: 1px solid #A9A9A9; background-color: #006400; "></div>
        <span>Ghế đang chọn </span>
      		</div>
          <br>
          <div class="ghekhongban" style="margin-top: -47px;">
          <div class="ml5"
            style="display: inline-block; width: 30px; height: 15px; 
            border: 1px solid #A9A9A9; background-color: #dddddd; margin-left: 120px;"></div>
          <span>Ghế không bán</span>
      	</div>
          <br>
          <div class="ghechuachon" style="margin-top: -47px;margin-left: 83px;">
          <div class="ml5"
            style="display: inline-block; width: 30px; height: 15px;
             border: 1px solid #A9A9A9; background-color: white; margin-left: 185px;"></div>
          <span>Ghế chưa chọn</span>
      	</div>
        </ul>
      </div>
			 <div class="exit exit--front fuselage" style="width: 440px; border-top: 3px solid #333333;"></div>
		    <ol class="cabin fuselage" style="width: 440px;border-top: 3px;">
    <label style="margin-left: 80px;">Floor2</label>
    	<img src="${pageContext.request.contextPath}/img/banh_lai.PNG" style="margin-top: -60px;margin-left: 105px;width: 50px;">
    	<label>Floor1</label>
      <li class="row row--1" >
        <ol class="seats" type="A">
        	
          <li class="seat"><input type="checkbox" id="1A" value="1A"
            name="check" class="checkbox" onclick="array();" /> <label
            for="1A">1A</label></li>
          
          <li class="seat"><input type="checkbox" id="1B" value="1B"
            name="check" class="checkbox" onclick="array();" /> <label
            for="1B">1B</label></li>
            <li class="seat"><input type="checkbox" id="1C" value="1C"
            name="check" class="checkbox" onclick="array();" /> <label
            for="1C">1C</label>
            </li>
              <li class="seat">
             <input type="checkbox" id="1D" value="1D"
            name="check" class="checkbox" onclick="array();" /> <label
            for="1D">1D</label>
            <input type="checkbox" id="1E" value="1E"
            name="check" class="checkbox" onclick="array();" /> <label
            for="1E">1E</label>
            <input type="checkbox" id="1F" value="1F"
            name="check" class="checkbox" onclick="array();" /> <label
            for="1F">1F</label></li>
         
        
           
        </ol>
      </li>
      <li class="row row--2">
        <ol class="seats" type="A">

          <li class="seat"><input type="checkbox" id="2A" value="2A"
            name="check" class="checkbox" onclick="array();" /> <label
            for="2A">2A</label></li>
         
          <li class="seat"><input type="checkbox" id="2B" value="2B"
            name="check" class="checkbox" onclick="array();" /> <label
            for="2B">2B</label></li>
               <li class="seat"><input type="checkbox" id="2C" value="2C"
            name="check" class="checkbox" onclick="array();" /> <label
            for="2C">2C</label></li>
             
          <li class="seat">
           <input type="checkbox" id="2D" value="2D"
            name="check" class="checkbox" onclick="array();" /> <label
            for="2D">2D</label><input type="checkbox" id="2E" value="2E"
            name="check" class="checkbox" onclick="array();" /> <label
            for="2E">2E</label><input type="checkbox" id="2F" value="2F"
            name="check" class="checkbox" onclick="array();" /> <label
            for="2F">2F</label></li> 
        </ol>
      </li>

      <li class="row row--3">
        <ol class="seats" type="A">
        	
          <li class="seat"><input type="checkbox" id="3A" value="3A"
            name="check" class="checkbox" onclick="array();" /> <label
            for="3A">3A</label></li>
        
          <li class="seat"><input type="checkbox" id="3B" value="3B"
            name="check" class="checkbox" onclick="array();" /> <label
            for="3B">3B</label></li>
 			 <li class="seat"><input type="checkbox" id="3C" value="3C"
            name="check" class="checkbox" onclick="array();" /> <label
            for="3C">3C</label></li>
 			
          	<li class="seat"> <input type="checkbox" id="3D" value="3D"
            name="check" class="checkbox" onclick="array();" /> <label
            for="3D">3D</label><input type="checkbox" id="3E" value="3E"
            name="check" class="checkbox" onclick="array();" /> <label
            for="3E">3E</label><input type="checkbox" id="3F" value="3F"
            name="check" class="checkbox" onclick="array();" /> <label
            for="3F">3F</label></li>

        </ol>
      </li>

      <li class="row row--4">
        <ol class="seats" type="A">
        	
          <li class="seat"><input type="checkbox" id="4A" value="4A"
            name="check" class="checkbox" onclick="array();" /> <label
            for="4A">4A</label></li>
         
          <li class="seat"><input type="checkbox" id="4B" value="4B"
            name="check" class="checkbox" onclick="array();" /> <label
            for="4B">4B</label>

        </li>
 			 <li class="seat"><input type="checkbox" id="4C" value="4C"
            name="check" class="checkbox" onclick="array();" /> <label
            for="4C">4C</label></li>
 			 
          <li class="seat">
           <input type="checkbox" id="4D" value="4D"
            name="check" class="checkbox" onclick="array();" /> <label
            for="4D">4D</label>
            <input type="checkbox" id="4E" value="4E"
            name="check" class="checkbox" onclick="array();" /> <label
            for="4E">4E</label>
            <input type="checkbox" id="4F" value="4F"
            name="check" class="checkbox" onclick="array();" /> <label
            for="4F">4F</label></li>
       
          <li class="seat"></li> 

        </ol>
      </li>
  
      <li class="row row--5">
        <ol class="seats" type="A">
        	    
          <li class="seat"><input type="checkbox" id="5A" value="5A"
            name="check" class="checkbox" onclick="array();" /> <label
            for="5A">5A</label></li>
            
     <!--      <li class="seat"><input type="checkbox" id="5B" value="5B"
            name="check" class="checkbox" onclick="array();" /> <label
            for="5B">5B</label></li> -->
          <li class="seat"><input type="checkbox" id="5B" value="5B"
            name="check" class="checkbox" onclick="array();" /> <label
            for="5B">5B</label>
   
          
        </li>
           <li class="seat"><input type="checkbox" id="5C" value="5C"
            name="check" class="checkbox" onclick="array();" /> <label
            for="5C">5C</label></li>
 		
          <li class="seat">
           <input type="checkbox" id="5D" value="5D"
            name="check" class="checkbox" onclick="array();" /><label
            for="5D">5D</label>
              <input type="checkbox" id="5E" value="5E"
            name="check" class="checkbox" onclick="array();" /><label
            for="5E">5E</label>
             <input type="checkbox" id="5F" value="5F"
            name="check" class="checkbox" onclick="array();" /> <label
            for="5F">5F</label>
            </li>
        </ol>
      </li>

    </ol>
     <div class="end_bus"  style="width: 440px;" ></div>
			</div>
		</div>
	</div>
	</div>
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
			$('#mydataTable').DataTable();
		});
	</script>
</body>

</html>