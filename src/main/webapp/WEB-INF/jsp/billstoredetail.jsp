<%-- 
    Document   : food-store-detial
    Created on : Oct 30, 2022, 10:48:48 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<script src="sweetalert2.all.min.js"></script>
<c:url value="/store/billstoredetail/${billID}" var="action"/>

<div class="container">
    <form:form method="post" action="${action}" modelAttribute="updateBill">
        <form:errors path="*"  element="div" cssClass="alert alert-danger"/>
        <div class="row">
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <div class="form-group">
                        <label for="firstname" >Food</label>
                        <form:input type="text" id="foodId" path="foodId" class="form-control editInputForm" value="${billDetail.foodId.name}"/>
                    </div>
                    <div class="form-group">
                        <label for="firstname" >Unit Price</label>
                        <form:input type="number" id="unitPrice" path="unitPrice" class="form-control editInputForm" value="${billDetail.unitPrice}"/>
                    </div>
                    <div class="form-group">
                        <label for="firstname" >Food Quantity</label>
                        <form:input type="number" id="foodQuantity" path="foodQuantity" class="form-control editInputForm" value="${billDetail.foodQuantity}"/>
                    </div>
                    <div class="mt-3">
                        <input type="submit" value="Update" class="btn btn-danger" />
                    </div>
                    <br><br>
                </div>
            </div>

        </form:form>
    </div>
