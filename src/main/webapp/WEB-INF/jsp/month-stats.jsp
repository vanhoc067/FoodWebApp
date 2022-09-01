<%-- 
    Document   : month-stats
    Created on : Aug 27, 2022, 10:53:45 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >

<h1 class="text-center">THONG KE DOANH THU THEO THANG,QUY,NAM</h1> 

<form action="">
    <div class="form-group">
        <label>Nhap ten mon an</label>
        <input type="text" name="kw" class="form-control" />
    </div>
    <div class="form-group">
        <label>Tu thoi diem</label>
        <input type="date" name="fromDate" class="form-control" />
    </div>
    <div class="form-group">
        <label>Den thoi diem</label>
        <input type="date" name="toDate" class="form-control" />
    </div>
    <br>
    <input type="submit" value="Loc du lieu" class="btn btn-success" />
</form>

<div class="row">
    <div class="col-md-6 col-xs-12">
        <table class="table">
            <tr>
                <th>Thang</th>
                <th>Quy</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${revenueMonthStats}" var="c">
            <tr>
                <td>${c[0]}/${c[1]}</td>
                <td>${c[2]}</td>
                <td>
                    <fmt:formatNumber type="number" value="${c[3]}"/> VND
                </td>
            </tr>
            </c:forEach>
        </table>
        <canvas id="myChart3"></canvas>
</div>
    
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/month-stats.js" />"></script>
<script>
    window.onload = function() {
        let data3 = [];
        let labels3 = []; 
    <c:forEach items="${revenueMonthStats}" var="c">
            data3.push(${c[3]});
            labels3.push('${c[0]}/${c[1]}');
    </c:forEach>
        revenueMonthStats(labels3,data3);
    };
</script>