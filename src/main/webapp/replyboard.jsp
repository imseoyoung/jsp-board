<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
</head>
<body>
    <h1>글 작성</h1>
    <form action="reply_confirm.do" method="post">
    	<input type="hidden" name="id" value="${board.getId()}">
    	
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="5" cols="50" required></textarea><br><br>
        
        <label for="writer">작성자:</label>
        <input type="text" id="writer" name="writer" required><br><br>
        
        <input type="submit" value="작성">
    </form>
    <a href="select_board.do">글 목록으로 돌아가기</a>
</body>
</html>
