<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/modify.css">
</head>
<body>
    <div id="background">
        <div id="toptap">
            <div id="logo">
                <div id="t1" class="table_cell">
                	<img src="<c:url value='/resources/images/TALKSlogo.jpg' />" id="logoimg" alt="TALK'S 로고">
                </div>
            </div>
            <div class="searchbar">
                <div id="t2" class="table_cell">
                    <div id="searchdiv">
                        <input type="search" placeholder="검색어를 입력하세요.">
                        <a class="search" href="#">검색</a>
                    </div>
                </div>
                <div id="login">
                    <a href="http://localhost:8080/member/loginForm">로그인</a>
                    <a href="http://localhost:8080/member/signupForm">회원가입</a>
                </div>
            </div>
        </div>

        <div id="midtap">
            <div id="lefttap">
                <div id="category_menu">
                    <div class="category_title">화제집중</div>
                    <div class="category_list">
						<a href="http://localhost:8080/board/focus/humor">유머 게시판</a><br>
						<a href="http://localhost:8080/board/focus/free">자유 게시판</a><br>
						<a href="http://localhost:8080/board/focus/info">정보 게시판</a>
                    </div>
                    <div class="category_title">스포츠</div>
                    <div class="category_list">
                        <a href="http://localhost:8080/board/sports/health">헬스</a><br>
                        <a href="http://localhost:8080/board/sports/soccer">축구</a><br>
                        <a href="http://localhost:8080/board/sports/baseball">야구</a><br>
                        <a href="http://localhost:8080/board/sports/soccer">농구</a>
                    </div>
                    <div class="category_title">게임</div>
                    <div class="category_list">
						<a href="http://localhost:8080/board/game/lol">리그오브레전드</a><br> 
						<a href="http://localhost:8080/board/game/maple">메이플스토리</a><br> 
						<a href="http://localhost:8080/board/game/lenage">리니지</a><br> 
						<a href="http://localhost:8080/board/game/mobile">모바일게임</a>
                    </div>
                    <div class="category_title">기타</div>
                    <div class="category_list">
						<a href="http://localhost:8080/board/etc/movie">영화</a><br> 
						<a href="http://localhost:8080/board/etc/picture">사진</a><br> 
						<a href="http://localhost:8080/board/etc/pet">반려동물</a><br> 
						<a href="http://localhost:8080/board/etc/plant">식물</a>
                    </div>
                </div>
            </div>
	            <div id="middletap">
	                <div id="billboard"></div>
	                <form action="/board/modifyPost" method="post" id="write">
	                	<input type="hidden" name="posts_num" value="${read.posts_num}">
						<input type="text" name="posts_title" value="${read.posts_title}" required maxlength="40" style="width: 600px; height: 30px; margin: 10px;"><br><br>
	                    <textarea name="posts_content" required maxlength="300" style="width: 1000px; height: 600px; margin-left: 10px;">${read.posts_content}</textarea>
					    <input type="hidden" name="mainCategory" value="${mainCategory}">
					    <input type="hidden" name="subCategory" value="${subCategory}">
					    <c:choose>
					        <c:when test="${not empty param.minorCategory}">
					            <input type="hidden" name="minorCategory" value="${param.minorCategory}">
					        </c:when>
					    </c:choose>
	                    <div id="writebutton">
	                        <button type="submit">수정</button>
	                    </div>
	                </form>
            	</div>
            <div id="righttap">
                <div id="topic">
                    <div class="category_title">실시간 인기검색어</div>
                    <div class="category_list">
                        <a href="#">축구</a><br>
                        <a href="#">손흥민</a><br>
                        <a href="#">한일전</a><br>
                        <a href="#">롤</a><br>
                        <a href="#">아이디어</a><br>
                        <a href="#">고갈</a><br>
                    </div>
                </div>
                <div id="billboard_2">
                	<div id="billboard_2">
	                	<img src="<c:url value='/resources/images/banner2.jpg' />">
	                </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>