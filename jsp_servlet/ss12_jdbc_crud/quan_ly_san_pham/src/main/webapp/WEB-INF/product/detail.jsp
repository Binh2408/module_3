<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Chi tiết sản phẩm</h2>
    <table class="table table-bordered w-50 mx-auto">
        <tr><th>Mã sản phẩm</th><td>${detailProduct.productID}</td></tr>
        <tr><th>Tên sản phẩm</th><td>${detailProduct.productName}</td></tr>
        <tr>
            <th>Giá</th>
            <td><fmt:formatNumber value="${detailProduct.productPrice}" type="number" groupingUsed="true"/> VNĐ</td>
        </tr>
        <tr><th>Mô tả</th><td>${detailProduct.productDescription}</td></tr>
        <tr><th>Nhà sản xuất</th><td>${detailProduct.manufacture}</td></tr>
        <tr>
            <th>Loại sản phẩm</th>
            <td>
                <c:forEach var="category" items="${typeProductID}">
                    <c:if test="${category.categoryID == detailProduct.typeProductID}">
                        ${category.categoryName}
                    </c:if>
                </c:forEach>
            </td>
        </tr>
    </table>
    <div class="text-center">
        <a class="btn btn-secondary" href="/products">Quay lại danh sách</a>
    </div>
</div>
</body>
</html>
