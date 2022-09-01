<%-- 
    Document   : login
    Created on : Aug 25, 2022, 4:17:40 PM
    Author     : thinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >


<c:url value="/login" var="action" />
<div class="container">
    <h1 class="text-center text-info display-6 ">DANG NHAP</h1>

    <c:if test="${param.error != null}">
        <div class="alert alert-danger">
            Da xay ra loi!!
        </div>
    </c:if>
    <c:if test="${param.accessDenied != null}">
        <div class="alert alert-danger" >
            Bạn không có quyền truy cập!!
        </div>
    </c:if>


    <form method="post" action="${action}">
        <div class="form-group">
            <label for="username" >Username</label>
            <input type="text" id="username" name="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="password" >Password</label>
            <input type="password" id="password" name="password" class="form-control"/>
        </div>
        <br>
        <div class="form-group">
            <input type="submit" value="DANG NHAP" class="btn btn-danger"/>
        </div>
        <br>
</div>
</form>

        