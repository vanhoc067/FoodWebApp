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
<c:choose>
    <c:when test="${currentUser.id != null}">
        <c:set var="vanhoc" value="com.dvh.pojo.User[ id=${currentUser.id} ]"/>
    </c:when>
</c:choose>





<h1 class="text-center text-danger">QUAN LY MON AN</h1>


<c:url value="/admin/food" var="action" />
<div class="container">
<form:form method="post" action="${add}" modelAttribute="food" enctype="multipart/form-data">
    <form:errors path="*"  element="div" cssClass="alert alert-danger"/>
    
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" path="name" class="form-control" id="name" placeholder="name" name="name" />
        <label for="name">Ten mon an</label>
        <form:errors path="name" element="div" cssClass="invalid-feedback"/>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" path="price" class="form-control" id="price" placeholder="price" name="price" />
        <label for="name">Gia mon an</label>
        <form:errors path="price" element="div" cssClass="invalid-feedback"/>
    </div>
    <div class="form-floating">
        <form:select path="categoryId" class="form-select" id="cate" name="cate">
            <c:forEach items="${categories}" var="c">
               <option value="${c.id}">${c.name}</option> 
            </c:forEach>
        </form:select>
        <label for="cate" class="form-label">Danh muc mon an</label>
    </div>
        <br>
    <div class="form-floating">

        <form:select path="storeId" class="form-select" id="store" name="store">
            <c:forEach items="${stores}" var="s">
                <c:if test="${s.userId == vanhoc}">
                    <option value="${s.id}">${s.name}</option>
                </c:if> 
            </c:forEach>
        </form:select>

      
        <label for="store" class="form-label">Danh sach cua hang</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" path="file" class="form-control" id="file" placeholder="image" name="image" />
        <label for="image">Anh mon an</label>
    </div>
        <br>
        <div>
            <input type="submit" value="Them san pham" class="btn btn-danger" />
        </div>
        <br><br>
</form:form>

    <div class="row gutters">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="invoice-container">
                        <div class="invoice-header">
                            <!-- Row end -->
                            <!-- Row start -->
                            <div class="row gutters">
                                <div class="col-xl-19 col-lg-9 col-md-12 col-sm-12 col-12">
                                    <div class="invoice-details">
                                    </div>
                                </div>
                            </div>
                            <!-- Row end -->
                        </div>
                        <div class="invoice-body">
                            <!-- Row start -->
                            <div class="row gutters">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="table-responsive">
                                        <table class="table custom-table m-0 table-striped">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Name</th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${foodList}" var="f">
                                                    <c:if test="${currentUser.id == f.storeId.userId.id}">
                                                        <c:set var="check" value="true"/>
                                                        <tr style="padding:30px">
                                                            <td><img style="width:120px" src="<c:url value="${f.image}"/>" class="img-fluid" alt="Image" /></td>
                                                            <td>${f.name}</td>
                                                            <td>${f.quantity}</td>

                                                            <td>${f.price}</td> 
                                                            <td></td>  
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                            <c:if test="${check == false}">
                                                <h3 class="text-danger">Không có đơn hàng nào!</h3>
                                            </c:if>
                                        </table>
                                    </div>
                                </div>
                            </div><!--
                            <!-- Row end -->
                        </div>
                        <div class="invoice-footer">
                            <h1>Thank you for Buying.</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>