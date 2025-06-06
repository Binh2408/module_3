<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 6/5/2025
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Thêm mới</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

</head>
<body>
<div class="container mt-4">
  <h2 class="text-center">Thêm mới sản phẩm</h2>
  <form method="post" action="/products?action=add" class="w-50 mx-auto">
    <div class="mb-3">
      <label class="form-label">Mã sản phẩm</label>
      <input type="text" name="productID" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Tên sản phẩm</label>
      <input type="text" name="productName" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Giá sản phẩm</label>
      <input type="number" name="productPrice" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Mô tả sản phẩm</label>
      <input type="text" name="productDescription" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Nhà sản xuất</label>
      <input type="text" name="manufacture" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Loại sản phẩm</label>
      <select name="typeProductID" class="form-select" required>
        <option value="">------Chọn loại------</option>
        <c:forEach items="${typeProductID}" var="type">
          <option value="${type.categoryID}">${type.categoryName}</option>
        </c:forEach>
      </select>
    </div>

    <div class="text-center">
      <button type="submit" class="btn btn-success">Thêm</button>
      <a class="btn btn-secondary" href="/products">Hủy</a>
    </div>
  </form>
</div>

</body>
</html>
