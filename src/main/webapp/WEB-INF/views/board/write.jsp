<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
    <form method="post" enctype="multipart/form-data">
        <div>
            <input type="radio" name="category" id="typhoon" value="typhoon">
            <label for="typhoon">Typhoon</label>
            <input type="radio" name="category" id="air" value="air">
            <label for="air">Air</label>
            <input type="radio" name="category" id="covid19" value="covid19" checked>
            <label for="covid19">COVID19</label>
        </div>
        <div>
            <label for="title">제목</label>
            <input type="text" name="title" id="title">
        </div>
        <div>
            <label for="content">본문</label>
            <textarea name="content" id="content" cols="30" rows="10"></textarea>
        </div>
        <div>
            <input type="file" name="uploadFile">
        </div>
        <div>
            <input type="reset" value="취소">
            <input type="submit" value="작성">
        </div>
    </form>
</main>

<%@ include file="../footer.jsp" %>