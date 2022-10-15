<%-- 
    Document   : store-detail
    Created on : Aug 22, 2022, 4:34:10 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<c:url value="/api/follow/" var="enpoint" />

<div class="container">
    <h1 class="text-center text-primary">THONG TIN CUA HANG</h1>
    <div class="row">
        <div class="col-md-4">
            <img id="myImg"  class="rounded" src="${store.image}" alt="${store.name}" />
        </div>
        <div class="col-md-8">
            <h1>${store.name}</h1>
            <p>${store.description}</p>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.9250508686428!2d106.67491891472206!3d10.817047661400663!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528e1f241211f%3A0xc9ef195798144b1f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBN4bufIFRQLkhDTSAtIEPGoSBz4bufIDM!5e0!3m2!1svi!2s!4v1662093443275!5m2!1svi!2s" width="500" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <br><br>
        </div>
        <br><br>
    </div>
    <br><br>

    <c:forEach items="${follow}" var="f">
        <c:if test="${store.id == f.followId.id}">
            <c:if test="${currentUser.id == f.userId.id}">
                <c:set var="check" value="false"/>
                <c:set var="id" value="${f.id}"/>
            </c:if>
        </c:if>
    </c:forEach>

    
    <form:form method="post" action="${addFollow}" modelAttribute="followdetail">
        <div class="form-floating mb-3 mt-3" style="display: none">
            <form:input type="number" path="id" class="form-control" id="id" placeholder="id" name="id" />
            <label for="id">Id</label>
        </div>
        <div class="form-floating mb-3 mt-3" style="display: none">
            <form:input path="userId" class="form-control" id="userId" placeholder="user" name="userId" value="${currentUser.id}" />
        </div>
        <div class="form-floating mb-3 mt-3" style="display: none">
            <form:input path="followId" class="form-control" id="followId" placeholder="follow" name="followId" value="${store.id}"/>
        </div>
            <div class="form-floating mb-3 mt-3" style="display: none">
            <form:input type="email" path="email" class="form-control" id="email" placeholder="email" name="email" value="${currentUser.email}"/>
        </div>
        <br>
        <sec:authorize access="isAuthenticated()">
            <c:if test="${check != 'false'}">
                <button type="submit" class="btn btn-danger" >Theo giỏi</button>
            </c:if>
            <c:if test="${check == 'false'}">
                <button id ="btnXoa" type="button" class="btn btn-danger" onclick="deletefollow('${enpoint} + ${id}', ${id})" >Đã theo giỏi</button>
            </c:if>   
        </sec:authorize>
            <br><br>
    </form:form>
    



    <c:url value="/api/store-detail/${store.id}/comments" var="endpoint" />
    <sec:authorize access="!isAuthenticated()">
        <div class="display-6">
            <strong clas="display-5">Vui lòng <a class="text-danger " href="<c:url value="/login"/>"><ins>đăng nhập</ins></a> để bình luận </strong>
        </div>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <form>  
            <div class="form-group">
                <textarea id="contentId" class="form-control" placeholder="Nhap danh gia cua ban..."></textarea>
                <br> 
            </div>
            <button class="btn delete" onclick="addStoreComment('${endpoint}',${store.id})" >Thêm bình luận</button>
        </form>
    </sec:authorize>

    <br><br>




    <h1 class="display-7 fw-bolder text-primary text-center">ĐÁNH GIÁ CỬA HÀNG</h1>

    <div id="store-comments" class="my-3 p-3 bg-body rounded shadow-sm">

    </div>        
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/store.js  " />"></script>
<script>

    window.onload = function () {
        loadStoreComments('${endpoint}');
    }
</script>
