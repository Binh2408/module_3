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
      <input type="text" name="productID" value="${product.productID}" class="form-control" required>
      <c:if test="${errors['productID'] != null}">
        <div class="text-danger">${errors['productID']}</div>
      </c:if>
    </div>

    <div class="mb-3">
      <label class="form-label">Tên sản phẩm</label>
      <input type="text" name="productName" value="${product.productName}" class="form-control" required>
      <c:if test="${errors['productName'] != null}">
        <div class="text-danger">${errors['productName']}</div>
      </c:if>
    </div>

    <div class="mb-3">
      <label class="form-label">Giá sản phẩm</label>
      <input type="number" step="0.01" name="productPrice" value="${product.productPrice}" class="form-control" required>
      <c:if test="${errors['productPrice'] != null}">
        <div class="text-danger">${errors['productPrice']}</div>
      </c:if>
    </div>

    <div class="mb-3">
      <label class="form-label">Mô tả sản phẩm</label>
      <input type="text" name="productDescription" value="${product.productDescription}" class="form-control">
      <c:if test="${errors['productDescription'] != null}">
        <div class="text-danger">${errors['productDescription']}</div>
      </c:if>
    </div>

    <div class="mb-3">
      <label class="form-label">Nhà sản xuất</label>
      <input type="text" name="manufacture" value="${product.manufacture}" class="form-control">
      <c:if test="${errors['manufacture'] != null}">
        <div class="text-danger">${errors['manufacture']}</div>
      </c:if>
    </div>

    <div class="mb-3">
      <label class="form-label">Loại sản phẩm</label>
      <select name="typeProductID" class="form-select" required>
        <option value="">------Chọn loại------</option>
        <c:forEach items="${typeProductID}" var="type">
          <option value="${type.categoryID}" <c:if test="${product.typeProductID == type.categoryID}">selected</c:if>>${type.categoryName}</option>
        </c:forEach>
      </select>
      <c:if test="${errors['typeProductID'] != null}">
        <div class="text-danger">${errors['typeProductID']}</div>
      </c:if>
    </div>

    <div class="text-center">
      <button type="submit" class="btn btn-success">Thêm</button>
      <a class="btn btn-secondary" href="/products">Hủy</a>
    </div>
  </form>
</div>
</body>
</html>
