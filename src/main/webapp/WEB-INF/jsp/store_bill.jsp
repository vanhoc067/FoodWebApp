<%-- 
    Document   : store_bill
    Created on : Sep 29, 2022, 11:10:23 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<script src="sweetalert2.all.min.js"></script>
<script src="<c:url value="/js/bill.js"/>"></script>
<c:url value="/api/bill/" var="enpoint" />

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
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên Món ăn</th>
                                                    <th>Mã hóa đơn</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bill}" var="b">
                                                    <c:if test="${currentUser.id == b.foodId.storeId.id}">
                                                        <c:set var="check" value="true"/>
                                                        <tr style="padding:30px" id="row${b.id}">
                                                            <td>${b.id}</td>
                                                            <td>${b.foodId.name}</td>
                                                            <td>${b.orderId.id}</td>

                                                            <td>${b.unitPrice}</td> 
                                                            <td>
                                                                <div class="spinner-border text-primary" style="display:none" id="load${b.id}"></div>
                                                                <button id ="btn${b.id}" class="btn btn-danger" onclick="deleteBillByStore('${enpoint} + ${b.id}', ${b.id})" >Xoa</button>
                                                                <button class="btn btn-primary" >sửa</button>
                                                            </td>  
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