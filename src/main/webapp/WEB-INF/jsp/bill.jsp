<%-- 
    Document   : bill
    Created on : Aug 31, 2022, 10:25:30 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/css/style.css" var="css" />
<c:url value="/css/bill.css" var="css1" />
<link href="${css}" rel="stylesheet" >
<link href="${css1}" rel="stylesheet" >

<div class="container">
    <div class="row gutters">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="invoice-container">
                        <div class="invoice-body">
                            <!-- Row start -->
                            <div class="row gutters">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="table-responsive">
                                        <table class="table custom-table m-0 table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên khách hàng</th>
                                                    <th>Ngày tạo</th>
                                                    <th>Thành tiền</th>
                                                    <th>Thanh toán</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bill}" var="b">
                                                    <c:if test="${currentUser.id == b.userId.id}">
                                                        <c:set var="check" value="true"></c:set>
                                                        <tr style="padding:30px">
                                                            <td>${b.id}</td>
                                                            <td>${b.userId.username}</td>
                                                            <td>${b.createdDate}</td>

                                                            <td>${b.amount}</td>
                                                            <td style="text-align: center">
                                                                <c:if test="${b.status == 1}">
                                                                    <i style="color: green; font-size: 30px;" class="fa-solid fa-circle-check"></i>
                                                                </c:if>
                                                                <c:if test="${b.status == 0}">
                                                                    <div class="d-grid" style="display: flex">
                                                                        <a style="text-align: center" href="#" /><button style="width:150px; margin: 3px" class="btn btn-danger btn-block">Thanh toán tiền mặt</button></a>
                                                                        <a style="text-align: center" href="<c:url value="/bill_detail/${b.id}" />"><button style="width:150px; margin: 3px" class="btn btn-danger btn-block">Thanh toán online</button></a>
                                                                    </div>
                                                                </c:if>

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

    
