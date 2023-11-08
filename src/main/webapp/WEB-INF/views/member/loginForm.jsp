<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/login.css">
</head>
<body>
    <div id="box">
        <div id="login_box" >
            <form action="/member/login" method="post">
                <h1><b class="white_text">TALK'S</b></h1>
                <h3 class="white_text">로그인</h3>
                <input id="id" placeholder="아이디" name="member_id" required style="width:300px; height: 50px;"><br>
                <input id="pw" type="password" placeholder="비밀번호" name="member_pw" required style="width: 300px; height: 50px;"><br>
                <input type="submit" value="로그인" style="width: 100px; height: 50px; float:left;">
                <a href="/member/signupForm"><input type="button" value="회원가입" style="width: 100px; height: 50px; float:left; margin-left: 30px;"></a>
            </form>
        </div>
    </div>
    
	<script>
		var loginFailed = '${param.loginFailed}';
		if (loginFailed === 'true') {
			alert('로그인에 실패했습니다. 아이디와 비밀번호를 다시 확인하세요.');
		}
	</script>
</body>
</html>