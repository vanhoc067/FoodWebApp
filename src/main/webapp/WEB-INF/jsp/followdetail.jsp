<%-- 
    Document   : followdetail
    Created on : Oct 2, 2022, 2:05:04 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<script src="sweetalert2.all.min.js"></script>
<script src="<c:url value="/js/follow.js"/>"></script>

<c:url value="/api/follow/" var="enpoint" />

<div class="container">
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
                                                    <th>Mã người theo giỏi</th>
                                                    <th>Tên</th>
                                                    <th>Email</th>
                                                    <th>Cửa hàng theo giỏi</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${follow}" var="f">
                                                    <c:forEach items="${stores}" var="s">
                                                        <c:if test="${currentUser.id == s.userId.id and s.id == f.followId.id}">
                                                            <c:set var="check" value="true"/>
                                                            <tr id="row${f.id}" style="padding:30px">
                                                                <td>${f.id}</td>
                                                                <td>${f.userId.username}</td>
                                                                <td>${f.email}</td>
                                                                <td>${f.followId.content}</td>
                                                                <td>
                                                                    <div class="spinner-border text-primary" style="display:none" id="load${f.id}"></div>
                                                                    <button id="btn${f.id}" class="btn btn-danger" onclick="deletefollow('${enpoint} + ${f.id}', ${f.id})">Xóa</button>
                                                                    <button class="btn btn-primary" >Sửa</button>
                                                                </td>  
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </tbody>
                                            <c:if test="${check == false}">
                                                <h3 class="text-danger">Không có người theo giỏi nào!</h3>
                                            </c:if>
                                        </table>
                                    </div>
                                </div>
                            </div><!--
                            <!-- Row end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
