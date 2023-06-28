<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Board</title>
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
        
        .form-field {
            margin-bottom: 10px;
        }
        
        .form-label {
            font-weight: bold;
            display: inline-block;
            width: 100px;
        }
        
        .form-input {
            padding: 5px;
            width: 300px;
        }
        
        .submit-button {
            padding: 8px 16px;
            background-color: #ccc;
            color: #000;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        
        .submit-button:hover {
            background-color: #999;
        }
    </style>
</head>
<body>
    <h1>Update Board</h1>
    
    <div class="details">
        <p><span class="detail-label">ID:</span> <span class="detail-value">${board.getId()}</span></p>
        <p><span class="detail-label">Title:</span> <span class="detail-value">${board.getTitle()}</span></p>
        <p><span class="detail-label">Content:</span> <span class="detail-value">${board.getContent()}</span></p>
        <p><span class="detail-label">Writer:</span> <span class="detail-value">${board.getWriter()}</span></p>
        <p><span class="detail-label">Write Date:</span> <span class="detail-value">${board.getWriteDate()}</span></p>
        <p><span class="detail-label">Count:</span> <span class="detail-value">${board.getCount()}</span></p>
        <p><span class="detail-label">Groups:</span> <span class="detail-value">${board.getGroups()}</span></p>
        <p><span class="detail-label">Step:</span> <span class="detail-value">${board.getStep()}</span></p>
        <p><span class="detail-label">Indent:</span> <span class="detail-value">${board.getIndent()}</span></p>
    </div>
    
    <div class="edit-form">
        <form action="update_confirm.do" method="post">
            <input type="hidden" name="id" value="${board.getId()}">
            <div class="form-field">
                <label class="form-label" for="title">Title:</label>
                <input class="form-input" type="text" name="title" value="${board.getTitle()}">
            </div>
            <div class="form-field">
                <label class="form-label" for="content">Content:</label>
                <textarea class="form-input" name="content">${board.getContent()}</textarea>
            </div>
            <div class="form-field">
                <label class="form-label" for="writer">Writer:</label>
                <input class="form-input" type="text" name="writer" value="${board.getWriter()}">
            </div>
            <div class="form-field">
                <input class="submit-button" type="submit" value="Update">
            </div>
        </form>
    </div>
    
    <a href="select_board.do">Back to Board List</a>
</body>
</html>