<%-- 
    Document   : user
    Created on : Aug 30, 2022, 4:06:27 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value="/css/style.css" var="css" />
        <link href="${css}" rel="stylesheet" >
        
<h1 class="text-center text-info">QUẢN LÝ NGƯỜI DÙNG</h1>

<div class="spinner-border text-primary" id="myLoading"></div>

<table class="table">
    <tr>
        <th>id</th>
        <th>UserName</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Date of Birth</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Active</th>
        <th>Role</th>
        <th></th>
    </tr>
    <tbody id="adminUser">

    </tbody>
</table>

<script src="<c:url value="/js/user.js" />"></script>

<script>
    <c:url value="/api/user" var="endpoint" />
    window.onload = function(){
        loadAdminUser(`${endpoint}`);
    }
</script>
