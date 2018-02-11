<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Library</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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


    <script type="text/javascript">
        function doalert(checkboxElem) {
            if (confirm("Do you want to save the book as already read?")) {
                var form = document.createElement("form");

                form.target = "_self";
                form.method = "POST";
                form.action = "/readalready";
                form.style.display = "none";

                var input = document.createElement("input");
                input.type = "hidden";
                input.name = "id";
                input.value = checkboxElem.value;
                form.appendChild(input);

                document.body.appendChild(form);
                form.submit();
                document.body.removeChild(form);

            } else {
                checkboxElem.checked = false;
            }
        }
    </script>
</head>
<body>
<h2 align="center"><a href="/">LIBRARY</a></h2><br>

<form method="post" action="/search" >
    <input type="text" name="keyword" value="" >
    <input type="submit" value="Search">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%--<input type="text" name="year" value="" placeholder="year">--%>
    <select id="year" name="year">
        <script>
            document.write('<option value=""></option>');
            var year = new Date().getFullYear();
            for(var i = year; i >= 1900; i--){
                document.write('<option value="'+i+'">'+i+'</option>');
            }
        </script>
    </select>

 <br><br>
<input type="radio" name="keywordType" value="id"/> ID
<input type="radio" name="keywordType" value="author" checked/> Author
<input type="radio" name="keywordType" value="title" /> Title
<input type="radio" name="keywordType" value="description" /> Description
<input type="radio" name="keywordType" value="isbn" /> ISBN
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="yearType" value="during" checked/> Pub. during ... year &nbsp;
<input type="radio" name="yearType" value="less"/> Pub. before ... year &nbsp;
<input type="radio" name="yearType" value="greater" /> Pub. after ... year
</form>

<br>
<table>
    <tr>
        <th>ID</th>
        <th>Author</th>
        <th>Title</th>
        <th>Description</th>
        <th>Year of pubishing</th>
        <th>ISBN</th>
        <th>Already read</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="book" items="${books}">
        <tr>
            <td>${book.id}</td>
            <td>${book.author}</td>
            <td>${book.title}</td>
            <td>${book.description}</td>
            <td>${book.printYear}</td>
            <td>${book.isbn}</td>
            <td>
                <c:choose>
                    <%-- if book readAlready (true) it makes checkbox checked --%>
                    <c:when test="${book.readAlready}">
                        <input type="checkbox" name="readAlready" checked
                               onclick="return false">
                    </c:when>
                    <%-- if book is not readAlready (false) it makes checkbox changeable and it calls doalert function if we click it --%>

                    <c:otherwise>
                        <input type="checkbox" name="readAlready"
                               value="${book.id}" onchange="doalert(this)">
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="/view/${book.id}">View</a>
                <a href="/edit/${book.id}">Edit</a>
                <a href="/edition/${book.id}">New pub.</a>
                <%--<a href="/delete/${book.id}">Delete</a>--%>
            </td>
        </tr>
    </c:forEach>
</table>
<hr/>

<ul class="nav nav-pills">
    <c:forEach var="i" begin="1" end="${maxPages}" step="1">
        <li class="nav-item">
            <a href="/?page=${i}" class="nav-link">${i}</a>
        </li>
    </c:forEach>
</ul>

<hr/>
<h2>Add new book:</h2>
<form method="post" action="/save">
    <input type="hidden" name="id" value=""/>
    Author:<br>
    <input type="text" name="author"/>
    <br>
    Title:<br>
    <input type="text" name="title"/>
    <br>
    Description:<br>
    <input type="text" name="description"/>
    <br>
    ISBN:<br>
    <input type="text" name="isbn"/>
    <br>
    Year of publishing:<br>
    <input type="text" name="printYear"/>
    <br><br>
    <input type="submit" value="Add book">
</form>

</body>
</html>
