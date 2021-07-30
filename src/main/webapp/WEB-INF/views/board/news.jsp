<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

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
		   <c:forEach items="${list}" var="dto">
                <tbody>
                    <tr>
                        <td><c:out value="${dto.idx}"/></td>
                        <td>
                        <a href='${cpath }/board/view?idx=${dto.idx }&page=${param.page}'><c:out value="${dto.title}"/></a>
                        </td>
                        <td><c:out value="${dto.content }"/></td>
                        <td><c:out value="${dto.wdate }"/></td>    
                        <td><c:out value="${dto.viewCount }"/></td>    
                    </tr>
                </tbody>
            </c:forEach>
            <a href="${cpath}/board/write">작성하기</a>
          



	</table>
	<div class="paging-number">
			<c:if test="${paging.prev }">
				<a href="${cpath }/board/oneWord?page=${paging.begin - 1}">
					<
				</a>
			</c:if>
		
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<a href="${cpath }/board/oneWord?page=${i}">
					${i == param.page ? '<strong>' : ''}
						${i }
					${i == param.page ? '</strong>' : ''}
				</a>
			</c:forEach>
			
			<c:if test="${paging.next }">
				<a href="${cpath }/board/oneWord?page=${paging.end + 1}">
					>
				</a>
			</c:if>
		</div>

<%@ include file="../footer.jsp" %>