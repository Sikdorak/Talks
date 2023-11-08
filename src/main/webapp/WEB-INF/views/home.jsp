<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/home.css">
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
				<c:if test="${empty sessionScope.member_id}">
				    <div id="login">
				        <a href="http://localhost:8080/member/loginForm">로그인</a>
				        <a href="http://localhost:8080/member/signupForm">회원가입</a>
				    </div>
				</c:if>
				<c:if test="${not empty sessionScope.member_id}">
				    <div id="login">
				        <a href="http://localhost:8080/member/logout">로그아웃</a>
				        <a href="http://localhost:8080/member/profile">프로필</a>
				    </div>
				</c:if>
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
                <table class="cg">
                    <thead class="cg_t">
                        <tr>
                            <th> 축구 최신글 </th>
                            <th> 야구 최신글 </th>
                        </tr>
                    </thead>
                    <tbody class="cg_l">
                        <tr>
							<td>
								<ul class="data1">
									<c:forEach items="${data1List}" var="posts1">
										<li><a href="http://localhost:8080/board/${posts1.posts_main_category}/${posts1.posts_sub_category}/read/${posts1.posts_num}">${posts1.posts_title}</a></li>
									</c:forEach>
								</ul>
							</td>
							<td>
								<ul class="data2">
									<c:forEach items="${data2List}" var="posts2">
										<li><a href="http://localhost:8080/board/${posts2.posts_main_category}/${posts2.posts_sub_category}/read/${posts2.posts_num}">${posts2.posts_title}</a></li>
									</c:forEach>
								</ul>
							</td>
						</tr>
                    </tbody>
                </table>
                <table class="cg">
                    <thead class="cg_t">
                        <tr>
                            <th> 영화 최신글</th>
                            <th> 리니지 최신글</th>
                        </tr>
                    </thead>
                    <tbody class="cg_l">
                        <tr></tr>
                    </tbody>
                </table>
                <table class="cg">
                    <thead class="cg_t">
                        <tr>
                            <th>| 카테고리 ></th>
                            <th>| 카테고리 ></th>
                        </tr>
                    </thead>
                    <tbody class="cg_l">
                        <tr></tr>
                    </tbody>
                </table>
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
