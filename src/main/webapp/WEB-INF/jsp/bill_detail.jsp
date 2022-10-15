<%-- 
    Document   : bill_detail
    Created on : Aug 31, 2022, 12:56:11 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value="/css/style.css" var="css" />
<c:url value="/css/bill.css" var="css1" />
<link href="${css}" rel="stylesheet" >
<link href="${css1}" rel="stylesheet" >

<br><br>
<div align="center">
<h1 class="text-info">THANH TOÁN BẰNG PAYPAL</h1>
    <form action="authorize_payment" method="post">
        <table>
            <tr>
                <td>Mã đơn hàng:</td>
                <td><input type="text" name="product" value="${bill.id}"/></td>
            </tr>
            <tr>
                <td>Giá sản phẩm:</td>
                <td><input type="text" name="subtotal" value="${bill.amount}"/></td>
            </tr>
            <tr>
                <td>Tổng tiền thanh toán: </td>
                <td><input type="text" name="total" value="${bill.amount}"/></td>
            </tr>
            <tr>
                <td  colspan="2" align="center">
                    <input style="color: blue;" type="submit" value="Thanh toán"/>
                </td>
            </tr>
        </table>
    </form>
</div>
            
<br><br>
            
            
            
 