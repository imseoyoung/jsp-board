<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 20px;
}

h1 {
	color: #555;
	text-align: center;
}

form {
	max-width: 500px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"], input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"], input[type="reset"], a.button {
	display: inline-block;
	width: 100%;
	padding: 10px;
	background-color: #FFB9B9;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
}

input[type="submit"]:hover, input[type="reset"]:hover, a.button:hover {
	background-color: #ED9595;
}
</style>
</head>
<body>
	<h1>글 작성</h1>
	<form action="reply_confirm.do" method="post">
		<input type="hidden" name="id" value="${board.getId()}"> <label
			for="title">제목:</label> <input type="text" id="title" name="title"
			required><br>
		<br> <label for="content">내용:</label><br>
		<textarea id="content" name="content" rows="10" cols="62" required></textarea>
		<br>
		<br> <label for="writer">작성자:</label> <input type="text"
			id="writer" name="writer" required><br>
		<br> <input type="submit" value="작성"> <input type="reset"
			value="초기화">
	</form>
</body>
</html>
