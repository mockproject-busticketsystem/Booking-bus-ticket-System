<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Booking Bus</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css_gioithieu/css/main_test.css">
    </head>
    <body>
       <div id="main">
   <jsp:include page="header.jsp"></jsp:include>
    <div id="head">
        <div class="banner">
                    <h1 >BOOK BUS</h1>
                        
                    <p >Đồng hành cùng bạn trên những chuyến đi</p>

                </div>
    </div>
    <div id="content1">
        <div class="left">
        <div class="text">
         <h3>Thông tin về chúng tôi</h3>
         <p>BookBus là một trong những phần mềm đặt vé xe được nhiều người ưa chuộng vì tính nhanh gọn ,đơn giản ,dễ sử dụng ,... đặc biệt là đảm bảo uy tín đối với người dùng .</p>
         <p>Nếu bạn đang muốn đi một chuyến du lịch xa cùng bạn bè hoặc người thân ,hay muốn làm một chuyến về quê nhà trong những ngày nghỉ, ngày lễ và ngày tết ... Thì bạn nên tìm đến BookBus </p>
         <p>BookBus có thể đưa bạn đến bất cứ đâu trên tuyến đường ,với giá cả hợp lý cùng với những ưu đãi ,bạn sẽ không phải lo nghĩ nhiều về chi phí trong chuyến du lịch ,hay chuyến đi về quê nhà </p>
            <p >BookBus ...Đồng hành cùng bạn trên những chuyến đi</p>
         </div>
        </div>

        <div class="right">
        <section class="thumbnails">
                <a href="${pageContext.request.contextPath}/css_gioithieu/pictures/busshow.jpg">
             <img style = "text-align:center" src="${pageContext.request.contextPath}/css_gioithieu/pictures/busshow.jpg"  alt="" />
         </a>
          </section>
        </div>
   
        </div>
       <div id="content">
    <div class="left">
        <section class="thumbnails">
         <a href="${pageContext.request.contextPath}/css_gioithieu/pictures/inside1.jpg" >
            <img style = "text-align:center" src="${pageContext.request.contextPath}/css_gioithieu/pictures/inside1.jpg" alt="" />
        </a>
    </section>
       <section class="thumbnails">
        <br/> 
         <a href="${pageContext.request.contextPath}/css_gioithieu/pictures/inside2.jpg">
            <img  style = "text-align:center" src="${pageContext.request.contextPath}/css_gioithieu/pictures/inside2.jpg" alt="" />
        </a>
        <br/>
    </section>
    </div>
     <div class="mid">
        <section class="thumbnails">
 <a href="${pageContext.request.contextPath}/css_gioithieu/pictures/view1.jpg">
            <img style = "text-align:center" src="${pageContext.request.contextPath}/css_gioithieu/pictures/view1.jpg"  alt="" />
        </a>
    </section>
       <section class="thumbnails">
        <br/>
         <a href="${pageContext.request.contextPath}/css_gioithieu/pictures/tour2.jpg">
            <img style = "text-align:center" src="${pageContext.request.contextPath}/css_gioithieu/pictures/tour2.jpg"  alt="" />
        </a>
    </section>
    </div>
    <div class="right">
        <section class="thumbnails">
         <a href="${pageContext.request.contextPath}/css_gioithieu/pictures/tour1.jpg">
         <img style = "text-align:center" src="${pageContext.request.contextPath}/css_gioithieu/pictures/tour1.jpg" alt="" />
     </a></section>
        <section class="thumbnails">
          <a href="${pageContext.request.contextPath}/css_gioithieu/pictures/abc.jpg">
           <img style = "text-align:center" src="${pageContext.request.contextPath}/css_gioithieu/pictures/abc.jpg" alt="" />
       </a>
   </section>
    </div>
   
   
    <div id="bot">
          <div class="left">
                        <h3 >Chỗ ngồi </h3>
                        <p>Thoải mái tiện ích với 20 chỗ ngồi</p><p>Được thiết kế với đầy đủ tiện nghi ,chỗ ngồi rộng rãi ,thích hợp cho những chuyến đi dài</p>
                      
                    </div>
                    <div class="mid">
                        <h3>Tuyến đi</h3>
                        <p>Các tuyến đi được vận hành một cách linh hoạt  </p>
                        <p>Người đặt sẽ yên tâm về các lịch trình của chuyến đi</p>
                    </div>
                    <div class="right">
                        <h3>Đáng tin cậy và an toàn tuyệt đối </h3>
                        <p>Các tài xế và hướng dẫn viên đều được qua kiểm duyệt </p>
                        <p>Nhân viên thân thiện và vui vẻ với hành khách</p>
                      
                    </div>
    </div></div>
<div id=end>   <jsp:include page="footer.jsp" ></jsp:include></div>
    </div>

 



<!-- Scripts -->
            <script src="${pageContext.request.contextPath}/css_gioithieu/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/css_gioithieu/js/jquery.poptrox.min.js"></script>
            <script src="${pageContext.request.contextPath}/css_gioithieu/js/skel.min.js"></script>
            <script src="${pageContext.request.contextPath}/css_gioithieu/js/main.js"></script>
    </body>
</html>