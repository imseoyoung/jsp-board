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

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.container {
	text-align: right;
	margin-right: 30px;
}

.add-button {
	display: inline-block;
	padding: 8px 16px;
	background-color: #FF7575;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-decoration: none;
	margin-bottom: 16px;
}

.add-button:hover {
	background-color: #ED9595;
	text-align: right;
}

.title-link {
	color: #2b547e;
	text-decoration: none; /* 밑줄 제거 */
	cursor: pointer;
}

.title-link:hover {
	color: #0d315f;
}

.details {
	margin-top: 10px;
	border: 1px solid #ddd;
	padding: 10px;
}

</style>
</head>
<body>
	<h1>글 목록</h1>
	<div class="container">
		<a href="insert_board.do" class="add-button">글 작성하기</a>
	</div>
	<form action="delete_multiple.do" method="post">
		<table>
			<tr>
				<th><label><input type="checkbox" id="selectAll"></label></th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td><input type="checkbox" name="selectedIds"
						value="${board.getId()}"></td>
					<td>${board.getId()}</td>
					<td><a href="view_board.do?id=${board.getId()}"
						class="title-link">${board.getTitle()}</a></td>
					<td>${board.getWriter()}</td>
					<td>${board.getWriteDate()}</td>
					<td>${board.getCount()}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<script>
			document.getElementById('selectAll').addEventListener(
					'change',
					function() {
						var checkboxes = document
								.getElementsByName('selectedIds');
						for (var i = 0; i < checkboxes.length; i++) {
							checkboxes[i].checked = this.checked;
						}
					});
		</script>
		<input type="submit" value="삭제" class="add-button">
	</form>
</body>
</html>