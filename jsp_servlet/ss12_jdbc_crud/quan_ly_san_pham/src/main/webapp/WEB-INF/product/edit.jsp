<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 6/5/2025
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Cập nhật sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Cập nhật sản phẩm</h2>
    <form method="post" action="/products?action=update" class="w-50 mx-auto">
        <input type="hidden" name="updateID" value="${product.productID}">
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="updateName" value="${product.productName}" class="form-control" required>
            <c:if test="${errors['updateName'] != null}">
                <div class="text-danger">${errors['updateName']}</div>
            </c:if>
        </div>

        <div class="mb-3">
            <label class="form-label">Giá sản phẩm</label>
            <input type="number" name="updatePrice" value="${product.productPrice}" class="form-control" required>
            <c:if test="${errors['updatePrice'] != null}">
                <div class="text-danger">${errors['updatePrice']}</div>
            </c:if>
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả sản phẩm</label>
            <input type="text" name="updateDescription" value="${product.productDescription}" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Nhà sản xuất</label>
            <input type="text" name="updateManufacture" value="${product.manufacture}" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Loại sản phẩm</label>
            <select name="updateTypeProductID" class="form-select" required>
                <option value="">------Chọn loại------</option>
                <c:forEach items="${typeProductID}" var="type">
                    <option value="${type.categoryID}"
                            <c:if test="${type.categoryID == product.typeProductID}">selected</c:if>>
                            ${type.categoryName}
                    </option>
                </c:forEach>
            </select>
            <c:if test="${errors['updateTypeProductID'] != null}">
                <div class="text-danger">${errors['updateTypeProductID']}</div>
            </c:if>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a class="btn btn-secondary" href="/products">Hủy</a>
        </div>
    </form>
</div>

</body>
</html>
