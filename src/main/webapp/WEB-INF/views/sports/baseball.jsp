<%@page import="com.sold.spring.talks.util.PagingUtil"%>
<%@page import="com.sold.spring.talks.util.PagingData"%>
<%@page import="com.sold.spring.talks.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야구 게시판</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/baseball.css">
</head>
<body>
	<script>
		var mainCategory = "${pagingData.pageUtil.posts_main_category}";
		var subCategory = "${pagingData.pageUtil.posts_sub_category}";
		var minorCategory = "${pagingData.pageUtil.posts_minor_category}";
	</script>
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
				<div id="boardtitle">야구 게시판</div>
				<div id="category">
					<a href="http://localhost:8080/board/sports/baseball?minorCategory=kbo" class="category1">KBO</a>
					<a href="http://localhost:8080/board/sports/baseball?minorCategory=mlb" class="category2">MLB</a>
					<a href="http://localhost:8080/board/sports/baseball?minorCategory=npb" class="category3">NPB</a>
					<a href="http://localhost:8080/board/sports/baseball?minorCategory=cpbl" class="category4">CPBL</a>
				</div>
				<div class="main_block">
					<div class="main_block">
						<table>
							<thead>
								<tr>
									<th>글 번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pagingData.boardDtoList}" var="boardDto">
									<tr>
										<td>${boardDto.posts_num}</td>
										<td><c:choose>
												<c:when
													test="${not empty pagingData.pageUtil.posts_main_category && not empty pagingData.pageUtil.posts_sub_category}">
													<c:choose>
														<c:when
															test="${not empty pagingData.pageUtil.posts_minor_category}">
															<c:set var="readLink"
																value="/board/${pagingData.pageUtil.posts_main_category}/${pagingData.pageUtil.posts_sub_category}/read/${boardDto.posts_num}?minorCategory=${pagingData.pageUtil.posts_minor_category}" />
														</c:when>
														<c:otherwise>
															<c:set var="readLink"
																value="/board/${pagingData.pageUtil.posts_main_category}/${pagingData.pageUtil.posts_sub_category}/read/${boardDto.posts_num}" />
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<c:set var="readLink"
														value="/board/read/${boardDto.posts_num}" />
												</c:otherwise>
											</c:choose> <a href="${readLink}">${boardDto.posts_title}</a></td>
										<td>${boardDto.member_nickname}</td>
										<td><fmt:formatDate pattern="MM-dd hh:mm"
												value="${boardDto.posts_date}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- 페이징 처리 -->
						<form>
							<ul class="pagination">
								<c:if test="${pagingData.pagingUtil.prevPage}">
									<li><c:choose>
											<c:when
												test="${empty pagingData.pageUtil.posts_minor_category}">
												<a
													href="?pageNum=${pagingData.pagingUtil.firstPage}${pagingData.pagingUtil.searchSet}">첫
													페이지</a>
											</c:when>
											<c:otherwise>
												<a
													href="?pageNum=${pagingData.pagingUtil.firstPage}${pagingData.pagingUtil.searchSet}&minorCategory=${pagingData.pageUtil.posts_minor_category}">첫
													페이지</a>
											</c:otherwise>
										</c:choose></li>
									<li><c:choose>
											<c:when
												test="${empty pagingData.pageUtil.posts_minor_category}">
												<a
													href="?pageNum=${pagingData.pagingUtil.firstPage - 1}${pagingData.pagingUtil.searchSet}">이전</a>
											</c:when>
											<c:otherwise>
												<a
													href="?pageNum=${pagingData.pagingUtil.firstPage - 1}${pagingData.pagingUtil.searchSet}&minorCategory=${pagingData.pageUtil.posts_minor_category}">이전</a>
											</c:otherwise>
										</c:choose></li>
								</c:if>

								<c:forEach begin="${pagingData.pagingUtil.firstPage}"
									end="${pagingData.pagingUtil.lastPage}" var="pageNumber">
									<c:choose>
										<c:when test="${pageNumber eq pagingData.pageUtil.pageNum}">
											<li class="active">${pageNumber}</li>
										</c:when>
										<c:otherwise>
											<li><c:choose>
													<c:when
														test="${empty pagingData.pageUtil.posts_minor_category}">
														<a
															href="?pageNum=${pageNumber}${pagingData.pagingUtil.searchSet}">${pageNumber}</a>
													</c:when>
													<c:otherwise>
														<a
															href="?pageNum=${pageNumber}${pagingData.pagingUtil.searchSet}&minorCategory=${pagingData.pageUtil.posts_minor_category}">${pageNumber}</a>
													</c:otherwise>
												</c:choose></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${pagingData.pagingUtil.nextPage}">
									<li><c:choose>
											<c:when
												test="${empty pagingData.pageUtil.posts_minor_category}">
												<a
													href="?pageNum=${pagingData.pagingUtil.lastPage + 1}${pagingData.pagingUtil.searchSet}">다음</a>
											</c:when>
											<c:otherwise>
												<a
													href="?pageNum=${pagingData.pagingUtil.lastPage + 1}${pagingData.pagingUtil.searchSet}&minorCategory=${pagingData.pageUtil.posts_minor_category}">다음</a>
											</c:otherwise>
										</c:choose></li>
									<li><c:choose>
											<c:when
												test="${empty pagingData.pageUtil.posts_minor_category}">
												<a
													href="?pageNum=${pagingData.pagingUtil.lastPage}${pagingData.pagingUtil.searchSet}">마지막
													페이지</a>
											</c:when>
											<c:otherwise>
												<a
													href="?pageNum=${pagingData.pagingUtil.lastPage}${pagingData.pagingUtil.searchSet}&minorCategory=${pagingData.pageUtil.posts_minor_category}">마지막
													페이지</a>
											</c:otherwise>
										</c:choose></li>
								</c:if>
							</ul>
						</form>
						<!-- 검색 -->
						<form class="search-form">
							<div>
								<select id="searchType" name="searchType">
									<option value="title"
										<c:if test="${pagingData.pageUtil.searchType eq 'title'}">selected</c:if>>제목</option>
									<option value="content"
										<c:if test="${pagingData.pageUtil.searchType eq 'content'}">selected</c:if>>내용</option>
									<option value="writer"
										<c:if test="${pagingData.pageUtil.searchType eq 'writer'}">selected</c:if>>작성자</option>
									<option value="title_content"
										<c:if test="${pagingData.pageUtil.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
								</select> <input type="text" name="searchWord"
									value="${pagingData.pageUtil.searchWord}">
								<c:if
									test="${not empty pagingData.pageUtil.posts_minor_category}">
									<input type="hidden" name="minorCategory"
										value="${pagingData.pageUtil.posts_minor_category}">
								</c:if>
								<input type="submit" value="검색">
							</div>
						</form>

						<!-- 글쓰기 -->
						<c:choose>
							<c:when
								test="${not empty pagingData.pageUtil.posts_main_category && not empty pagingData.pageUtil.posts_sub_category}">
								<c:choose>
									<c:when
										test="${not empty pagingData.pageUtil.posts_minor_category}">
										<a
											href="/board/${pagingData.pageUtil.posts_main_category}/${pagingData.pageUtil.posts_sub_category}/write?minorCategory=${pagingData.pageUtil.posts_minor_category}">글
											작성</a>
									</c:when>
									<c:otherwise>
										<a
											href="/board/${pagingData.pageUtil.posts_main_category}/${pagingData.pageUtil.posts_sub_category}/write">글
											작성</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a href="/board/write" class="writeButton">글 작성</a>
							</c:otherwise>
						</c:choose>
					</div>
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