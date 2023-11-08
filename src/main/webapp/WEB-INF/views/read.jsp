<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/comments.js?ver=3"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/read.css">
</head>
<body>
	<div id="background">
		<div id="toptap">
			<div id="logo">
				<div id="t1" class="table_cell">
					<a href="http://localhost:8080/">
					<img src="<c:url value='/resources/images/TALKSlogo.jpg' />" id="logoimg" alt="TALK'S 로고">
					</a>
				</div>
			</div>
			<div class="searchbar">
				<div id="t2" class="table_cell">
					<div id="searchdiv">
						<input type="search" placeholder="검색어를 입력하세요."> <a
							class="search" href="#">검색</a>
					</div>
				</div>
				<div id="login">
					<a href="http://localhost:8080/member/loginForm">로그인</a> <a
						href="http://localhost:8080/member/signupForm">회원가입</a>
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
						<a href="http://localhost:8080/board/etc/movie">영화</a><br> <a
							href="http://localhost:8080/board/etc/picture">사진</a><br> <a
							href="http://localhost:8080/board/etc/pet">반려동물</a><br> <a
							href="http://localhost:8080/board/etc/plant">식물</a>
					</div>
				</div>
			</div>
			<div id="middletap">
				<div id="billboard"></div>
				<table id="read">
					<thead id="readtitle">
						<tr>
							<th>${read.posts_title}</th>
						</tr>
						<tr>
							<th>${read.member_nickname}</th>
						</tr>
					</thead>
					<tbody id="readcontent">
						<tr>
							<td>${read.posts_content}</td>
						</tr>
					</tbody>
				</table>
				
				<div id="commentsList"></div>
				
				${sessionScope.member_nickname}
				<form id="commentForm" action="addComment" method="post">
					<input type="hidden" name="writer" value="<%= session.getAttribute("member_nickname") %>">
					<textarea id="content" name="content" placeholder="댓글 내용" style="width: 800px; height: 90px; margin: 5px" required></textarea>
					<input type="hidden" id="postId" name="postId" value="${read.posts_num}">
					<div id="writebutton">
						<button type="button" id="commentButton">댓글 작성</button>
					</div>	
				</form>
			<div id="deleteedit">
				<form action="/board/deletePost" id="deletePostButton" method="post">
					<input type="hidden" name="posts_num" value="${read.posts_num}">
					<input type="hidden" name="mainCategory" value="${mainCategory}">
					<input type="hidden" name="subCategory" value="${subCategory}">
					<c:choose>
						<c:when test="${not empty param.minorCategory}">
							<input type="hidden" name="minorCategory"
								value="${param.minorCategory}">
						</c:when>
					</c:choose>
					<c:choose>
						<c:when
							test="${sessionScope.member_nickname eq read.member_nickname}">
							<button type="submit">글 삭제</button>
						</c:when>
					</c:choose>
				</form>
				<c:choose>
				    <c:when test="${sessionScope.member_nickname eq read.member_nickname}">
				        <c:choose>
				            <c:when test="${not empty mainCategory && not empty subCategory}">
				                <c:choose>
				                    <c:when test="${not empty param.minorCategory}">
				                        <form method="GET" action="/board/${mainCategory}/${subCategory}/modifyPost/${read.posts_num}">
				                            <input type="hidden" name="minorCategory" value="${param.minorCategory}">
				                            <button type="submit" class="modifyButton">글 수정</button>
				                        </form>
				                    </c:when>
				                    <c:otherwise>
				                        <form method="GET" action="/board/${mainCategory}/${subCategory}/modifyPost/${read.posts_num}">
				                            <button type="submit" class="modifyButton">글 수정</button>
				                        </form>
				                    </c:otherwise>
				                </c:choose>
				            </c:when>
				            <c:otherwise>
				                <form method="GET" action="/board/modifyPost">
				                    <button type="submit" class="modifyButton">글 수정</button>
				                </form>
				            </c:otherwise>
				        </c:choose>
				    </c:when>
				</c:choose>
			</div>
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
                	<img src="<c:url value='/resources/images/banner2.jpg' />">
                </div>
				</div>
            </div>
        </div>
</body>
</html>