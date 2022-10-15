<%-- 
    Document   : header
    Created on : Aug 9, 2022, 4:02:25 PM
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Start Main Top -->

<div class="main-top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="custom-select-box">
                    <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                        <option>¥ JPY</option>
                        <option>$ USD</option>
                        <option>€ EUR</option>
                    </select>
                </div>
                <div class="right-phone-box">
                    <p>Call US : <a href="#"> 0962243787</a></p>
                </div>
                <div class="our-link">
                    <ul>
                        <li><a href="#"><i class="fa fa-user s_color"></i> My Account</a></li>
                        <li><a href="#"><i class="fas fa-headset"></i> Contact Us</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="text-slid-box">
                    <div id="offer-box" class="carouselTicker">
                        <ul class="offer-box">
                            <li>
                                <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT80
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> 50% - 80% off on Vegetables
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Off 10%! Shop Vegetables
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Off 50%! Shop Now
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Off 10%! Shop Vegetables
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> 50% - 80% off on Vegetables
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT30
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Off 50%! Shop Now 
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Main Top -->
<!-- Start Main Top -->
<header class="main-header">
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#"><img src="<c:url value="/images/logo.JPG"/>" class="logo" alt=""/></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="nav-item active"><a class="nav-link" href="<c:url value="/" />">Trang chu</a></li>
                    <c:if  test="${pageContext.request.userPrincipal.name == null}">
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Khu vực</a>
                            <ul class="dropdown-menu">
                                <li><a href="shop.html">tp.HCM</a></li>
                                <li><a href="shop-detail.html">Binh Dương</a></li>
                                <li><a href="cart.html">Đòng Nai</a></li>
                                <li><a href="checkout.html">Lâm Đồng</a></li>
                                <li><a href="my-account.html">Tây Ninh</a></li>
                                <li><a href="wishlist.html">Đà Nẵng</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="about.html">Về chúng tôi</a></li>
                        <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/login" />">Đăng nhập</a></li>
                        <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/register" />">Đăng kí</a></li>
                    </c:if>
                    <c:if  test="${pageContext.request.userPrincipal.name != null}">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/admin/user" />">Quản lý người dùng</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/admin/food_admin" />">Quản lý món ăn</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/admin/stats" />">Thống kê</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/" />">
                                    <c:if test="${currentUser.image != null}">
                                        <img style="width:30px;" src="${currentUser.image}" class="rounded-circle" /> 
                                    </c:if>
                                    <c:if test="${currentUser.image == null}">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </c:if>
                                    ${pageContext.request.userPrincipal.name}
                                </a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/logout" />">Đăng xuất</a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_STORE')">
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/store/food" />">Quản lý món ăn</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/store/store_bill" />">Quản lý đơn hàng</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/store/followdetail" />">Follower</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/store/stats" />">Thống kê</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/" />">
                                    <c:if test="${currentUser.image != null}">
                                        <img style="width:30px" src="${currentUser.image}" class="rounded-circle" /> 
                                    </c:if>
                                    <c:if test="${currentUser.image == null}">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </c:if>
                                    ${pageContext.request.userPrincipal.name}
                                </a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/logout" />">Đăng xuất</a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_USER')">
                            <li class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Khu vực</a>
                                <ul class="dropdown-menu">
                                    <li><a href="shop.html">tp.HCM</a></li>
                                    <li><a href="shop-detail.html">Binh Dương</a></li>
                                    <li><a href="cart.html">Đòng Nai</a></li>
                                    <li><a href="checkout.html">Lâm Đồng</a></li>
                                    <li><a href="my-account.html">Tây Ninh</a></li>
                                    <li><a href="wishlist.html">Đà Nẵng</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="about.html">Về chúng tôi</a></li>
                            <li class="nav-item"><a class="nav-link" href="gallery.html">Cửa hàng gần bạn</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/bill" />">Hóa đơn</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/" />">
                                    <c:if test="${currentUser.image != null}">
                                        <img style="width:30px" src="${currentUser.image}" class="rounded-circle" /> 
                                    </c:if>
                                    <c:if test="${currentUser.image == null}">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </c:if>
                                    ${pageContext.request.userPrincipal.name}
                                </a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/logout" />">Đăng xuất</a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('null')">
                            <li class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Khu vực</a>
                                <ul class="dropdown-menu">
                                    <li><a href="shop.html">tp.HCM</a></li>
                                    <li><a href="shop-detail.html">Binh Dương</a></li>
                                    <li><a href="cart.html">Đòng Nai</a></li>
                                    <li><a href="checkout.html">Lâm Đồng</a></li>
                                    <li><a href="my-account.html">Tây Ninh</a></li>
                                    <li><a href="wishlist.html">Đà Nẵng</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="about.html">Về chúng tôi</a></li>
                            <li class="nav-item"><a class="nav-link" href="gallery.html">Cửa hàng gần bạn</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/login" />">Đăng nhập</a></li>
                            <li class="nav-item"><a class="nav-link text-danger" href="<c:url value="/register" />">Đăng kí</a></li>
                        </sec:authorize>
                    </c:if>
                        
                </ul>
            </div>
            <!-- /.navbar-collapse -->

            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                    <!--                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>-->
                    <li>  

                        <a href="<c:url value="/cart" />"> 
                            <h3>My cart</h3>
                            <i class="fa-solid fa-cart-shopping"></i>
                            <div class="badge bg-primary" id="cartCounter">${cartCounter}</div>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- End Atribute Navigation -->
        </div>
        <!-- Start Side Menu -->
        <!--        <div class="side">
                    <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                    <li class="cart-box">
                        <ul class="cart-list">
                            <li>
                                <a href="#" class="photo"><img src="images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                                <h6><a href="#">Delica omtantur </a></h6>
                                <p>1x - <span class="price">$80.00</span></p>
                            </li>
                            <li>
                                <a href="#" class="photo"><img src="images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                                <h6><a href="#">Omnes ocurreret</a></h6>
                                <p>1x - <span class="price">$60.00</span></p>
                            </li>
                            <li>
                                <a href="#" class="photo"><img src="images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                                <h6><a href="#">Agam facilisis</a></h6>
                                <p>1x - <span class="price">$40.00</span></p>
                            </li>
                            <li class="total">
                                <a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                                <span class="float-right"><strong>Total</strong>: $180.00</span>
                            </li>
                        </ul>
                    </li>
                </div>-->
        <!-- End Side Menu -->
    </nav>
    <!-- End Navigation -->
</header>
<!-- End Main Top -->

<!-- Start Top Search -->
<div class="top-search">
    <div class="container">
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-search"></i></span>
            <input type="text" class="form-control" placeholder="Search">
            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
        </div>
    </div>
</div>
<!-- End Top Search -->
