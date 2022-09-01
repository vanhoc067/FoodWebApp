<%-- 
    Document   : store-detail
    Created on : Aug 22, 2022, 4:34:10 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >


<h1 class="text-center text-primary">THONG TIN CUA HANG</h1>
<div class="row">
    <div class="col-md-4">
        <img id="myImg"  class="rounded" src="${store.image}" alt="${store.name}" />
    </div>
    <div class="col-md-8">
        <h1>${store.name}</h1>
        <p>${store.createdDate}</p>
        <br>
    </div>
    <br><br>
</div>
