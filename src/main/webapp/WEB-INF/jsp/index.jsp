<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FoodWebApp</title>
        <c:url value="/css/style.css" var="css" />
        <link href="${css}" rel="stylesheet" >
    </head>

    <body>
        <div class="container">
            <!-- Start Slider -->
            <div id="slides-shop" class="cover-slides">
                <ul class="slides-container">
                    <li class="text-center">
                        <img src="<c:url value="/images/banner-01.jpg" />" alt="" />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                                    <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                                    <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="text-center">
                        <img src="<c:url value="/images/banner-02.jpg" />" alt="" />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                                    <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                                    <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="text-center">
                        <img src="<c:url value="/images/banner-03.jpg" />" alt="" />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                                    <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                                    <p><a class="btn hvr-hover" href="#">Shop New</a></p>
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

            <!-- Start Categories  -->
            <div class="categories-shop">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="shop-cat-box">
                                <img src="<c:url value="/images/categories_img_01.jpg" />" class="img-fluid" alt="" />
                                <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
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
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Categories -->

            <!--sale-->
            <div class="box-add-products">
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
            </div>

            <!-- Start Products  -->
            <div class="products-box">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="title-all text-center">
                                <h1>Fruits & Vegetables</h1>
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

                    <div class="row special-list">
                        <div class="col-lg-3 col-md-6 special-grid best-seller">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <div class="type-lb">
                                        <p class="sale">Sale</p>
                                    </div>
                                    <img src="<c:url value="/images/img-pro-01.jpg" />" class="img-fluid" alt="Image" />
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
                                    <h5> $7.79</h5>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 special-grid top-featured">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <div class="type-lb">
                                        <p class="new">New</p>
                                    </div>
                                    <img src="<c:url value="/images/img-pro-02.jpg" />" class="img-fluid" alt="Image" />
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
                                    <img src="<c:url value="/images/img-pro-03.jpg" />" class="img-fluid" alt="Image" />
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
                                    <img src="<c:url value="/images/img-pro-04.jpg" />" class="img-fluid" alt="Image" />
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
            </div>
            <!-- End Products  -->

            <!-- Start Blog  -->
            <div class="latest-blog">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="title-all text-center">
                                <h1>latest blog</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-4 col-xl-4">
                            <div class="blog-box">
                                <div class="blog-img">
                                    <img src="<c:url value="/images/blog-img.jpg" />" class="img-fluid" alt="Image" />
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
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Blog  -->

        </div>
        <!-- Start Instagram Feed  -->
        <div class="instagram-box">
            <div class="main-instagram owl-carousel owl-theme">
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-01.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-02.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-03.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-04.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-05.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-06.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-07.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-08.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-09.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="<c:url value="/images/instagram-img-05.jpg" />" class="img-fluid" alt="Image" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Instagram Feed  -->
    </body>
</html>
