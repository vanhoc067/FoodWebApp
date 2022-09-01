<%-- 
    Document   : register
    Created on : Aug 25, 2022, 4:34:24 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >


<c:url value="/register" var="action" />
<div class="container">
    <h1 class="text-center text-danger">DANG KI</h1>

    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">
            ${errMsg}
        </div>
    </c:if>

    <form:form method="post" enctype="multipart/form-data" action="${action}" modelAttribute="user">
        <div class="form-group">
            <label for="firstname" >First name</label>
            <form:input type="text" id="firstname" path="firstName" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="lastname" >Last name</label>
            <form:input type="text" id="lastname" path="lastName" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="email" >Email</label>
            <form:input type="email" id="email" path="email" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="phone" >Phone</label>
            <form:input type="text" id="phone" path="phone" class="form-control"/>
        </div>
<!--        <div class="form-group">
            <label for="address" >address</label>
            <form:input type="text" id="address" path="address" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="dateOfBirth" >Date Of Birth</label>
            <form:input type="date" id="dateOfBirth" path="dateOfBirth" class="form-control"/>
        </div>-->
        <div class="form-group">
            <label for="username" >Username</label>
            <form:input type="text" id="username" path="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="password" >Password</label>
            <form:input type="password" id="password" path="password" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="confirm-password" >Confirm Password</label>
            <form:input type="password" id="confirm-password" path="confirmPassword" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="avatar" >Avatar</label>
            <form:input type="file" id="avatar" path="file" class="form-control"/>
        </div>
        <div class="form-group">
            <input type="submit" value="DANG KI" class="btn btn-danger"/>
        </div>
    </div>
</form:form>