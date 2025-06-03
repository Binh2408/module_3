<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Cập nhật sản phẩm</h2>
    <form method="post" action="/product?action=update" class="w-50 mx-auto">
        <input type="hidden" name="id" value="${product.id}">
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="productName" value="${product.productName}" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giá sản phẩm</label>
            <input type="number" name="productPrice" value="${product.productPrice}" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Mô tả sản phẩm</label>
            <input type="text" name="productDescription" value="${product.productDescription}" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Nhà sản xuất</label>
            <input type="text" name="manufacture" value="${product.manufacture}" class="form-control">
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a class="btn btn-secondary" href="/product">Hủy</a>
        </div>
    </form>
</div>
</body>
</html>
