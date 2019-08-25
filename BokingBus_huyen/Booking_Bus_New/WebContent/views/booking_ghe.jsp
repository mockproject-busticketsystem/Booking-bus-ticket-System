<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Booking Bus</title>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
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
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css_booking_ghe/bootstrap.min.css" />

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css_booking_ghe/style.css" />
<!-- <script type="text/javascript">
  $(document).ready(function() {
        $(".checkbox").click(function(){
        	
        });
   
    });
</script> -->
<script type="text/javascript">
var dongia = <%=request.getAttribute("dongia")%>;
$(document).ready(function () {
var increment2 = 0;
  $('.checkbox').on('click', function() { 
	   var countGhe = <%= request.getAttribute("countGhe") %>;
		
       if (this.checked) {
                increment2++;                 
            } else {
                increment2--;
            			}
        	   if ($('input[type=checkbox]:checked').length > 5) {
        	        $(this).prop('checked', false)
        	        alert("Bạn chỉ có thể đặt tối đa 5 ghế trong 1 lần đặt!");
        	        increment2--;
        	   }else  if((Number(countGhe) + increment2) > 5){
        		  	 $(this).prop('checked', false)
        		/* 	alert(Number(countGhe) + increment2); */
   					alert("Bạn đã đặt " +countGhe+" ghế trước đó! Bạn chỉ có thể đặt tối đa 5 ghế! Số ghế tối đa bạn có thể đặt lúc này là --> "+(5 - countGhe)+" ghế!");
   				  	increment2--;
        	   }
        	   else {
        		   var array = [];
                   $.each($("input[name='check']:checked"), function(){            
                       array.push($(this).val()); 
                   });
                   document.getElementById('mang_ghe').innerHTML = "Thông tin ghế đặt: " + array.join(",");
                   document.getElementById('array_ghe').value = array.join(","); 
        	   }
        	   $('#count').html( 'Số Ghế Đặt:  '+ increment2);  
        	   document.getElementById('count_ghe').value = increment2;
 	          document.getElementById('tongTien').innerHTML = "Tổng số tiền: "+  increment2 * dongia + " đ"; 
 	         document.getElementById('tong_Tien').value = increment2 * dongia;
         /*   $('input[type=checkbox]').on('change', function (e) {
       	    if ($('input[type=checkbox]:checked').length >= 5) {
       	    	var $checkboxes = $('input[type=checkbox]');
       	    	 $checkboxes.filter(":not(:checked)").prop("disabled", true);
 					alert("Tối đa chỉ chọn được 3 vé!"); 
       	    } */  	
 		 /* $('.checkbox').not(':checked').prop('disabled', $('.checkbox:checked').length == 3); */
         /*   var isChecked = this.checked;
           $(this).next().next().prop('disabled', !isChecked)  */
       /*  });	  */
 	 });
$("#frm_info").submit(function(e) {

		  if(!$('input[type=checkbox]:checked').length) {
		        alert("Mời quý khách chọn ghế!");
		        //stop the form from submitting
		        return false;
		    }
		return true;
	});
});
</script>
<script type="text/javascript">
$(document).ready(function () {
	<%-- $("#frm_info").submit(function(e) {
	var countGhe = <%=request.getAttribute("countGhe")%>;
	var soghedat = $('#count_ghe').val();
/* 	alert(Number(countGhe) + Number(soghedat)); */
 	   if((Number(countGhe) + Number(soghedat)) > 5){
			alert("Bạn đã đặt " +countGhe+" ghế trước đó! Bạn chỉ có thể đặt tối đa 5 ghế! Số ghế tối đa bạn có thể đặt lúc này là --> "+(5 - countGhe)+" ghế!");
			return false;
			}
		return true;
	}); --%>
});
</script>
</head>
<body >

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
var countGhe = <%=request.getAttribute("countGhe")%>;
if(countGhe >= 5){
	alert("Bạn đã đặt đủ số ghế @@");
/* 	$('input[type=checkbox]').prop('disabled', true);  */
	location.replace(window.history.back());
}
});
</script>

	<%-- 	<script src="${pageContext.request.contextPath}/js/script.js"></script> --%>

	<%-- 	<h4>CMND: ${CMND}</h4>
		<h4>Ma Chuyen: ${idchuyen}</h4>
		<h4>Ngay di: ${ngaydi}</h4>
		
		<h4>Hang Doi: ${HangDoi}</h4>

		<h2>
			tuyen iD =
			<%=request.getAttribute("idtuyen")%>
			:
			<%=request.getAttribute("diemdi")%>
			-->
			<%=request.getAttribute("diemden")%>
		</h2>
		<h2>
			Giá :
			<%=request.getAttribute("dongia")%>đ
		</h2> --%>
		<div id="main">
		<jsp:include page="header2.jsp"></jsp:include>
		<div id="content" style="background: url('${pageContext.request.contextPath}/img/background2.jpg');background-size: cover;">
		<div id="booking_bus" class="section" >
		<div class="section-center" >
			<div class="container" >
			
					<div class="booking-form" >
						<div class="booking-bg">
							    <div class="plane" id="plane" style="width: 440px;" >
            <div class="cockpit" style="margin-top: -30px;">
     
      <br> <br>
      <div class="status_xe" style="margin-top: 100px;">
        <ul style="list-style-type: none;">
        	 <div class="ghedangchon">
          <div class="ml5"
            style="display: inline-block; width: 30px; height: 15px;
             border: 1px solid #A9A9A9; background-color: #006400; float: left; margin-right: 5px;"></div>
          <li><span style="float: left;">Ghế đang chọn </span></li>
      		</div>
          <br>
          <div class="ghekhongban">
          <div class="ml5"
            style="display: inline-block; width: 30px; height: 15px; 
            border: 1px solid #A9A9A9; background-color: #dddddd; margin-right: 5px;"></div>
          <span>Ghế không bán</span>
      	</div>
          <br>
          <div class="ghechuachon">
          <div class="ml5"
            style="display: inline-block; width: 30px; height: 15px;
             border: 1px solid #A9A9A9; background-color: white; margin-left: 150px;"></div>
          <span>Ghế chưa chọn</span>
      	</div>
        </ul>
      </div>
    </div>
    <div class="exit exit--front fuselage" style="width: 440px;"></div>
    <ol class="cabin fuselage" style="width: 440px;">
    <label style="margin-left: 80px;">Floor2</label>
    	<img src="${pageContext.request.contextPath}/img/banhlai.png" style="margin-top: -60px;margin-left: 115px;width: 50px;">
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
  <div class="end_bus" style="margin-top: -10px;">
    
  </div>
      </div>
						</div>
						<form id = "frm_info" action="${pageContext.request.contextPath}/booking"
			method="post">
						<input type="hidden" name="idchuyen" value="${idchuyen}" />
						<input type="hidden" name="dongia" value="${dongia}" />
				<%-- 		 <input type="hidden" name="HangDoi" value="${HangDoi}" /> --%>
							<div class="form-header">
								<h2 style="text-align: center;font-family: Algerian;">THÔNG TIN ĐẶT GHẾ</h2>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">Điểm Đi</span>
										<input class="form-control" type="text" value = " ${diemdi}" name = "diemdi" disabled>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">Điểm Đến</span>
										<input class="form-control" type="text" value = "${diemden}" name = "diemden" disabled>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">CMND</span>
										<input class="form-control" type="text" value = "${CMND}" disabled>
										<input class="form-control" type="hidden" name="CMND" value = "${CMND}">
										<span class="select-arrow"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">Ngày Đi</span>
										<input class="form-control" type="text" value = "${ngaydi}" disabled>
										<input class="form-control" type="hidden" name="ngaydi" value = "${ngaydi}">
										<span class="select-arrow"></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<span class="form-label" style="font-size: 17px;">Thời Gian Đi: &nbsp ${giodi}</span>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp
								<input class="hidden" type="text" name="giodi" value = "${giodi}">
								
								<span class="form-label" id = "count" style="font-size: 17px;">Số Ghế Đặt:  0</span>
								<input type="hidden" id = "count_ghe" name = "count_ghe"/>
							</div>
							<div class="form-group">
									<span class="form-label" id = "gioden" style="font-size: 17px;">Thời gian đến (dự kiến):  ${chuyendi.gioDen}</span>
								<input type="hidden" id = "gioden" name = "gioden"/>
							</div>
							<div class="form-group">
								<span class="form-label" id="mang_ghe" style="font-size: 17px;">Thông tin ghế đặt</span>
								<input type="hidden"  id = "array_ghe" name="array_ghe">
							</div>
							<div class="form-group">
								<span class="form-label" id="tongTien" style="font-size: 17px;">Tổng tiền: 0</span>
								<input type="hidden" id = "tong_Tien" name = "tong_Tien"/>
								
							</div>
							<div class="form-btn">
								<button class="submit-btn" onclick = "return confirm('Are you sure you want to Booking ?')">Book Now</button>
							</div>
						</form>
					</div>
			</div>
		</div>
	</div>
		<%-- <h3 id="textspan"></h3>
		<form action="${pageContext.request.contextPath}/booking"
			method="post" id="myForm">
			<input type="hidden" name="CMND" value="${CMND}" /> <input
				type="hidden" name="idchuyen" value="${idchuyen}" /> <input
				type="hidden" name="ngaydi" value="${ngaydi}" /> <input
				type="hidden" name="HangDoi" value="${HangDoi}" /> <input
				type="hidden" id="array_ghe" name="array_ghe" />
			<!-- 	<div class="exit exit--back fuselage"  style="width: 520px;"></div> -->
			<button type="submit" class="btn btn-primary" onclick="" id="booking">Booking</button>
		</form> --%>
	<!-- partial -->
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>