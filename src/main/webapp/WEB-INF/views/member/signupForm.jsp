<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/signup.css">
</head>
<body>
	    <div id="background_box">
            <div id="sign_in_box">
                <form action="/member/signup" method="post" id="form">
                    <h1><b class="white_text">TALK'S</b></h1>
                    <h3 class="white_text">회원가입</h3>
                    <input type="text" id="id" name="member_id" maxlength="15" required placeholder="아이디"><br>
                    <input type="password" id="pw" name="member_pw" maxlength="15" required placeholder="비밀번호"><br>
                    <input type="text" id="name" name="member_nickname" maxlength="20" required placeholder="닉네임"><br>
                    <input type="text" id="name" name="member_name"  maxlength="20" required placeholder="이름(실명)"><br>
                    <input id="submit" type="submit" value="회원가입" style="width:90px; height:50px; float:left;">
                    <input type="reset" value=" 초기화" style="width:90px; height:50px; float:left; margin-left: 20px;">
                </form>
            </div>
        </div>
</body>
</html>