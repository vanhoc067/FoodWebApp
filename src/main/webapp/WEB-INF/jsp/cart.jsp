<%-- 
    Document   : cart
    Created on : Aug 17, 2022, 10:55:17 AM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >
<script src="<c:url value="/js/cart.js" />"></script>



<h1 class="text-center text-danger">GIỎ HÀNG</h1>

<c:if test="${carts == null}">
    <h4 class="text-danger"> Chưa có món nào!!!</h4>
</c:if>

<c:if test="${carts != null}">
    <table class="table">
        <th>Mã sản phẩm</th>
        <th>Tên sản phẩm</th>
        <th>Đơn giá</th>
        <th>Số lượng</th>
        <th></th>
        <c:forEach items="${carts}" var="c">
            <tr id="food${c.foodId}">
                <td>${c.foodId}</td>
                <td>${c.foodName}</td>
                <td><fmt:formatNumber value="${c.price}" type="number" />  VND</td>
                <td>
                    <div class="form-group">
                        <input type="number" onblur="updateCart(this,${c.foodId})" value="${c.quantity}" class="form-control" />
                    </div>
                </td>
                <td>
                    <input  type="button"  value="Xoa" class="btn btn-danger" onclick="deleteCart(${c.foodId})" />
                </td>
            </tr>
        </c:forEach>       
    </table>
    <input type="button" onclick="order()" value="Đặt hàng" class="btn btn-primary" />
    <br><br>
    <div>
        <h3>Tổng tiến hóa đơn: <span id="amountCart"><fmt:formatNumber value="${cartStats.amount}"/></span> VND</h3>
    </div>
</c:if>   
    
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>