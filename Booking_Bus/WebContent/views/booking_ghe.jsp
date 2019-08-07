<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Booking Bus</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>

<meta name="viewport" content="width=device-width"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ghengoi.css">
<script type="text/javascript">

//   if(countVar >= 0){
//     countVar = countVar + 1;
//   }
//   if(countVar > 6){
//     alert("Chỉ tối đa chọn 6 ghế!");
//     countVar--;
//   }
//   document.getElementById('count').innerHTML =  countVar;
// }
  $(document).ready(function() {
        $(".checkbox").click(function(){
            var array = [];
            $.each($("input[name='check']:checked"), function(){            
                array.push($(this).val());
            });
            document.getElementById('mang_ghe').innerHTML = "Thông tin ghế đặt: " + array.join(",");
        });
    });
</script>
<script type="text/javascript">
var dongia = <%=request.getAttribute("dongia")%>;
$(document).ready(function () {
var increment2 = 0;
  $('.checkbox').on('click', function() { 
	  
          /*   if (this.checked) {
                increment2++;                 
            } else {
                increment2--;
            }
            if(increment2 >= 6){
        	  	alert("Không được đặt trên 6 ghế!");
        	  	 $('.checkbox').not(':checked').length == 3);
        	  }  
            // $('#count').html( '(' + increment2 + ')');  
           document.getElementById('donGia').innerHTML = "Tổng số tiền: "+  increment2 * dongia + " đ"; */
           $('.checkbox').not(':checked').prop('disabled', $('.checkbox:checked').length == 3);
           var isChecked = this.checked;
           $(this).next().next().prop('disabled', !isChecked)
        });
 	 
 });
</script>
</head>
<body>
<div class="plane">
 <h2 id="mang_ghe">alo</h2>
  <div class="cockpit">
    <h2 id = "count">0</h2>
     <h2 id = "donGia">Tổng số tiền: 0</h2>
     <br><br>
      <div class = "status_xe">
        <ul style="list-style-type: none;">
          <div class="ml5" style="display: inline-block;width: 30px;height: 15px;border: 1px solid #A9A9A9;background-color: #006400;float:left;margin-right: 5px;"></div><li><span style="float:left;">Ghế đang chọn </span></li><br>
           <div class="ml5" style="display: inline-block;width: 30px;height: 15px;border: 1px solid #A9A9A9;background-color:  #dddddd;float:left;margin-right:5px;"></div><li><span style="float:left;">Ghế không bán</span></li><br>
           <div class="ml5" style="display: inline-block;width: 30px;height: 15px;border: 1px solid #A9A9A9;background-color: white;float:left;margin-right:5px;"></div><li><span style="float:left;">Ghế chưa chọn</span></li>
        </ul>
       </div>
</div>
  <div class="exit exit--front fuselage">
    
  </div>
  <ol class="cabin fuselage">
    <li class="row row--1">
      <ol class="seats" type="A">
        <li class="seat">
          <input type= "checkbox" id="1A" value="1A" name="check" class="checkbox" onclick ="array();"/>
          <label for="1A">1A</label>
        </li>
        <li class="seat">
       
        </li>
        <li class="seat">
          <input type="checkbox" id="1B" value="1B"  name="check"  class="checkbox" onclick ="array();"/>
          <label for="1B">1B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="1C" value="1C"  name="check" class="checkbox" onclick ="array();"/>
          <label for="1C">1C</label>
        </li>
        <li class="seat">
         
        </li>
        <li class="seat">
          <input type="checkbox" id="1D" value="1D"  name="check" class="checkbox" onclick ="array();" />
          <label for="1D">1D</label>
        </li>
      </ol>
    </li>
    <li class="row row--2">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="2A" value="2A" name="check"  class="checkbox" onclick ="array();"/>
          <label for="2A">2A</label>
        </li>
        <li class="seat">
         
        </li>
        <li class="seat">
          <input type="checkbox" id="2B" value="2B" name="check"  class="checkbox" onclick ="array();"/>
          <label for="2B">2B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="2C" value="2C" name="check"  class="checkbox" onclick ="array();"/>
          <label for="2C">2C</label>
        </li>
        <li class="seat">
         
        </li>
        <li class="seat">
          <input type="checkbox" id="2D" value="2D" name="check"  class="checkbox" onclick ="array();"/>
          <label for="2D">2D</label>
        </li>
      </ol>
    </li>
   <!--  <li class="row row--4">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="4A" />
          <label for="4A">4A</label>
        </li>
        <li class="seat">
         
        </li>
        <li class="seat">
          <input type="checkbox" id="4C" />
          <label for="4C">4C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="4D" />
          <label for="4D">4D</label>
        </li>
        <li class="seat">
        
        </li>
        <li class="seat">
          <input type="checkbox" id="4F" />
          <label for="4F">4F</label>
        </li>
      </ol>
    </li> -->
    <li class="row row--3">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="3A" value="3A" name="check"  class="checkbox" onclick ="array();"/>
          <label for="3A">3A</label>
        </li>
        <li class="seat">
        
        </li>
        <li class="seat">
          <input type="checkbox" id="3B" value="3B" name="check"  class="checkbox" onclick ="array();"/>
          <label for="3B">3B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="3C" value="3C" name="check"  class="checkbox" onclick ="array();"/>
          <label for="3C">3C</label>
        </li>
        <li class="seat">
        
        </li>
        <li class="seat">
          <input type="checkbox" id="3D" value="3D" name="check"  class="checkbox" onclick ="array();"/>
          <label for="3D">3D</label>
        </li>
      </ol>
    </li>
   <!--  <li class="row row--6">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="6A" />
          <label for="6A">6A</label>
        </li>
        <li class="seat">
        
        </li>
        <li class="seat">
          <input type="checkbox" id="6C" />
          <label for="6C">6C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="6D" />
          <label for="6D">6D</label>
        </li>
        <li class="seat">
         
        </li>
        <li class="seat">
          <input type="checkbox" id="6F" />
          <label for="6F">6F</label>
        </li>
      </ol>
    </li> -->
    <li class="row row--4">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="4A" value="4A" name="check"  class="checkbox" onclick ="array();"/>
          <label for="4A">4A</label>
        </li>
        <li class="seat">
        
        </li>
        <li class="seat">
          <input type="checkbox" id="4B" value="4B" name="check"  class="checkbox" onclick ="array();"/>
          <label for="4B">4B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="4C" value="4C" name="check" class="checkbox" onclick ="array();"/>
          <label for="4C">4C</label>
        </li>
        <li class="seat">
        
        </li>
        <li class="seat">
          <input type="checkbox" id="4D" value="4D" name="check" class="checkbox" onclick ="array();"/>
          <label for="4D">4D</label>
        </li>
      </ol>
    </li>
  <!--   <li class="row row--8">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="8A" />
          <label for="8A">8A</label>
        </li>
        <li class="seat">
       
        </li>
        <li class="seat">
          <input type="checkbox" id="8C" />
          <label for="8C">8C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="8D" />
          <label for="8D">8D</label>
        </li>
        <li class="seat">
       
        </li>
        <li class="seat">
          <input type="checkbox" id="8F" />
          <label for="8F">8F</label>
        </li>
      </ol>
    </li> -->
    <li class="row row--5">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="5A" value="5A" name="check" class="checkbox" onclick ="array();"/>
          <label for="5A">5A</label>
        </li>
        <li class="seat">
        <input type="checkbox" id="5B" value="5B" name="check" class="checkbox" onclick ="array();"/>
          <label for="5B">5B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5C" value="5C" name="check" class="checkbox" onclick ="array();"/>
          <label for="5C">5C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5D" value="5D" name="check" class="checkbox" onclick ="array();"/>
          <label for="5D">5D</label>
        </li>
        <li class="seat">
         <input type="checkbox" id="5E" value="5E" name="check" class="checkbox" onclick ="array();"/>
          <label for="5E">5E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5F" value="5F" name="check" class="checkbox" onclick ="array();"/>
          <label for="5F">5F</label>
        </li>
      </ol>
    </li>
  <!--   <li class="row row--10">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="10A" />
          <label for="10A">10A</label>
        </li>
        <li class="seat">
        
        </li>
        <li class="seat">
          <input type="checkbox" id="10C" />
          <label for="10C">10C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="10D" />
          <label for="10D">10D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="10F" />
          <label for="10F">10F</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="10F" />
          <label for="10F">10F</label>
        </li>
      </ol>
    </li> -->
  </ol>
  
  <div class="exit exit--back fuselage">
   
  </div>
     <button type="button" class="btn btn-primary" id="booking">Booking</button> 
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</div>
<!-- partial -->

</body>
</html>