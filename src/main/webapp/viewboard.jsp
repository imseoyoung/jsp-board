<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board Detail</title>
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
        
        .details {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 20px;
        }
        
        .detail-label {
            font-weight: bold;
        }
        
        .detail-value {
            margin-left: 10px;
        }
        
        .back-button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #ccc;
            color: #000;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        
        .back-button:hover {
            background-color: #999;
        }
    </style>
</head>
<body>
    <h1>Board Detail</h1>
    
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
    
    <a href="update_board.do?id=${board.getId()}">수정</a>
    <a href="delete_board.do?id=${board.getId()}">삭제</a>
    <a href="reply_board.do?id=${board.getId()}">답글</a>
    <a href="select_board.do">목록</a>
</body>
</html>
