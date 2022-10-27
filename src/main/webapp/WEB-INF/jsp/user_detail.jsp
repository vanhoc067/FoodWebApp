<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<script src="sweetalert2.all.min.js"></script>
<c:url value="/admin/user_detail/${userById.id}" var="update"/>

<div class="container">
<form:form method="post" action="${update}" modelAttribute="updateUser">
    <form:errors path="*"  element="div" cssClass="alert alert-danger"/>
    <div class="row">
        <div class="col-6" style="text-align: center; margin-top: 20px">
            <img style="width:400px; border-radius: 50% " src="<c:url value="${userById.image}"/>" class="img-fluid" alt="Image" />
        </div>
        <div class="col-6">
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" path="firstName" class="form-control" id="firstName" placeholder="firstName" name="firstName" value="${userById.firstName}" />
                <label for="name">First Name</label>
                <form:errors path="firstName" element="div" cssClass="invalid-feedback"/>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" path="lastName" class="form-control" id="lastName" placeholder="lastName" name="lastName" value="${userById.lastName}"/>
                <label for="name">Last Name</label>
                <form:errors path="lastName" element="div" cssClass="invalid-feedback"/>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" path="phone" class="form-control" id="phone" placeholder="phone" name="phone" value="${userById.phone}"/>
                <label for="name">Phone</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="email" path="email" class="form-control" id="email" placeholder="email" name="email" value="${userById.email}"/>
                <label for="name">Email</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" path="address" class="form-control" id="address" placeholder="address" name="address" value="${userById.address}"/>
                <label for="name">Address</label>
            </div>
<!--            <div class="squaredcheck">
                <input type="checkbox" value="None" id="squaredcheck" class="checkbox1" name="check" value="1" />
                <label for="squaredcheck"><span>Active</span></label>
             </div>-->
        <div>
            <input type="submit" value="Update" class="btn btn-danger" />
        </div>
        <br><br>
        </div>
    </div>
        
</form:form>
</div>