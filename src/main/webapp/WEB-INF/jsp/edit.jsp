<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head><title>Edit book</title>
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
<hr/>
<form method="post" action="/save">
  <input type="hidden" name="id" value="${book.id}"/><br/>
  <input type="hidden" name="readAlready" value="true"/><br/>
  Book author:<br>
  <input type="text" name="author" value="${book.author}"/>
  <br>
  Book title:<br>
  <input type="text" name="title" value="${book.title}">
  <br>
  Description:<br>
  <input type="text" name="description" value="${book.description}">
  <br>
  Year of publishing:<br>
  <input type="text" name="printYear" value="${book.printYear}">
  <br>
  ISBN:<br>
  <input type="text" name="isbn" value="${book.isbn}">
  <br><br>
  <input type="submit" value="Save">&nbsp;
  <input type="button" value="Delete" onclick="window.location.href='/delete/${book.id}'" />
  <input type="button" value="Cancel" onclick="window.location.href='/'" />
</form>

</body>
</html>
