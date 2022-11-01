<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<script src="sweetalert2.all.min.js"></script>
<c:url value="/admin/userdetail/${intId}" var="updateUser"/>

<div class="container">
    
    <c:if test="${userById.active == 1}" >
        <c:set var="check" value="checked"/>
    </c:if>
    
    <form:form method="post" action="${updateUser}" modelAttribute="updateUser">
        <form:errors path="*"  element="div" cssClass="alert alert-danger"/>
        <div class="row">
            <div class="col-6" style="text-align: center; margin-top: 20px">
                <img style="width:400px; border-radius: 50% " src="<c:url value="${userById.image}"/>" class="img-fluid" alt="Image" />
            </div>
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <div class="form-group">
                        <label for="firstname" >First name</label>
                        <form:input type="text" id="firstname" path="firstName" class="form-control editInputForm" value="${userById.firstName}"/>
                    </div>
                    <div class="form-group">
                        <label for="lastname" >Last name</label>
                        <form:input type="text" id="lastname" path="lastName" class="form-control editInputForm" value="${userById.lastName}"/>
                    </div>
                    <div class="form-group">
                        <label for="email" >Email</label>
                        <form:input type="email" id="email" path="email" class="form-control editInputForm" value="${userById.email}"/>
                    </div>
                    <div class="form-group">
                        <label for="phone" >Phone</label>
                        <form:input type="text" id="phone" path="phone" class="form-control editInputForm" value="${userById.phone}"/>
                    </div>
                    <div class="switch-holder">
                        <div class="switch-label">
                            <span><b>Active</b></span>
                        </div>
                        <div class="switch-toggle">
                            <input type="checkbox" ${check} id="bluetooth">
                            <label for="bluetooth"></label>
                        </div>
                    </div>
                    <div>
                        <input type="submit" value="Update" class="btn btn-danger" />
                    </div>
                    <br><br>
                </div>
            </div>

        </form:form>
    </div>