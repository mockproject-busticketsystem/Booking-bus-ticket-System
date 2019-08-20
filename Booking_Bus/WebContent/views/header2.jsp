<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <style>
  #menu{
        height: 70px;
       line-height: 40px;
       padding-left: 10px;
       padding-right: 10px;
      
       background-color: #28292E;
       /*margin-bottom:5px;*/
       clear: both;
         /*position: fixed;*/
         top: 0;
         width: 100%;
       /*  display: block;*/
         transition: top 0.3s;
  }
  #menu li.left { 
    display: inline-block;
    float: left;
    width: 200px;
    height: 40px;
    line-height: 40px;
    margin-left: 40px;
    font-family: Britannic Bold;
    font-weight: bold;
    font-size: 18px;
    /*background-color: blue;  */
    text-align: left;
      margin-top: 15px;
  }
  #menu li a{
    color: white;

    text-decoration: none;
  }

  #menu img{
    float: left;
    margin-top :15px;
    height: 50px;
    width: 200px;
  }
  #hoten{
    float: right;
    color: white;
     width:300px;
       display: inline-block;
    height: 40px;
    line-height: 40px;
    font-family: Britannic Bold;
    font-weight: bold;
    font-size: 18px;
    /*background-color: blue;  */
    text-align: left;
      margin-top: 15px;
      margin-right: 90px;
   	margin-top: -40px;
}
#dangxuat{
	float: right;
    color: white;
   	margin-right:20px;
    display: inline-block;
    height: 40px;
    line-height: 40px;
    font-family: Britannic Bold;
    font-weight: bold;
    font-size: 18px;
    /*background-color: blue;  */
      margin-top: 15px;
}
#lichsu{
	margin-right: -50px;
	padding-right: 20px;
}
 </style>
     <div id="menu">  
      <a  href="http://localhost:8080/Booking_Bus/views/indexUser.jsp">
                <img src="${pageContext.request.contextPath}/img/logo_bus.png">    
</a>
                        <ul style="list-style-type: none;">
                        
                         <li class="left"><a href="<%=request.getContextPath()%>/ThongTinKhachHang">Thông tin cá nhân</a></li>
                            <li class="left" id = "lichsu"><a href="${pageContext.request.contextPath}/ViewAllTicketCustom">Lịch sử booking</a></li>
                            <li class="left"><a href="<%=request.getContextPath()%>/pageUser">Booking Vé</a></li>
                            <li id = "dangxuat"><a href="${pageContext.request.contextPath}/DangXuat">Đăng xuất</a></li>                     
                           <li id = "hoten"><a>Welcome ${hoTen}</a></li>  
                        </ul>  

         </div>                