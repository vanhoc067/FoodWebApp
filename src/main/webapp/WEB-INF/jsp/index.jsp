<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FoodWebApp</title>
        <c:url value="/css/style.css" var="css" />
        <link href="${css}" rel="stylesheet" >
        <c:url value="/css/chat.css" var="css1" />
        <link href="${css1}" rel="stylesheet" >
    </head>

    <body>
        <div class="container">
            <!-- Start Slider -->
            <br><br>
            <h1 class="text-center text-info">Tìm kiếm món ăn</h1>
            <c:url value="/" var="foodname" />
            <form action="${foodname}">
                <div class="mb-3 mt-3">
                    <label for="email" class="form-label">Food name</label>
                    <input name="kw"  type="text" class="form-control">
                </div>
            </form>
            <c:url value="/" var="fromprice"/>
            <form action="${fromprice}">
                <div class="mb-3">
                    <label for="pwd" class="form-label">From price</label>
                    <input name="fromPrice"  type="text" class="form-control">
                </div>
            </form>
            <c:url value="/" var="toprice" />
            <form action="${toprice}">
                <div class="mb-3">
                    <label for="pwd" class="form-label">To price</label>
                    <input name="toPrice"  type="number" class="form-control">
                </div>
            </form>
            <c:url value="/" var="category"/>
            <form action="${category}">
                <div class="mb-3">
                    <label for="pwd" class="form-label">Danh muc</label>
                    <input name="cateId" type="text" class="form-control">
                </div>
            </form>
            <c:url value="/" var="store"/>
            <form action="${store}">
                <div class="mb-3">
                    <label for="pwd" class="form-label">Cua hang</label>
                    <input name="storeId"  type="text" class="form-control">
                </div>
            </form>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-lg">Tìm</button>
            </div>
        </div>
                <br><br>

            <div id="slides-shop" class="cover-slides">
                <ul class="slides-container">
                    <li class="text-center">
                        <img src="<c:url value="/images/banner-01.jpg" />" alt="" />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>Welcome To <br> Healthy Food</strong></h1>
                                    <p class="m-b-40">Healthy Food Luôn là sự lựa chon tôt nhất của bạn</p>
                                    <p class="m-b-40">Đặt món ngay để nhận ưu đãi tốt nhất</p>
                                    <p><a class="btn hvr-hover" href="#">Đặt món</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="text-center">
                        <img src="<c:url value="/images/banner-02.jpg" />" alt="" />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>Welcome To <br> Healthy Food</strong></h1>
                                    <p class="m-b-40">Healthy Food Luôn là sự lựa chon tôt nhất của bạn</p>
                                    <p class="m-b-40">Đặt món ngay để nhận ưu đãi tốt nhất</p>
                                    <p><a class="btn hvr-hover" href="#">Đặt món</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="text-center">
                        <img src="<c:url value="/images/banner-03.jpg" />" alt="" />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>Welcome To <br> Healthy Food</strong></h1>
                                    <p class="m-b-40">Healthy Food Luôn là sự lựa chon tôt nhất của bạn</p>
                                    <p class="m-b-40">Đặt món ngay để nhận ưu đãi tốt nhất</p>
                                    <p><a class="btn hvr-hover" href="#">Đặt món</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="slides-navigation">
                    <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                    <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
                </div>
            </div>
            <!-- End Slider -->
            <br><br>
            <div class="container">
                
                <h1 class="text-center text-danger">NHẬN MÃ GIẢM GIÁ NGAY</h1>
            <div style="margin-top: -50px" class="instagram-box">
                    <div class="main-instagram owl-carousel owl-theme">
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma2.jpg" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma3.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma4.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma5.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma6.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma7.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma9.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma1.jpg" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma10.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="ins-inner-box">
                                <a href="#"><img src="<c:url value="/images/ma5.png" />" class="img-fluid" alt="Image" /></a>
                            </div>
                        </div>
                    </div>
                </div>

            <!-- Start Categories  -->
            <div class="categories-shop">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="title-all">
                                <h1>DANH MỤC MÓN ĂN</h1>
                            </div>
                        </div>
                        <c:forEach items="${categories}" var="c">
                            <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                <c:url value="/" var="cUrl" >
                                    <c:param name="cateId" value="${c.id}" />
                                </c:url>
                                <div class="shop-cat-box">
                                    <img src="<c:url value="${c.image}" />" class="img-fluid" alt="" />
                                    <a class="btn hvr-hover" href="${cUrl}">${c.name}</a>
                                </div>
                            </div>
                        </c:forEach>
                        <!--                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                    <div class="shop-cat-box">
                                                        <img src="<c:url value="/images/categories_img_02.jpg" />" class="img-fluid" alt="" />
                                                        <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                    <div class="shop-cat-box">
                                                        <img src="<c:url value="/images/categories_img_03.jpg" />" class="img-fluid" alt="" />
                                                        <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                                                    </div>
                                                </div>-->
                    </div>
                </div>
            </div>
            <!-- End Categories -->

            <!--sale-->
            <!--            <div class="box-add-products">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <div class="offer-box-products">
                                            <img src="<c:url value="/images/add-img-01.jpg" />" class="img-fluid" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <div class="offer-box-products">
                                            <img src="<c:url value="/images/add-img-02.jpg" />" class="img-fluid" alt="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->

            <!-- Start Products  -->
            <div class="products-box">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="title-all text-center">
                                <h1>DANH SÁNH CÁC MÓN ĂN</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="special-menu text-center">
                                <div class="button-group filter-button-group">
                                    <button class="active" data-filter="*">All</button>
                                    <button data-filter=".top-featured">Top featured</button>
                                    <button data-filter=".best-seller">Best seller</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="pagination">
                        <c:forEach begin="1" end="${Math.ceil(foodCounter/pageSize)}" var="i">
                            <c:url value="/" var="u">
                                <c:param name="page" value="${i}"   />
                            </c:url>
                            <li class="page-item"><a class="page-link" href="${u}">Trang ${i}</a></li>
                            </c:forEach>
                    </ul>
                    <br>
                    <div class="row special-list">
                        <c:forEach items="${foods}" var="f">
                            <div class="col-lg-3 col-md-6 special-grid best-seller">
                                <div class="products-single fix">
                                    <div class="box-img-hover">
                                        <div class="type-lb">
                                            <p class="sale">${f.status}</p>
                                        </div>
                                        <img src="<c:url value="${f.image}"/>" class="img-fluid" alt="Image" />
                                        <div class="mask-icon">
                                            <ul>
                                                <li><a href="<c:url value="/food-detail/${f.id}" />" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                            </ul>    
<!--                                            <a class="cart" href="#" onclick="addToCart(${f.id},'${f.name}',${f.price})">DAT MON</a>-->
                                        </div>
                                    </div>
                                    <div class="why-text">

                                        <h4 class="text-center text-info">${f.name}</h4>  
                                        <h4>Loại: ${f.categoryId.name}</h4>
                                        <h4>Cửa hàng: ${f.storeId.name} (${f.storeId.id})</h4>
                                        <h5>
                                            <fmt:formatNumber value="${f.price}" maxFractionDigits="3" type="number" /> VND
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!--                        <div class="col-lg-3 col-md-6 special-grid top-featured">
                                                <div class="products-single fix">
                                                    <div class="box-img-hover">
                                                        <div class="type-lb">
                                                            <p class="new">New</p>
                                                        </div>
                                                      
                                                        <div class="mask-icon">
                                                            <ul>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                            </ul>
                                                            <a class="cart" href="#">Add to Cart</a>
                                                        </div>
                                                    </div>
                                                    <div class="why-text">
                                                        <h4>Lorem ipsum dolor sit amet</h4>
                                                        <h5> $9.79</h5>
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="col-lg-3 col-md-6 special-grid top-featured">
                                                <div class="products-single fix">
                                                    <div class="box-img-hover">
                                                        <div class="type-lb">
                                                            <p class="sale">Sale</p>
                                                        </div>
                                                        <div class="mask-icon">
                                                            <ul>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                            </ul>
                                                            <a class="cart" href="#">Add to Cart</a>
                                                        </div>
                                                    </div>
                                                    <div class="why-text">
                                                        <h4>Lorem ipsum dolor sit amet</h4>
                                                        <h5> $10.79</h5>
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="col-lg-3 col-md-6 special-grid best-seller">
                                                <div class="products-single fix">
                                                    <div class="box-img-hover">
                                                        <div class="type-lb">
                                                            <p class="sale">Sale</p>
                                                        </div>
                                                        <div class="mask-icon">
                                                            <ul>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                            </ul>
                                                            <a class="cart" href="#">Add to Cart</a>
                                                        </div>
                                                    </div>
                                                    <div class="why-text">
                                                        <h4>Lorem ipsum dolor sit amet</h4>
                                                        <h5> $15.79</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                    <!-- End Products  -->

                    <!-- Start Blog  -->
                    <div class="latest-blog">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="title-all text-center">
                                        <h1>HỆ THỐNG CỬA HÀNG CỦA CHÚNG TÔI</h1>
                                        <p>Chúng tôi hợp tác với nhiều cửa hàng trên toàn quốc</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach items="${stores}" var="s">
                                    <div class="col-md-6 col-lg-4 col-xl-4">
                                        <div class="blog-box">
                                            <div class="blog-img">
                                                <img src="<c:url value="${s.image}" />" class="img-fluid" alt="Image" />
                                            </div>
                                            <div class="blog-content">
                                                <div class="title-blog">
                                                    <h3>${s.name}</h3>
                                                    <p>${s.createdDate}</p>
                                                </div>
                                                <ul class="option-blog">
                                                    <li><a href="#"><i class="far fa-heart"></i></a></li>
                                                    <li><a href="<c:url value="/store-detail/${s.id}" />"><i class="fas fa-eye"></i></a></li>
                                                    <li><a href="#"><i class="far fa-comments"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!--                        <div class="col-md-6 col-lg-4 col-xl-4">
                                                            <div class="blog-box">
                                                                <div class="blog-img">
                                                                    <img src="<c:url value="/images/blog-img-01.jpg" />" class="img-fluid" alt="Image" />
                                                                </div>
                                                                <div class="blog-content">
                                                                    <div class="title-blog">
                                                                        <h3>Fusce in augue non nisi fringilla</h3>
                                                                        <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                                                    </div>
                                                                    <ul class="option-blog">
                                                                        <li><a href="#"><i class="far fa-heart"></i></a></li>
                                                                        <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                                                        <li><a href="#"><i class="far fa-comments"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-4 col-xl-4">
                                                            <div class="blog-box">
                                                                <div class="blog-img">
                                                                    <img src="<c:url value="/images/blog-img-02.jpg" />" class="img-fluid" alt="Image" />
                                                                </div>
                                                                <div class="blog-content">
                                                                    <div class="title-blog">
                                                                        <h3>Fusce in augue non nisi fringilla</h3>
                                                                        <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                                                    </div>
                                                                    <ul class="option-blog">
                                                                        <li><a href="#"><i class="far fa-heart"></i></a></li>
                                                                        <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                                                        <li><a href="#"><i class="far fa-comments"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>-->
                            </div>
                        </div>
                    </div>
                    <!-- End Blog  -->

                </div>
                <!-- Start Instagram Feed  -->
                


                <button class="nut-mo-chatbox" onclick="moForm()"><i class="fab fa-facebook-messenger"></i></button>
                <section class="chatbox" id="myForm">
                    <div class="nut-dong-chatbox">
                        <button class="bt" onclick="dongForm()"><i class="fa fa-minus" style="font-size:20px; color: white"></i></button>
                    </div>
                    <section class="chat-window">
                        <li style="display: none" id="name">
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                ${pageContext.request.userPrincipal.name}
                            </c:if>
                        </li>
                        <div id="chat">
                            <!-- messages will display here -->
                            <ul id="messages"></ul>
                        </div>
                    </section>
                    <form class="chat-input" id="message-form">
                        <input id="message-input" type="text" placeholder="Type a message" />
                        <button id="message-btn" type="submit">
                            <i class="fa fa-paper-plane" style="font-size:30px; color: #0084ff;"></i>
                        </button>
                    </form>
                </section>  
                <br><br>
                <br><br>

                <!-- End Instagram Feed  -->


                <script src="<c:url value="/js/cart.js" />"/>
                <script src="<c:url value="/js/food.js" />"></script>
                <script src="<c:url value="/js/stats.js" />"></script>
                <script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-app.js"></script>
                <script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-database.js"></script>
                <script src="<c:url value="/js/chat.js"/>"></script>
                </body>
                </html>
