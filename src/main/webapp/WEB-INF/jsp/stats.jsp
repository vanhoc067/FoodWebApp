<%-- 
    Document   : stats
    Created on : Aug 16, 2022, 6:52:36 PM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/css/style.css" var="css" />
<link href="${css}" rel="stylesheet" >



<h1 class="text-center">THONG KE SAN PHAM VA DOANH THU </h1>

<div class="container" >
<nav class="navbar bg-light">
    <ul clas="navbar-nav">
        <li class="nav-item">
            <a clas="nav-link" href="<c:url value="/store/month-stats" />">Thong ke doanh thu theo thang </a>
        </li>
    </ul>
    
</nav>

<div class="row">
    <div class="col-md-8 col-xs-12">
        <table class="table">
            <tr>
                <th>Id</th>
                <th>Ten danh muc mon an</th>
                <th>So luong mon an co trong danh muc</th>
            </tr>
            <c:forEach items="${catStats}" var="c">
            <tr>
                <td>${c[0]}</td>
                <td>${c[1]}</td>
                <td>${c[2]}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-4 col-xs-12 ">
        <canvas id="myChart"></canvas>
    </div>
</div>
        <br><br>
<div class="row">
    <div class="col-md-5 col-xs-12">
        <table class="table">
            <tr>
                <th>Id</th>
                <th>Ten mon an</th>
                <th>Doanh thu ban ra</th>
            </tr>
            <c:forEach items="${revenueStats}" var="c">
            <tr>
                <td>${c[0]}</td>
                <td>${c[1]}</td>
                <td>
                    <fmt:formatNumber type="number" value="${c[2]}"/> VND
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-7 col-xs-12 ">
        <canvas id="myChart2"></canvas>
    </div>
</div>
<!--    <div class="col-md-6 col-xs-12 ">
        <c:url value="/store/stats" var="action"/>
        <form action="${action}">
            <div class="mb-3 mt-3">
                 <label>Nhap quý</label>
                <select class="form-control" name="quarter">
                    <c:forEach begin="1" end="4" var="i">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
            </div>-->
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
        </form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function() {
        let data = [];
        let labels = [];
        let data2 = [];
        let labels2 = []; 
        
    <c:forEach items="${catStats}" var="c">
            data.push(${c[2]});
            labels.push('$${c[1]}');
    </c:forEach>
        
    <c:forEach items="${revenueStats}" var="c">
            data2.push(${c[2]});
            labels2.push('$${c[1]}');
    </c:forEach>
        
        cateStats(labels,data); 
        revenueStats(labels2,data2);
    };
</script>
</div>