<%-- 
    Document   : success
    Created on : Aug 25, 2022, 3:20:08 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/css/style.css" var="css" />
        <link href="${css}" rel="stylesheet" >
<c:url value="/success/${testID}" var="action" />
        
<h1 class="text-center text-info">Thanh toán thanh công</h1>

<div style="text-align: center">
    <form:form method="post" action="${action}" modelAttribute="foodOrder">
        <form:errors path="*"  element="div" cssClass="alert alert-danger"/>

        <div class="form-floating mb-3 mt-3">
            <form:input type="number" path="status" class="form-control" id="status" placeholder="status" name="status" value="1" style="display: none"/>
        </div>

        <div>
            <input type="submit" value="xat nhan" class="btn btn-danger" />
        </div>
            <br>
    </form:form>
</div>