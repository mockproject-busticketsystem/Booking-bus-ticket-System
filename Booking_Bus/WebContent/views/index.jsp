<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>Booking Bus</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
       <link rel="icon" type="image/png" href="../img/baner-bus.png" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/main.css">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--              <link rel="stylesheet" type="text/css" href="css/footer.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
      <script>
    var prevScrollpos = window.pageYOffset;
    window.onscroll = function() {
    var currentScrollPos = window.pageYOffset;
     if (prevScrollpos < currentScrollPos) {
    document.getElementById("menu").style.top = "0";
     }
     prevScrollpos = currentScrollPos;
    }
</script>
</head>
<body>
  <div id="main"> 
 	 <jsp:include page="header.jsp"></jsp:include>
        <div id="head">
        </br>  </br>    
                    <img src="../img/baner-bus.png">
                 <h1>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCông ty TNHH BookBus<br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(BOOKBUS EXPRESS)<br>
CHẤT LƯỢNG- HIỆU QUẢ - NHANH CHỐNG<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp TIN CẬY - AN TÂM.</h1>
        </div>
     
         <div id="content">
            <div class="animate"></div>
        </div> 

   <section class="container" id="star-city">
    <h3 class="heading"><i class="fa fa-file-text" aria-hidden="true"></i> Khởi hành từ các thành phố lớn</h3>
    <div class="row">
        <div class="col-md-4 startpoint-block">
            <figure><img src="../img/c1.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Sài Gòn</span></p>
                <p>Hotline: <span>1900 6067</span></p>
                <p>Điểm đến: Châu Đốc, Cần Thơ, Cà Mau, Đà Lạt, Mũi Né, Qui Nhơn, Nha Trang,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 startpoint-block">
             <figure><img src="../img/c2.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Đà Lạt</span></p>
                <p>Hotline: <span>02633 58 58 58</span></p>
                <p>Điểm đến: Nha Trang, Đà Nẵng, Huế, Sài Gòn, Cần Thơ, Quy Nhơn,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 startpoint-block">
             <figure><img src="../img/c3.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Nha Trang</span></p>
                <p>Hotline: <span>02583 812 812</span></p>
                <p>Điểm đến: Sài Gòn, Đà Lạt, Đà Nẵng, Huế, Hà Nội, Cần Thơ,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 startpoint-block">
             <figure><img src="../img/c4.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Cần Thơ</span></p>
                <p>Hotline: <span>02923 769 768</span></p>
                <p>Điểm đến: Sài Gòn, Cà Mau, Rạch Giá, Châu Đốc, Đà Lạt,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 startpoint-block">
             <figure><img src="../img/c5.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Đà Nẵng</span></p>
                <p>Hotline: <span>02363 786 786</span></p>
                <p>Điểm đến: Đà Lạt, Sài Gòn, Nha Trang, Hà Nội, Bảo Lộc,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 startpoint-block">
             <figure><img src="../img/c6.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Hà Nội</span></p>
                <p>Hotline: <span>0243 864 19 19</span></p>
                <p>Điểm đến: Đà Nẵng, Nam Định,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 startpoint-block">
             <figure><img src="../img/c7.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Hà Tiên - Rạch Giá</span></p>
                <p>Hotline: <span>02973 66 88 66 - 02973 691 691</span></p>
                <p>Điểm đến: Sài Gòn, Cần Thơ,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 startpoint-block">
            <figure><img src="../img/c8.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Cà Mau - Năm Căn</p>
                <p>Hotline: <span>02903 651 651 - 02903 715 715</span></p>
                <p>Điểm đến: Sài Gòn, Cần Thơ,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 startpoint-block">
             <figure><img src="../img/c9.png"></figure>
            <div class="startpoint-text">
                <p>Khởi hành từ: <span>Long Xuyên - Châu Đốc</span></p>
                <p>Hotline: <span>02963 98 9999 - 02963 565 888</span></p>
                <p>Điểm đến: Sài Gòn, Cần Thơ,...</p>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>