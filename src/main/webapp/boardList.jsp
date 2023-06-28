<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }
        
        h1 {
            color: #555;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        .add-button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            margin-bottom: 16px;
        }
        
        .add-button:hover {
            background-color: #45a049;
        }
        
        .title-link {
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
        
        .title-link:hover {
            color: #23527c;
        }
        
        .details {
            margin-top: 10px;
            border: 1px solid #ddd;
            padding: 10px;
        }
    </style>
</head>
<body>
    <h1>Board List</h1>
    <a href="insert_board.do" class="add-button">글 작성하기</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Content</th>
            <th>Writer</th>
            <th>Write Date</th>
            <th>Count</th>
            <th>Groups</th>
<!--             <th>Step</th>
            <th>Indent</th> -->
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.getId()}</td>
                <td><a href="view_board.do?id=${board.getId()}" class="title-link">${board.getTitle()}</a></td>
                <td>${board.getContent()}</td>
                <td>${board.getWriter()}</td>
                <td>${board.getWriteDate()}</td>
                <td>${board.getCount()}</td>
                <td>${board.getGroups()}</td>
<%--                 <td>${board.getStep()}</td>
                <td>${board.getIndent()}</td> --%>
            </tr>
        </c:forEach>
    </table>
</body>
</html>