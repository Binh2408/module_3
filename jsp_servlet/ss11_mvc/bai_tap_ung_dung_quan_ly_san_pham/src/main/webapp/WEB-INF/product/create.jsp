<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Thêm mới sản phẩm</h2>
    <form method="post" action="/product?action=create" class="w-50 mx-auto">
        <div class="mb-3">
            <label class="form-label">ID</label>
            <input type="text" name="id" class="form-control" required>
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
        <div class="text-center">
            <button type="submit" class="btn btn-success">Thêm</button>
            <a class="btn btn-secondary" href="/product">Hủy</a>
        </div>
    </form>
</div>
</body>
</html>
