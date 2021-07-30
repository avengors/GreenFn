<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
    <form method="post">
 		<div>번호 : ${dto.idx}</div>		
        <div>
            <label for="title">제목</label>
            <input type="text" name="title" id="title" value= "${dto.title }">
        </div>
        <div>
            <label for="content">본문</label>
            <textarea name="content" id="content" cols="30" rows="10" >${dto.content }</textarea>
        </div>
        <div>
            <input type="file" name="uploadFile">
        </div>
        <div>
            <input type="button" value="취소">
            <input type="submit" value="작성">
        </div>
    </form>
</main>
<<script>

</script>

<%@ include file="../footer.jsp" %>