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


<h1 class="text-center text-danger">QUAN LY MON AN</h1>

<c:url value="/admin/food" var="action" />
<form:form method="post" action="${action}" modelAttribute="food">
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" path="name" class="form-control" id="name" placeholder="name" name="name" />
        <label for="name">Ten mon an</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" path="price" class="form-control" id="price" placeholder="price" name="price" />
        <label for="name">Gia mon an</label>
    </div>
    <div class="form-floating">
        <form:select path="categoryId" class="form-select" id="cate" name="cate">
            <c:forEach items="${categories}" var="c">
               <option id="${c.id}">${c.name}</option> 
            </c:forEach>
        </form:select>
        <label for="sel1" class="form-label">Danh muc mon an</label>
    </div>
        <br>
    <div class="form-floating">
        <form:select path="storeId" class="form-select" id="store" name="store">
            <c:forEach items="${stores}" var="s">
               <option id="${s.id}">${s.name}</option> 
            </c:forEach>
        </form:select>
        <label for="sel1" class="form-label">Danh sach cua hang</label>
    </div>
        <br>
        <div>
            <input type="submit" value="Them san pham" class="btn btn-danger" />
        </div>
</form:form>


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