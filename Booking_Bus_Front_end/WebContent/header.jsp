<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
 <style>
 @charset "ISO-8859-1";
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
  #menu li.right { 
    display: inline-block;
    float: right;
    width: 170px;
    height: 40px;
    line-height: 40px;
    margin-left: 20px;
    font-family: Britannic Bold;
    font-weight: bold;
    font-size: 18px;
    /*background-color: blue;  */
    text-align: center;
      margin-top: 15px;
  }
  #menu li a{
    color: white;

    text-decoration: none;

  }
   #menu a:hover{
    color: yellow;
    background-color: blue;
    font-size: 25px;
   }
  #menu img{
    float: left;
    margin-top :15px;
    height: 50px;
    width: 200px;
  }
 </style>
     <div id="menu">  
                <img src="img/logo_bus.png">    
                        <ul>
                            <li class="right"><a href="">Đăng nhập</a></li>
                            <li class="right"><a href="">Đăng ký</a></li>
                            <li class="right"><a href="">Liên hệ</a></li>
                            <li class="right"><a href="">Giới thiệu</a></li>                      
                            <li class="right" ><a href="" >Trang chủ</a></li>

                           <!--  <li class="right"><a href="">   <img src="img/facebook_icon.png">  </a></li>
                            <li class="right"><a href=""><img src="img/zalo_icon.png"> </a></li> -->
                        </ul>  
         </div>     