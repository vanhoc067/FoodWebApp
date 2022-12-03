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
<c:url value="/store/fooddetail/${foodID}" var="action"/>

<div class="container">
    <form:form method="post" action="${action}" modelAttribute="updateFood">
        <form:errors path="*"  element="div" cssClass="alert alert-danger"/>
        <div class="row">
            <div class="col-6" style="text-align: center; margin-top: 20px">
                <img style="width:400px; border-radius: 50% " src="<c:url value="${foodDetail.image}"/>" class="img-fluid" alt="Image" />
            </div>
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <div class="form-group">
                        <label for="firstname" >Name</label>
                        <form:input type="text" id="name" path="name" class="form-control editInputForm" value="${foodDetail.name}"/>
                    </div>
                    <div class="form-group">
                        <label for="lastname" >Quantity</label>
                        <form:input type="number" id="quantity" path="quantity" class="form-control editInputForm" value="${foodDetail.quantity}"/>
                    </div>
                    <div class="form-group">
                        <label for="email" >Status</label>
                        <form:input type="text" id="status" path="status" class="form-control editInputForm" value="${foodDetail.status}"/>
                    </div>
                    <div class="form-group">
                        <label for="phone" >Price</label>
                        <form:input type="number" id="price" path="price" class="form-control editInputForm" value="${foodDetail.price}"/>
                    </div>
                    <div style="margin-top: 10px">
                        <input type="submit" value="Update" class="btn btn-danger" />
                    </div>
                    <br><br>
                </div>
            </div>
        </form:form>
    </div>
