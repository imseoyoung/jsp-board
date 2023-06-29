<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>떠뮤니티</title>
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

label {
	display: block;
	margin-bottom: 5px;
	text-align: left;
}

.details {
	margin-bottom: 20px;
	text-align: center;
}

.details p {
	margin: 10px 0;
}

.details .detail-label {
	font-weight: bold;
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

input[type="text"],
input[type="password"],
input[type="email"] {
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
	<h1>글 수정하기</h1>

	<div class="details">
		<p>
			<span class="detail-label">번호:</span> <span class="detail-value">${board.getId()}</span>
		</p>
		<p>
			<span class="detail-label">제목:</span> <span class="detail-value">${board.getTitle()}</span>
		</p>
		<p>
			<span class="detail-label">내용:</span> <span class="detail-value">${board.getContent()}</span>
		</p>
		<p>
			<span class="detail-label">작성자:</span> <span class="detail-value">${board.getWriter()}</span>
		</p>
		<p>
			<span class="detail-label">작성일:</span> <span class="detail-value">${board.getWriteDate()}</span>
		</p>
		<p>
			<span class="detail-label">조회수:</span> <span class="detail-value">${board.getCount()}</span>
		</p>
	</div>

	<div class="edit-form">
		<form action="update_confirm.do" method="post">
			<input type="hidden" name="id" value="${board.getId()}"> <label
				for="title">제목:</label> <input type="text" name="title"
				value="${board.getTitle()}"> <label for="content">내용:</label>
			<textarea name="content" rows="10" cols="62">${board.getContent()}</textarea>
			<label for="writer">작성자:</label> <input type="text" name="writer"
				value="${board.getWriter()}"> <input type="submit"
				class="submit-button" value="수정"> <input type="reset"
				class="reset-button" value="초기화">
		</form>
	</div>
</body>
</html>
