<%-- 
    Document   : success
    Created on : Aug 25, 2022, 3:20:08 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value="/css/style.css" var="css" />
        <link href="${css}" rel="stylesheet" >

        
<h1 class="text-center text-info">Thanh toán thanh công</h1>

<!--<form action="bill" method="post">
        <input style="color: red;" type="submit" value="Xát nhận"/>
</form>-->

<a style="text-align: center" href="<c:url value="/bill/?${testID}" />"><button style="width:150px; margin: 3px" class="btn btn-danger btn-block">xat nhan</button></a>