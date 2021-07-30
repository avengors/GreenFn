<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>
<body>

	<table border=1 width="30%">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${dto.idx}</td>
				<td>${dto.title}</td>
				<td>${dto.content }</td>
				<td>${dto.wdate }</td>
				<td>${dto.viewCount }</td>
			</tr>
		</tbody>

		<button class="deletebtn">삭제하기</button>
		<a href="${cpath }/board/update?idx=${dto.idx}">수정하기</a>

	<script>
		
	</script>

	</table>

</body>

</body>
</html>