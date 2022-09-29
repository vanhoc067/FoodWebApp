<%-- 
    Document   : food
    Created on : Aug 16, 2022, 6:21:40 PM
    Author     : thinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<script src="sweetalert2.all.min.js"></script>

<div class="container">
    <div class="spinner-border text-secondary" id="mySpinner"></div>
    <table class="table table-bordered">
        <tr>
            <th></th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th></th>
        </tr>
        <tbody id="myFood">

        </tbody>
    </table>

    <script src="<c:url value="/js/food.js"/>"></script>
    <script>
        <c:url value="/api/food" var="u" />

    window.onload = function () {
        getFood('${u}');
    }
    </script>
</div>