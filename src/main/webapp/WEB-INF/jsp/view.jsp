<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head><title>View book</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>

<table>
  <tr>
    <th>ID</th>
    <td>${book.id}</td>
  </tr>
  <tr>
      <th>Author</th>
      <td>${book.author}</td>
  </tr>
  <tr>
        <th>Title</th>
        <td>${book.title}</td>
  </tr>
  <tr>
        <th>Description</th>
        <td>${book.description}</td>
  </tr>
  <tr>
        <th>Year of pubishing</th>
        <td>${book.printYear}</td>
  </tr>
  <tr>
        <th>ISBN</th>
        <td>${book.isbn}</td>
  </tr>
  <tr>
        <th>Already read</th>
        <%--<td>${book.readAlready}</td>--%>
        <td>
            <c:choose>
                <%-- if book readAlready (true) it makes checkbox checked --%>
                <c:when test="${book.readAlready}">
                    <input type="checkbox" checked onclick="return false">
                </c:when>
                <%-- if book is not readAlready (false) it makes checkbox unchecked --%>
                <c:otherwise>
                    <input type="checkbox" onclick="return false">
                </c:otherwise>
            </c:choose>
        </td>
  </tr>
  </table>
  <a href="/">Back</a>
</body>
</html>
