<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Chi tiết sản phẩm</h2>
    <table class="table table-bordered w-50 mx-auto">
        <tr><th>ID</th><td>${product.id}</td></tr>
        <tr><th>Tên</th><td>${product.productName}</td></tr>
        <tr><th>Giá</th><td>${product.productPrice}</td></tr>
        <tr><th>Mô tả</th><td>${product.productDescription}</td></tr>
        <tr><th>Nhà sản xuất</th><td>${product.manufacture}</td></tr>
    </table>
    <div class="text-center">
        <a class="btn btn-secondary" href="/product">Quay lại danh sách</a>
    </div>
</div>
</body>
</html>
