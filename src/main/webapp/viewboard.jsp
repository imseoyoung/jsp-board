<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
}

.container {
	text-align: center;
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

.action-buttons {
	margin-top: 20px;
}

.action-buttons a {
	display: inline-block;
	padding: 8px 16px;
	margin-right: 10px;
	background-color: #FFB9B9;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.action-buttons a:hover {
	background-color: #ED9595;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}
</style>
</head>
<body>
	<div class="container">
		<h1>글 정보</h1>
		<table>
			<tr>
				<th>항목</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>번호:</td>
				<td>${board.getId()}</td>
			</tr>
			<tr>
				<td>제목:</td>
				<td>${board.getTitle()}</td>
			</tr>
			<tr>
				<td>내용:</td>
				<td>${board.getContent()}</td>
			</tr>
			<tr>
				<td>작성자:</td>
				<td>${board.getWriter()}</td>
			</tr>
			<tr>
				<td>작성일:</td>
				<td>${board.getWriteDate()}</td>
			</tr>
			<tr>
				<td>조회수:</td>
				<td>${board.getCount()}</td>
			</tr>
		</table>

		<div class="action-buttons">
			<a href="update_board.do?id=${board.getId()}">수정</a>
			<a href="delete_board.do?id=${board.getId()}">삭제</a>
			<a href="reply_board.do?id=${board.getId()}">답글</a>
			<a href="select_board.do">목록</a>
		</div>

	</div>
</body>
</html>
