<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	   #navbar{
     display: flex;
     flex-direction:row;
      justify-content:end;
      margin-left:500px;
      white-space: nowrap;
      

   }
   #navbar a {
       color: white; /* White text color */
      text-decoration: none;
      margin: 0 50px;
      font-weight: bold;
      transition: color 0.5s ease;
      font-size: 18px;
   
   }
   #navbar>a:hover{font-weight: bold; text-decoration: underline;}
   
   .logo {
       display: flex;
       align-items: center;
   }

   .logo-container {
       width: 130px;
       height: 130px;
       background-image: inherit; 
       background-size: cover;
       background-position: center;
       position: relative;
       margin-bottom: 15px;
       margin-left:50px;
   }

   .logo-container img {
       width: 100%;
       height: 100%;
       object-fit: contain;
   }
   
   #navbar-section {
         background-color: transparent; /* transparent background */
          display: flex;
          align-items: center;
          justify-content: space-around;
          padding: 10px 20px;
          transition: background-color 0.5s ease;
         border-bottom: 0.5px solid lightgray;
         height:80px;
   }

</style>
</head>
<body>
	<c:if test="${ empty loginUser }">
	 <div id="navbar-section">
            <div class="logo">
                <div class="logo-container">
                    <a href="${ contextPath }"><img id="logo-image" src="resources/image/newLogo.png" alt="로고"></a>
                </div>
            </div>
            <div id="navbar">
                <a href="${contextPath}/surpport.do">후원하기</a>
                <a href="${contextPath}/loginView.me">Login</a>
                <a href="${contextPath}/signUp.me">회원가입</a>
                <a href="${contextPath}/myPage.me">마이 페이지</a>
            </div>
     </div>
	</c:if>
	<c:if test="${ !empty loginUser }">
		<div id="navbar">
	    	<div class="logo"></div>
        	<div class="nav-links">
	              <a href="${contextPath}/surpport.do">후원하기</a>
	              <b>${loginUser.empName}님, 반갑습니다.</b>
	              <a href="${contextPath}/myPage.me">마이 페이지</a>
	              <a href="${contextPath}/logout.me">로그아웃</a>
         	</div>
		</div>
	</c:if>
	
	
	
	
	<script>
	
	function changeBackground() {
        const navbarSection = document.getElementById('navbar-section');
        navbarSection.style.backgroundColor = "white";
        const links = navbarSection.querySelectorAll('a');
        links.forEach(function(link) {
            link.style.color = "black";
        });
    }

    function resetBackground() {
        const navbarSection = document.getElementById('navbar-section');
        navbarSection.style.backgroundColor = "transparent";
        const links = navbarSection.querySelectorAll('a');
        links.forEach(function(link) {
            link.style.color = "white";
        });
    }
	
	</script>
	
	
	
	
	
	
</body>
</html>