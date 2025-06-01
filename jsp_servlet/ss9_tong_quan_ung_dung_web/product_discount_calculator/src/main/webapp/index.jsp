<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/display_discount" method="post">
    <input type="text" name="description" placeholder="Enter description: ">
    <input type="number" name="list_price" placeholder="Enter List Price: ">
    <input type="number" name="discount" placeholder="Enter Discount Percent: ">
    <input type="submit" id="submit" value="calculator">
</form>
</body>
</html>