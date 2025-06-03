<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JSP - Hello World</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="container p-4 mt-4" style="border: 5px solid #cde3f9; border-radius: 10px; box-shadow: 0 0 10px #cde3f9;">
  <h1 style="text-align: center">Danh sách khách hàng</h1>
  <table class="table text-center align-middle">
    <tr>
      <th scope="col">Tên</th>
      <th scope="col">Ngày sinh</th>
      <th scope="col">Địa chỉ</th>
      <th scope="col">Ảnh</th>
    </tr>
    <c:forEach var="item" items="${customers}" varStatus="idx">
      <tr>
        <td>${item.name}</td>
        <td>${item.dateOfBirth}</td>
        <td>${item.address}</td>
        <td>
          <img src="${item.picture}" width="100" height="100" alt="Customer Image">
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>