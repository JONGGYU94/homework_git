<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login System</title>
    <style>
    
    	#topAndNavbar {
		background-image:linear-gradient(
	        rgba(0, 0, 0, 0.2),
	        rgba(0, 0, 0, 0.2)
	      )
	      ,url('resources/image/topImage.png');
	    background-size: cover; 
	    background-position: center;
	    background-repeat: no-repeat;
	    transition: background-color 0.5s ease;
	}
		#voulnteer2 {
			height: 200px;
		}
	
  
        .container {
            width: 1200px;
            max-width: 1200px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            border:8px solid #E3E3E3;
            /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
        }
        .container input[type="text"], .container input[type="password"], .container input[type="number"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #cccccc;
        }
        .container button, .container a {
            display: block;
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            text-align: center;
            background-color: #007bff;
            color: #E3E3E3;
            border: none;
            border-radius: 4px;
            text-decoration: none;
        }
        .container button:hover, .container a:hover {
            background-color: #0056b3;
        }
        .qr-code {
            text-align: center;
        }
    </style>
</head>
<body>
	<div id=topAndNavbar>
 		<div id="navbar-section2" onmouseover="changeBackground()" onmouseout="resetBackground()">
	        <jsp:include page="../common/navbar.jsp" />
	    </div>    
	    <div id="top-section">
	        <jsp:include page="../common/top.jsp" />
	    </div>
		<div id="voulnteer2">
			<jsp:include page="../common/volunteer.jsp"/>
		</div>	
 	</div>

	<div align="center">
	    <div class="container mt-5" id="main-page">
	        <label style="margin:20px; margin-left:15px; font-size:48px;"><b>L O G I N</b> </label>
	        <form action="loginCheck.me" method="post">
		        <input type="text" name="memberId" id="id" style="width:400px" placeholder="아이디"><br><br>
		        <input type="password" name="memberPwd" style="width:400px" id="login-password" placeholder="패스워드">
		        <button style="width:400px">로그인</button>
	        </form>
	        <button  style="width:400px" onclick="findId()">아이디 찾기</button>
	        <button  style="width:400px" onclick="findPwd()">비밀번호 찾기</button>
	    </div>
	    
	
	</div>
	
	<div id="footer">
 			<jsp:include page="../common/footer.jsp"/>
 	</div>
 	<div id="fixedBtn">
 		<jsp:include page="../common/fixedBtn.jsp"/>
 	</div>		
	
    <script>
        function showPage(pageId) {
            const pages = document.querySelectorAll('.container');
            pages.forEach(page => page.style.display = 'none');
            document.getElementById(pageId).style.display = 'block';
        }


        function findId(){
        	location.href="findId.me";
        }
        
        function findPwd(){
        	location.href="findPwd.me";
        }
        
        
        const beforeURL = document.referrer;		//이전에 있던 url 가져오는 새로운 메소드네?? ○★★★ㅁ8
		console.log(beforeURL);
        console.log('야!!');
       	const msg = '${msg}';
       	if(msg != ''){
       		alert(msg);
       	}
        </script>
        <% session.removeAttribute("msg"); %>
  </body>
  </html>

