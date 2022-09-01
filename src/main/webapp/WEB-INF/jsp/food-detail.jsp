<%-- 
Document   : food-detail
Created on : Aug 16, 2022, 6:29:00 PM
Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<link rel="stylesheet" href="css/login.css">


<h1 class="text-center text-primary">THONG TIN MON AN</h1>

<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${food.image}" alt="..." /></div>
            <div class="col-md-6">
                <h1 class="display-4 fw-bolder">${food.name}</h1>
                <div class="fs-5 mb-5">
                    Giá tien: <fmt:formatNumber value="${food.price}" type="number"/> VND
                </div>
                <h3>${food.description}</h3>
                <br>
                <sec:authorize access="!isAuthenticated()">
                    <div class="display-6">
                        <strong clas="display-5">Vui lòng <a class="text-danger " href="<c:url value="/login"/>"><ins>đăng nhập</ins></a> để đặt hàng</strong>
                    </div>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="d-flex">
                        <button onclick="addToCart(${food.id}, '${food.name}',${food.price})" class="btn btn-outline-dark flex-shrink-0" type="button">
                            <i class="fa-solid fa-bag-shopping"></i>
                            Add to cart
                        </button>
                    </div>
                </sec:authorize>
            </div>
        </div>
    </div>
</section>


<!--<div class="row">
    <div class="col-md-4">
        <img id="myImg"  class="rounded" src="${food.image}" alt="${food.name}" />
    </div>
    <div class="col-md-8">
        <h1>${food.name}</h1>
        <h3 class="text-danger">
<fmt:formatNumber value="${food.price}" type="number"/> VND
</h3>
<p>${food.description}</p>
<br>
<div>
<input type="button" value="Dat mon" class="btn btn-outline-primary btn-lg" onclick="addToCart(${food.id}, '${food.name}',${food.price})"/>
</div>
</div>
<br><br>
</div>-->
<c:url value="/api/food/${food.id}/comments" var="endpoint" />
<sec:authorize access="!isAuthenticated()">
    <div class="display-6">
        <strong clas="display-5">Vui lòng <a class="text-danger " href="<c:url value="/login"/>"><ins>đăng nhập</ins></a> để bình luận</strong>
    </div>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <form>  
        <div class="form-group">
            <textarea id="contentId" class="form-control" placeholder="Nhap danh gia cua ban..."></textarea>
            <br> 
        </div>
        <button class="btn delete" onclick="addComment('${endpoint}',${food.id})" >Them binh luan</button>
    </form>
</sec:authorize>
<br><br>




<h1 class="display-7 fw-bolder text-primary">DANH GIA SAN PHAM</h1>
<!--
<ul id="comments" class="list-group">
    
</ul>-->


<div id="comments" class="my-3 p-3 bg-body rounded shadow-sm">

</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/food.js  " />"></script>
<script>

            window.onload = function () {
                loadComments('${endpoint}');
            }
</script>
