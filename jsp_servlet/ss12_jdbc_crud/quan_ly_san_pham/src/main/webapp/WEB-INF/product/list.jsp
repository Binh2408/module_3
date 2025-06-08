<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 6/5/2025
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<div class="container mt-4">
    <c:if test="${not empty sessionScope.msg}">
        <p id="msgBox" style="color:green;">${sessionScope.msg}</p>
        <c:remove var="msg" scope="session"/>
    </c:if>
    <h1>Quản lý sản phẩm</h1>
    <form action="/products" method="get" class="mb-3">
        <div class="d-flex justify-content-center align-items-center gap-2">
            <input name="action" type="hidden" value="search"/>

            <!-- Nhập tên sản phẩm -->
            <input type="text" name="searchName" placeholder="Nhập tên sản phẩm..."
                   value="${param.searchName}" class="form-control w-50 me-2"/>

            <!-- Chọn loại sản phẩm -->
            <select name="searchCategory" class="form-select w-auto me-2">
                <option value="">-- Tất cả loại --</option>
                <c:forEach var="category" items="${typeProductList}">
                    <option value="${category.categoryName}"
                            <c:if test="${param.searchCategory == category.categoryName}">selected</c:if>>
                            ${category.categoryName}
                    </option>
                </c:forEach>

            </select>

            <!-- Nút tìm kiếm -->
            <button type="submit" class="btn btn-outline-primary">Tìm kiếm</button>
        </div>
    </form>


    <div class="mb-3">
        <button class="btn btn-primary" onclick="window.location.href='/products?action=add'">Thêm mới</button>
        <button class="btn btn-primary" onclick="window.location.href='/products'">Hiển thị tất cả</button>
    </div>

    <table id="tableProduct" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Loại sản phẩm</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${productDTOList}" varStatus="idx">
            <tr>
                <td>${idx.count}</td>
                <td>${item.productID}</td>
                <td>${item.productName}</td>
                <td><fmt:formatNumber value="${item.productPrice}" type="number" groupingUsed="true"/></td>
                <td>${item.categoryName}</td>
                <td>
                    <a href="/products?action=detail&productID=${item.productID}" class="btn btn-primary">Chi tiết</a>
                    <a href="/products?action=update&productID=${item.productID}" class="btn btn-primary">Sửa</a>
                    <button class="btn btn-primary" onclick="deleteInfo('${item.productID}', '${item.productName}')">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form method="post" action="/products?action=delete">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input hidden="hidden" id="deleteID" name="deleteID">
                        <span>Bạn có muốn xoá sinh viên </span><span id="deleteName"></span> không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                        <button class="btn btn-primary">Xoá</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteID").value = id;
        document.getElementById("deleteName").innerText = name;

        // Gọi modal Bootstrap để hiển thị
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
        myModal.show();
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    setTimeout(function() {
        var msg = document.getElementById('msgBox');
        if (msg) {
            msg.style.display = 'none';
        }
    }, 3000); // 3000 ms = 3 giây
</script>

<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'rtp',
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "paginate": {
                    "previous": "Trước",
                    "next": "Sau"
                },
                "info": "",
                "zeroRecords": "Không có dữ liệu",
                "emptyTable": "Không có sản phẩm nào",
                "search": "Tìm kiếm:"
            }
        });
    });
</script>

</body>
</html>
