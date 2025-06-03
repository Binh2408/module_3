<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 6/3/2025
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>


<div class="container mt-4">
    <c:if test="${not empty sessionScope.msg}">
        <p style="color:green;">${sessionScope.msg}</p>
        <c:remove var="msg" scope="session"/>
    </c:if>
    <h1>Quản lý sản phẩm</h1>
    <form action="/product" method="get" class="mb-3">
        <div class="d-flex justify-content-center align-items-center">
            <input type="text" name="search" placeholder="Nhập tên sản phẩm..." class="form-control w-50 me-2" />
            <button type="submit" class="btn btn-outline-primary">Tìm kiếm</button>
        </div>
    </form>



    <div class="mb-3">
        <button class="btn btn-primary" onclick="window.location.href='/product?action=create'">Thêm mới</button>
    </div>

    <table class="table table-bordered table-striped table-hover text-center">
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Mô tả của sản phẩm</th>
            <th>Nhà sản xuất</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="item" items="${products}" varStatus="idx">
            <tr>
                <td>${item.id}</td>
                <td>${item.productName}</td>
                <td><fmt:formatNumber value="${item.productPrice}" type="number" groupingUsed="true" /></td>
                <td>${item.productDescription}</td>
                <td>${item.manufacture}</td>
                <td>
                    <a href="/product?action=detail&id=${item.id}">Chi tiết</a> |
                    <a href="/product?action=update&id=${item.id}">Sửa</a> |
                    <a href="/product?action=delete&id=${item.id}" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                </td>

            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>
