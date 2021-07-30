<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="btn--dust-group">
    <button class="btn btn--dust active" value="pm10">미세먼지</button>
    <button class="btn btn--dust" value="pm25">초미세먼지</button>
</div>

<div>
    <table class="table table--dust" style="display: inline-block">
        <thead>
        <tr>
            <th>관측지점</th>
            <th>오늘</th>
            <th>내일</th>
            <th>모레</th>
        </tr>
        </thead>
        <tbody id="dustTBody">
        <tr id="서울">
        </tr>
        <tr id="경기북부">
        </tr>
        <tr id="경기남부">
        </tr>
        <tr id="인천">
        </tr>
        <tr id="영동">
        </tr>
        <tr id="영서">
        </tr>
        <tr id="세종">
        </tr>
        <tr id="충북">
        </tr>
        <tr id="충남">
        </tr>
        <tr id="대전">
        </tr>
        <tr id="경북">
        </tr>
        <tr id="경남">
        </tr>
        <tr id="대구">
        </tr>
        <tr id="울산">
        </tr>
        <tr id="부산">
        </tr>
        <tr id="전북">
        </tr>
        <tr id="전남">
        </tr>
        <tr id="광주">
        </tr>
        <tr id="제주">
        </tr>
        </tbody>
    </table>
    <img height="619px"
         id="img">
</div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/air.js"></script>
<%@ include file="../footer.jsp" %>