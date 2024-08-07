<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - HomeWork</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
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
	#topAndNavbar {
		background-image:linear-gradient(
	        rgba(0, 0, 0, 0.2),
	        rgba(0, 0, 0, 0.2)
	      )
	      ,url('image/topImage.png');
	    background-size: cover; 
	    background-position: center;
	    background-repeat: no-repeat;
	    transition: background-color 0.5s ease;
	}

	#container{display:flex; flex-wrap: wrap; width:100%;}
	#adminMenu{display:inline-block; border-right:1px groove gray; height: 700px; width:15%; }
	.mainCate{background: skyblue; border-radius:5px; font-weight:bold; font-size: 17px; height:36px; border-top:1px solid white;border-bottom:1px solid white; cursor: pointer;}
	.mainCate:hover{text-decoration: underline;}
	.hidden{display:none;}
	.cate{background:white; font-weight:none; font-size:14px; text-align:left ; list-style-type:none; }
	#selectDiv{display:inline-block;  width:75%; padding:1px;margin-left: 10px;}
	#adminContent{height:95%; width:100%; border:1px solid black; margin-top:8px;}
	
	
	
	.userInfo, .userUpdate, .userDelete, .supportPage, .searchResult, .infoList, .volunteer, .volunteerApprove, .volunteerRafusal {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.1); /* 그리드 컨테이너 그림자 */
            margin-top: 20px;
            width:90%;
            
        }
	.userInfo, .searchResult td{
		cursor: pointer;
	}
    .userInfo div {
            margin-bottom: 10px;
        }
    .menubar{
    	cursor: pointer;}
	
	table{
		text-align: center;
	}
	th {
        border-bottom: 1px solid black;
    }
    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="tel"] {
        width: 100%;
        box-sizing: border-box;
    }
    .statusYN.selectState{
    	background: lightgreen;
    	display: inline-block;
    	border: 1px solid black;
    	padding: 5px 10px;
	}
	
	.statusYN.unselectState{
	    background: gray;
	    display: inline-block;
    	border: 1px solid black;
    	padding: 5px 10px;
	}
	.adminYN.selectState{
    	background: lightgreen;
    	display: inline-block;
    	border: 1px solid black;
    	padding: 5px 10px;
	}
	
	.adminYN.unselectState{
	    background: gray;
	    display: inline-block;
    	border: 1px solid black;
    	padding: 5px 10px;
	}
	 .form-container {
            display: flex;
            justify-content: flex-end;
        }
</style>


</head>
<body>
	<div class="logo">
       <div class="logo-container">
           <a href="${ contextPath }"><img id="logo-image" src="resources/image/newLogo.png" alt="로고"></a>
        </div>
    </div>
	<h1 align="center"> 관리자페이지 </h1>
	
	<div id="container">
		<div align="center" id=adminMenu>
			<div style="border:1px solid skyblue; background:skyblue; height:32px"><a onClick="window.location.reload()">통계</a></div>
			
			<div class="mainCate" style="margin-top:10px" >회원정보관리</div>
				<ul class="menubar hidden" style="list-style-type:none; text-align:left;">
					<li id="user1">회원 정보 조회</li>
					<li id="user2">회원 정보 수정</li>
					<li id="user3">회원 탈퇴</li>
				</ul>
			
			<div class=mainCate>후원정보관리</div>
				<ul class="menubar hidden" style="list-style-type:none; text-align:left;">
					<li id="support1">후원 목록</li>
					
				</ul>
			<div class=mainCate>게시판관리</div>
				<ul class="menubar hidden" style="list-style-type:none; text-align:left;">
					<li id="board1">국내게시판</li>
					<li id="board2">해외게시판</li>
					<li id="board3">후기게시판</li>
				</ul>
			<div class=mainCate>봉사신청관리</div>
				<ul class="menubar hidden" style="list-style-type:none; text-align:left;">
					<li id="volunteer1">
						봉사대기목록
						<button type="button" class="btn btn-danger btn-sm">
						 	 <span class="badge rounded-pill text-bg-danger" id="volunteerApplicant"></span>
						</button>
					</li>
					<li id="volunteer2">승인목록</li>
					<li id="volunteer3">거부목록</li>
				</ul>
			</div>
					
		<div id=selectDiv>
			<div style="border:2px solid #CCCCCC; height:40px">
			<form id="searchForm">
   				 <select id="searchType">
					<option value="member_name">회원이름</option> 
					<option value="member_No">회원번호</option>
					<option value="nickName">닉네임</option> 
				</select>
				<input type="text" placeholder="회원정보 입력" style="width:35%" id="searchText">
				<button id="searchBtn" type="button" onclick="searchMember()">검색</button><br>
			</form>
			</div>
			
			<div align="center" id=adminContent>
				<div class="infoList" id="infoList">
						<table id="infoList" class="table table-bordered">
				            <thead>
				                <tr>
				                    <th>통계 항목</th>
				                    <th>값</th>
				                </tr>
				            </thead>
				            <tbody>
				                <tr>
				                    <th>총 회원 수</th>
				                    <th id="totalMembers"></th>
				                </tr>
				                <tr>
				                    <td>활동 중인 회원 수</td>
				                    <td id="activeMembers"></td>
				                </tr>
				                <tr>
				                    <td>활동 중지된 회원 수</td>
				                    <td id="inactiveMembers"></td>
				                </tr>
				                <tr>
				                    <th>총 봉사활동 수</th>
				                    <th id="totalBoard"></th>
				                </tr>
				                <tr>
				                    <td>대기중인 봉사활동 수</td>
				                    <td id="startVolunteer"></td>
				                </tr>
				                <tr>
				                    <td>진행중인 봉사활동 수</td>
				                    <td id="proceedingVolunteer"></td>
				                </tr>
				                <tr>
				                    <td>종료된 봉사활동 수</td>
				                    <td id="endVolunteer"></td>
				                </tr>
				                
				                <tr>
				                    <th>총 후원액</th>
				                    <th id="totalAmount"></th>
				                </tr>
				                <tr>
				                	<td>국내 후원액</td>
				                	<td id=domesticAmount></td>
				                </tr>
				                <tr>
				                	<td>해외 후원액</td>
				                	<td id=globalAmount></td>
				                </tr>
				            </tbody>
				        </table>
		    		</div>	
		    	
	    	
				<div class="searchResult hidden" id=searchResult>
		    		<table id="searchList">
		    			<thead>
							<tr>
								<th width="8%">회원번호</th>
								<th width="10%">이름</th>
								<th width="10%">닉네임</th>
								<th width="10%">이메일</th>
								<th width="10%">휴대폰번호</th>
								<th width="12%">주소</th>
								<th width="10%">나이</th>
								<th width="12%">가입날짜</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
						
					</table>
					</div>
					
				 <div class="userInfo hidden" id=userInfo>
				    	<table id="memberList">
				    		<thead>
								<tr>
									<th width="6%">회원번호</th>
									<th width="10%">이름</th>
									<th width="10%">닉네임</th>
									<th width="10%">이메일</th>
									<th width="10%">휴대폰번호</th>
									<th width="14%">주소</th>
									<th width="10%">나이</th>
									<th width="12%">가입날짜</th>
									<th width="6%">활동</th>
									<th width="6%">관리자</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
								<tfoot>
							        <tr>
							            <td colspan="10">
							                <nav aria-label="Standard pagination example" style="float: center;">
							                    <ul id="pagination1" class="pagination">
							                    
							                    </ul>
							                </nav>
							            </td>
							        </tr>
							    </tfoot>
							</table>
					</div>
					<div class="userUpdate hidden" id="userUpdate">
							<table id="memberUpdate">
								<thead>
									<tr>
										<th width="6%">회원번호</th>
										<th width="6%">이름</th>
										<th width="10%">닉네임</th>
										<th width="12%">이메일</th>
										<th width="14%">주소</th>
										<th width="10%">휴대폰번호</th>
										<th width="7%">활동</th>
										<th width="7%">관리자</th>
										<th width="8%">정보변경</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
								<tfoot>
							        <tr>
							            <td colspan="10">
							                <nav aria-label="Standard pagination example" style="float: center;">
							                    <ul id="pagination2" class="pagination">
							                    
							                    </ul>
							                </nav>
							            </td>
							        </tr>
							    </tfoot>
							</table>
					</div>
				<div class="userDelete hidden" id="userDelete">
						<table id="memberDelete">
						<thead>
							<tr>
								<th width="10%">회원번호</th>
								<th width="10%">이름</th>
								<th width="10%">닉네임</th>
								<th width="10%">이메일</th>
								<th width="10%">휴대폰번호</th>
								<th width="10%">생년월일</th>
								<th width="12%">가입날짜</th>
								<th width="10%">탈퇴</th>
							</tr>
						</thead>
						<tbody>
													
						</tbody>
						<tfoot>
					        <tr>
					            <td colspan="10">
					                <nav aria-label="Standard pagination example" style="float: center;">
					                    <ul id="pagination3" class="pagination">
					                    
					                    </ul>
					                </nav>
					            </td>
					        </tr>
					    </tfoot>
						</table>
				</div>
			<div class="supportPage hidden" id="supportList">
					<table id="supportTable">
						<thead>
							<tr>
								<th width="10%">번호</th>
								<th width="10%">회원번호</th>
								<th width="10%">이름</th>
								<th width="10%">이메일</th>
								<th width="10%">휴대폰번호</th>
								<th width="10%">후원분야</th>
								<th width="10%">후원날짜</th>
								<th width="10%">후원금액(원)</th>
							</tr>
						</thead>
						<tbody>
			
						</tbody>
						<tfoot>
					        <tr>
					            <td colspan="10">
					                <nav aria-label="Standard pagination example" style="float: center;">
					                    <ul id="pagination4" class="pagination">
					                    
					                    </ul>
					                </nav>
					            </td>
					        </tr>
					    </tfoot>
					</table>
				</div>
				<div class="domesticBoardPage hidden" id="domesticBoardList">
					<table id="domesticBoardTable">
					</table>
				</div>
				
				<div class="globalBoardPage hidden" id="globalBoardList">
					<table id="globalBoardTable">
					</table>
				</div>
				<div class="volunteer hidden" id="volunteerList">
					<table id="volunteerTable">
						<thead>
							<tr>
								<th width="10%">봉사번호</th>
								<th width="10%">회원번호</th>
								<th width="10%">이름</th>
								<th width="10%">제목</th>
								<th width="10%">현재상태</th>
								<th width="10%">처리</th>
							</tr>
						</thead>
						<tbody>
			
						</tbody>
						<tfoot>
					        <tr>
					            <td colspan="10">
					                <nav aria-label="Standard pagination example" style="float: center;">
					                    <ul id="pagination5" class="pagination">
					                    
					                    </ul>
					                </nav>
					            </td>
					        </tr>
					    </tfoot>
					</table>
					</div>
					<div class="volunteerApprove hidden" id="volunteerApproveList">
					<table id="volunteerApproveTable">
						<thead>
							<tr>
								<th width="10%">봉사번호</th>
								<th width="10%">회원번호</th>
								<th width="10%">이름</th>
								<th width="10%">제목</th>
								<th width="10%">현재상태</th>
								<th width="10%">처리</th>
							</tr>
						</thead>
						<tbody>
			
						</tbody>
						<tfoot>
					        <tr>
					            <td colspan="10">
					                <nav aria-label="Standard pagination example" style="float: center;">
					                    <ul id="pagination6" class="pagination">
					                    
					                    </ul>
					                </nav>
					            </td>
					        </tr>
					    </tfoot>
					</table>
					</div>
					<div class="volunteerRafusal hidden" id="volunteerRafusalList">
					<table id="volunteerRafusalTable">
						<thead>
							<tr>
								<th width="10%">봉사번호</th>
								<th width="10%">회원번호</th>
								<th width="10%">이름</th>
								<th width="10%">제목</th>
								<th width="10%">현재상태</th>
								<th width="10%">처리</th>
							</tr>
						</thead>
						<tbody>
			
						</tbody>
						<tfoot>
					        <tr>
					            <td colspan="10">
					                <nav aria-label="Standard pagination example" style="float: center;">
					                    <ul id="pagination7" class="pagination">
					                    
					                    </ul>
					                </nav>
					            </td>
					        </tr>
					    </tfoot>
					</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" tabindex="-1" role="dialog" id="modalApprove">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">승인하시겠습니까?</h3>
	      			</div>
	      			<div class="modal-footer flex-nowrap p-0">
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="approveModal">
	        				<strong>네</strong>
	        			</button>
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal"  id="approveClose">아니오</button>
	      			</div>
	    		</div>
	  		</div>
		</div>
		<div class="modal fade" tabindex="-1" role="dialog" id="modalRefusal">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">거부하시겠습니까?</h3>
	      			</div>
	      			<div class="modal-footer flex-nowrap p-0">
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="refusalModal">
	        				<strong>네</strong>
	        			</button>
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal" aria-label="Close"  id="refusalClose">아니오</button>
	      			</div>
	    		</div>
	  		</div>
		</div>
	
	<script>
	
	function statistics() {
        $.ajax({
            url: '${contextPath}/adminStatistics.ad',
            method: 'GET',
            success: data=> {
                document.getElementById('totalMembers').innerText = data.totalMember+"명";
                document.getElementById('activeMembers').innerText = data.activeMember+"명";
                document.getElementById('inactiveMembers').innerText = data.inactiveMember+"명";
                document.getElementById('totalBoard').innerText = data.totalBoard+"건";
                document.getElementById('totalAmount').innerText = data.totalAmount+"원";
                document.getElementById('domesticAmount').innerText = data.domesticAmount+"원";
                document.getElementById('globalAmount').innerText = data.globalAmount+"원";
                document.getElementById('volunteerApplicant').innerText = data.volunteerApplicant;
                document.getElementById('startVolunteer').innerText = data.startVolunteer+"건";
                document.getElementById('endVolunteer').innerText = data.endVolunteer+"건";
                document.getElementById('proceedingVolunteer').innerText = data.proceedingVolunteer+"건";
                
            },
            error: function(error) {
                console.error('Error fetching statistics:', error);
            }
        });
    }
	function statusText(status) {
        switch (status) {
            case 'W':
                return '대기중';
            case 'Y':
                return '승인완료';
            case 'N':
                return '승인거부';
            default:
            	return '오류';
        }
    }
		window.onload =() =>{
			statistics();
			const mainCate = document.getElementsByClassName('mainCate');
			 mainCate[0].addEventListener('click', function() {
	                this.nextElementSibling.classList.toggle('hidden');
	                
	            });
			 mainCate[1].addEventListener('click', function() {
	                this.nextElementSibling.classList.toggle('hidden');
	                
	            });
			 mainCate[2].addEventListener('click', function() {
	                this.nextElementSibling.classList.toggle('hidden');
	                
	            });
			 mainCate[3].addEventListener('click', function() {
	                this.nextElementSibling.classList.toggle('hidden');
	                
	            });
			 
			document.getElementById('approveModal').addEventListener('click',()=>{
		        $('#modalApprove').modal('hide');
		        $('#approveClose').modal('hide');
				const modal = document.getElementById('modalApprove');
		        const volunteerNo = modal.dataset.volunteerNo;
		        const memberNo= modal.dataset.memberNo;
		        const status = modal.dataset.status;
		        const statusTdId = modal.dataset.statusTdId;
		        const statusTd = document.getElementById(statusTdId);
		        updateStatus(volunteerNo, memberNo, status, statusTd);
		        console.log(statusTdId);
		        console.log(statusTd)
			});
			document.getElementById('refusalModal').addEventListener('click',()=>{
		        $('#modalRefusal').modal('hide');
		        $('#refusalClose').modal('hide');
				const modal = document.getElementById('modalRefusal');
		        const volunteerNo = modal.dataset.volunteerNo;
		        const memberNo= modal.dataset.memberNo;
		        const status = modal.dataset.status;
		        const statusTdId = modal.dataset.statusTdId;
		        const statusTd = document.getElementById(statusTdId);
		        updateStatus(volunteerNo, memberNo, status, statusTd);
			});
			
			 $('#approveClose').click(function() {
	                $('#modalApprove').modal('hide');
	            });

	            $('#refusalClose').click(function() {
	                $('#modalRefusal').modal('hide');
	            });
			 
		}
			
			 
			 
			 document.getElementById('user1').addEventListener('click', function() {
				    document.getElementById('userInfo').classList.toggle('hidden');
				    document.getElementById('userUpdate').classList.add('hidden');
				    document.getElementById('userDelete').classList.add('hidden');
				    document.getElementById('supportList').classList.add('hidden');
				    document.getElementById('searchResult').classList.add('hidden');
				    document.getElementById('domesticBoardList').classList.add('hidden');
				    document.getElementById('globalBoardList').classList.add('hidden');
				    document.getElementById('volunteerList').classList.add('hidden');
				    document.getElementById('volunteerApproveList').classList.add('hidden');
				    document.getElementById('volunteerRafusalList').classList.add('hidden');
				    document.getElementById('infoList').classList.add('hidden');

				    let currentPage = 1;
				    const pageSize = 10;

				    function loadPage1(page) {
						
				        const url = '${contextPath}/adminMemberList.ad?page='+ page +'&size=' + pageSize;

				        $.ajax({
				            url: url,
				            method: 'GET',
				            success: function(data) {

				                if (data && data.member) {
				                    document.getElementById('memberList').classList.remove('hidden');
				                    const memberList = document.getElementById('memberList');
				                    const tbody = memberList.querySelector('tbody');
				                    tbody.innerHTML = '';
								
				                    
				                    data.member.forEach(m => {
				                        const tr = document.createElement('tr');

				                        const noTd = document.createElement('td');
				                        noTd.innerText = m.memberNo;
				                        const nameTd = document.createElement('td');
				                        nameTd.innerText = m.memberName;
				                        const nickTd = document.createElement('td');
				                        nickTd.innerText = m.nickName;
				                        const emailTd = document.createElement('td');
				                        emailTd.innerText = m.email;
				                        const phoneTd = document.createElement('td');
				                        phoneTd.innerText = m.phone;
				                        const addressTd = document.createElement('td');
				                        addressTd.innerText = m.address;
				                        const ageTd = document.createElement('td');
				                        ageTd.innerText = m.age;
				                        const createDateTd = document.createElement('td');
				                        createDateTd.innerText = m.createDate;
				                        const statusTd = document.createElement('td');
				                        statusTd.innerText = m.status;
				                        const adminTd = document.createElement('td');
				                        adminTd.innerText = m.isAdmin;
										
				                        const tds = [noTd, nameTd, nickTd, emailTd, phoneTd, addressTd, ageTd, createDateTd, statusTd, adminTd];
				                        tds.forEach(td => {
				                            td.addEventListener('click', () => {
				                                window.location.href = '${contextPath}/adminSelectMember.ad?memberNo=' + m.memberNo ;
				                            });
				                        });
				                        
				                        tr.append(noTd, nameTd, nickTd, emailTd, phoneTd, addressTd, ageTd, createDateTd, statusTd, adminTd);
				                        tbody.append(tr);
				                    });

				                    const pagination = document.getElementById('pagination1');
				                    pagination.innerHTML = '';

				                    
				                    if (data.maxPage > 1) {
				                        for (let i = 1; i <= data.maxPage; i++) {
				                        	const pageItem = document.createElement('li');
				                        	pageItem.classList.add('page-item');
				                            const pageLink = document.createElement('a');
				                            pageLink.classList.add('page-link');
				                            pageLink.href = '#';
				                            pageLink.innerText = i;
				                            (function(pageNumber) {
				                                pageLink.addEventListener('click', function(event) {
				                                    event.preventDefault();
				                                    loadPage1(pageNumber);
				                                });
				                            })(i);

				                            if (i === page) {
				                                pageItem.classList.add('active');
				                            } else {
				                                pageItem.classList.remove('active');
				                            }
											pageItem.append(pageLink)
				                            pagination.append(pageItem);
				                        }
				                    }
				                } else {
				                    console.error(data);
				                }
				            },
				            error: function(error) {
				                console.error(error);
				            }
				        });
				    }

				    loadPage1(currentPage); 
				});



			 
			  document.getElementById('user2').addEventListener('click', function(){
				 document.getElementById('userUpdate').classList.toggle('hidden');
				 document.getElementById('userInfo').classList.add('hidden');
				 document.getElementById('userDelete').classList.add('hidden');
				 document.getElementById('supportList').classList.add('hidden');
				 document.getElementById('searchResult').classList.add('hidden');
				 document.getElementById('domesticBoardList').classList.add('hidden');
				 document.getElementById('globalBoardList').classList.add('hidden');
				 document.getElementById('volunteerList').classList.add('hidden');
				 document.getElementById('volunteerApproveList').classList.add('hidden');
				 document.getElementById('volunteerRafusalList').classList.add('hidden');
				 document.getElementById('infoList').classList.add('hidden');
				 
				let currentPage = 1;
			    let page = 1;
			    const pageSize = 10;

			    function loadPage3(page) {

					
			        const url = '${contextPath}/adminMemberList.ad?page='+ page +'&size=' + pageSize;

			        $.ajax({
			            url: url,
			            method: 'GET',
			            success: function(data) {

			                if (data && data.member) {
			                    document.getElementById('memberUpdate').classList.remove('hidden');
			                    const memberUpdate = document.getElementById('memberUpdate');
			                    const tbody = memberUpdate.querySelector('tbody');
			                    tbody.innerHTML = '';

			                    data.member.forEach(m => {
				 
									const tr = document.createElement('tr');
									
									const noTd = document.createElement('td');
									noTd.innerText = m.memberNo;
									const nameTd = createInputTd('memberName', m.memberName);
									const nickTd = createInputTd('nickName', m.nickName);
									const emailTd = createInputTd('email', m.email);
									const phoneTd = createInputTd('phone', m.phone);
									const addressTd = createInputTd('address', m.address);
									
									const statusTd = document.createElement('td');
						            const statusButton = document.createElement('button');
						            statusButton.innerText = m.status === 'Y' ? 'Y' : 'N';
						            statusButton.addEventListener('click', function() {
						                toggleStatus(m.status, m.memberNo, statusButton);
						            });
						            statusTd.appendChild(statusButton);
									
						            const adminTd = document.createElement('td');
						            const adminButton = document.createElement('button');
						            adminButton.innerText = m.isAdmin === 'Y' ? 'Y' : 'N';
						            adminButton.addEventListener('click', function() {
						                toggleAdmin(m.isAdmin, m.memberNo, adminButton);
						            });
						            adminTd.appendChild(adminButton);
									
						            const nameInput = nameTd.querySelector('input');
						            const nickInput = nickTd.querySelector('input');
						            const emailInput = emailTd.querySelector('input'); 
						            const addressInput = addressTd.querySelector('input');
						            const phoneInput = phoneTd.querySelector('input'); 
						            
						            
									const updateButtonTd = document.createElement('td');
					                const updateButton = document.createElement('button');
					                updateButton.innerText = '수정';
	
					                
					                updateButton.addEventListener('click', function() {
					                    updateMember(m.memberNo, nameInput.value, nickInput.value, emailInput.value, addressInput.value, phoneInput.value);
					                });

					                updateButtonTd.appendChild(updateButton);
									
									tr.append(noTd);
									tr.append(nameTd);
									tr.append(nickTd);
									tr.append(emailTd);
									tr.append(addressTd);
									tr.append(phoneTd);
									tr.append(statusTd);
									tr.append(adminTd);
									tr.append(updateButtonTd);
									
									tbody.append(tr);
								});
			                    
				                    const pagination = document.getElementById('pagination2');
				                    pagination.innerHTML = '';
	
				                    if (data.maxPage > 1) {
				                        for (let i = 1; i <= data.maxPage; i++) {
				                        	const pageItem = document.createElement('li');
				                        	pageItem.classList.add('page-item');
				                            const pageLink = document.createElement('a');
				                            pageLink.classList.add('page-link');
				                            pageLink.href = '#';
				                            pageLink.innerText = i;
				                            pageLink.addEventListener('click', function(event) {
				                                event.preventDefault();
				                                loadPage3(i);
				                            });
	
				                            if (i === data.currentPage) {
				                                pageItem.classList.add('active');
				                            } else {
				                                pageItem.classList.remove('active');
				                            }
	
				                            pageItem.append(pageLink);
				                            pagination.append(pageItem);
				                        }
				                    }
				                } else {
				                    console.error(data);
				                }
				            },
				            error: function(error) {
				                console.error(error);
				            }
				        });
				    }
	
				    loadPage3(currentPage); 
				});
			 
			 function createInputTd(className, value) {
			    const td = document.createElement('td');
			    const input = document.createElement('input');
			    input.type = 'text';
			    input.className = className;
			    input.value = value;
			    td.appendChild(input);
			    return td;
			}
			 
			 
			 
			 document.getElementById('user3').addEventListener('click', function(){
				 document.getElementById('userDelete').classList.toggle('hidden');
				 document.getElementById('userInfo').classList.add('hidden');
				 document.getElementById('userUpdate').classList.add('hidden');
				 document.getElementById('supportList').classList.add('hidden');
				 document.getElementById('searchResult').classList.add('hidden');
				 document.getElementById('domesticBoardList').classList.add('hidden');
				 document.getElementById('globalBoardList').classList.add('hidden');
				 document.getElementById('volunteerList').classList.add('hidden');
				 document.getElementById('volunteerApproveList').classList.add('hidden');
				 document.getElementById('volunteerRafusalList').classList.add('hidden');
				 document.getElementById('infoList').classList.add('hidden');
				 
				 let currentPage = 1;
				 let page = 1;
				 const pageSize = 10;

	      	     function loadPage2(page) {
				        const url = '${contextPath}/adminMemberList.ad?page='+ page +'&size=' + pageSize;

				        $.ajax({
				            url: url,
				            method: 'GET',
				            success: function(data) {

				                if (data && data.member) {
				                    document.getElementById('memberDelete').classList.remove('hidden');
				                    const memberDelete = document.getElementById('memberDelete');
				                    const tbody = memberDelete.querySelector('tbody');
				                    tbody.innerHTML = '';

				                    data.member.forEach(m => {
										const tr = document.createElement('tr');
										
										const noTd = document.createElement('td');
										noTd.innerText = m.memberNo;
										const nameTd = document.createElement('td');
										nameTd.innerText = m.memberName;
										const nickTd = document.createElement('td');
										nickTd.innerText = m.nickName;
										const emailTd = document.createElement('td');
										emailTd.innerText = m.email;
										const phoneTd = document.createElement('td');
										phoneTd.innerText = m.phone;
										const ageTd = document.createElement('td');
										ageTd.innerText = m.age;
										const createDateTd = document.createElement('td');
										createDateTd.innerText = m.createDate;
										
										const deleteButtonTd = document.createElement('td');
						                const deleteButton = document.createElement('button');
						                deleteButton.innerText = '탈퇴';
		
						                deleteButton.addEventListener('click', function() {
						                    deleteMember(m.memberNo);
						                });

				                deleteButtonTd.appendChild(deleteButton);
								
								tr.append(noTd);
								tr.append(nameTd);
								tr.append(nickTd);
								tr.append(emailTd);
								tr.append(phoneTd);
								tr.append(ageTd);
								tr.append(createDateTd);
								tr.append(deleteButtonTd);
								
								
								tbody.append(tr);
									});
				                    
					                    const pagination = document.getElementById('pagination3');
					                    pagination.innerHTML = '';
		
					                    if (data.maxPage > 1) {
					                        for (let i = 1; i <= data.maxPage; i++) {
					                        	const pageItem = document.createElement('li');
					                        	pageItem.classList.add('page-item');
					                            const pageLink = document.createElement('a');
					                            pageLink.classList.add('page-link');
					                            pageLink.href = '#';
					                            pageLink.innerText = i;
					                            pageLink.addEventListener('click', function(event) {
					                                event.preventDefault();
					                                loadPage2(i);
					                            });
		
					                            if (i === data.currentPage) {
					                                pageItem.classList.add('active');
					                            } else {
					                                pageItem.classList.remove('active');
					                            }
												pageItem.append(pageLink)		
					                            pagination.append(pageItem);
					                        }
					                    }
					                } else {
					                    console.error(data);
					                }
					            },
					            error: function(error) {
					                console.error(error);
					            }
					        });
					    }
		
					    loadPage2(currentPage); 
					});
			
			 document.getElementById('support1').addEventListener('click', function(){
				 document.getElementById('supportList').classList.toggle('hidden');
				 document.getElementById('userInfo').classList.add('hidden');
				 document.getElementById('userUpdate').classList.add('hidden');
				 document.getElementById('userDelete').classList.add('hidden');
				 document.getElementById('searchResult').classList.add('hidden');
				 document.getElementById('domesticBoardList').classList.add('hidden');
				 document.getElementById('globalBoardList').classList.add('hidden');
				 document.getElementById('volunteerList').classList.add('hidden');
				 document.getElementById('volunteerApproveList').classList.add('hidden');
				 document.getElementById('volunteerRafusalList').classList.add('hidden');
				 document.getElementById('infoList').classList.add('hidden');
					let currentPage = 1;
				    let page = 1;
				    const pageSize = 10;

				    function loadPage4(page) {
						currentPage = page
				        const url = '${contextPath}/adminPayList.ad?page='+ page +'&size=' + pageSize;

				        $.ajax({
				            url: url,
				            method: 'GET',
				            success: function(data) {

				                if (data && data.pay) {
				                    document.getElementById('supportList').classList.remove('hidden');
				                    const supportList = document.getElementById('supportList');
				                    const tbody = supportList.querySelector('tbody');
				                    tbody.innerHTML = '';

				                    data.pay.forEach(p => {
								const tr = document.createElement('tr');
								
								const pNoTd = document.createElement('td');
								pNoTd.innerText = p.payNo;
								const mNoTd = document.createElement('td');
								mNoTd.innerText = p.memberNo;
								const nameTd = document.createElement('td');
								nameTd.innerText = p.buyerName;
								const emailTd = document.createElement('td');
								emailTd.innerText = p.buyerEmail;
								const phoneTd = document.createElement('td');
								phoneTd.innerText = p.buyerTel;
								const productTd = document.createElement('td');
								productTd.innerText = p.product;
								const payDateTd = document.createElement('td');
								payDateTd.innerText = p.payDate;
								const amountTd = document.createElement('td');
								amountTd.innerText = p.amount+'원';
								
								
								tr.append(pNoTd);
								tr.append(mNoTd);
								tr.append(nameTd);
								tr.append(emailTd);
								tr.append(phoneTd);
								tr.append(productTd);
								tr.append(payDateTd);
								tr.append(amountTd);
								
								
								 tbody.append(tr);
				                    });

				                    const pagination = document.getElementById('pagination4');
				                    pagination.innerHTML = '';

				                    if (data.maxPage >=1) {
				                        for (let i = 1; i <= data.maxPage; i++) {
				                        	const pageItem = document.createElement('li');
				                        	pageItem.classList.add('page-item');
				                            const pageLink = document.createElement('a');
				                            pageLink.classList.add('page-link');
				                            pageLink.href = '#';
				                            pageLink.innerText = i;
				                            pageLink.addEventListener('click', function(event) {
				                                event.preventDefault();
				                                loadPage4(i);
				                            });

				                            if (i === currentPage) {
				                                pageItem.classList.add('active');
				                            } else {
				                                pageItem.classList.remove('active');
				                            }
											pageItem.append(pageLink)
				                            pagination.append(pageItem);
				                        }
				                    }
				                } else {
				                    console.error(data);
				                }
				            },
				            error: function(error) {
				                console.error(error);
				            }
				        });
				    }

				    loadPage4(currentPage); 
				});
			 
			 
			 
			 document.getElementById('board1').addEventListener('click', function(){
				 document.getElementById('userInfo').classList.add('hidden');
				 document.getElementById('userUpdate').classList.add('hidden');
				 document.getElementById('userDelete').classList.add('hidden');
				 document.getElementById('supportList').classList.add('hidden');
				 document.getElementById('searchResult').classList.add('hidden');
				 document.getElementById('globalBoardList').classList.add('hidden');	
				 document.getElementById('volunteerList').classList.add('hidden');
				 document.getElementById('volunteerApproveList').classList.add('hidden');
				 document.getElementById('volunteerRafusalList').classList.add('hidden');
				 document.getElementById('infoList').classList.add('hidden');
				 location.href="admindomestic.ad";
				 
			 })
			
			  document.getElementById('board2').addEventListener('click', function(){
				 document.getElementById('userInfo').classList.add('hidden');
				 document.getElementById('userUpdate').classList.add('hidden');
				 document.getElementById('userDelete').classList.add('hidden');
				 document.getElementById('supportList').classList.add('hidden');
				 document.getElementById('searchResult').classList.add('hidden');
				 document.getElementById('domesticBoardList').classList.add('hidden');
				 document.getElementById('volunteerList').classList.add('hidden');
				 document.getElementById('volunteerApproveList').classList.add('hidden');
				 document.getElementById('volunteerRafusalList').classList.add('hidden');
				 document.getElementById('infoList').classList.add('hidden');
				 location.href="adminglobal.ad";
				
			 })
			 
			  document.getElementById('board3').addEventListener('click', function(){
				 document.getElementById('userInfo').classList.add('hidden');
				 document.getElementById('userUpdate').classList.add('hidden');
				 document.getElementById('userDelete').classList.add('hidden');
				 document.getElementById('supportList').classList.add('hidden');
				 document.getElementById('searchResult').classList.add('hidden');
				 document.getElementById('domesticBoardList').classList.add('hidden');
				 document.getElementById('volunteerList').classList.add('hidden');
				 document.getElementById('volunteerApproveList').classList.add('hidden');
				 document.getElementById('volunteerRafusalList').classList.add('hidden');
				 document.getElementById('infoList').classList.add('hidden');
				 location.href="adminreview.ad"	
			 })
			 
			document.getElementById('volunteer1').addEventListener('click', function() {
		    document.getElementById('volunteerList').classList.toggle('hidden');
		    document.getElementById('userInfo').classList.add('hidden');
		    document.getElementById('userUpdate').classList.add('hidden');
		    document.getElementById('userDelete').classList.add('hidden');
		    document.getElementById('supportList').classList.add('hidden');
		    document.getElementById('searchResult').classList.add('hidden');
		    document.getElementById('domesticBoardList').classList.add('hidden');
		    document.getElementById('infoList').classList.add('hidden');
		    document.getElementById('volunteerApproveList').classList.add('hidden');
		    document.getElementById('volunteerRafusalList').classList.add('hidden');
		
		    let currentPage = 1;
		    const pageSize = 10;
		    
		    
		    function loadPage5(page) {
		        const url = '${contextPath}/adminVolunteerList.ad?page=' + page + '&size=' + pageSize;
		
		        $.ajax({
		            url: url,
		            method: 'GET',
		            success: function(data) {
		                if (data && data.volunteer) {
		                    document.getElementById('volunteerList').classList.remove('hidden');
		                    const volunteerList = document.getElementById('volunteerList');
		                    const tbody = volunteerList.querySelector('tbody');
		                    tbody.innerHTML = '';
		
		                    data.volunteer.forEach(v => {
		                        
		                        
		                        const tr = document.createElement('tr');
		
		                        const vNoTd = document.createElement('td');
		                        vNoTd.innerText = v.volunteerNo;
		                        const mNoTd = document.createElement('td');
		                        mNoTd.innerText = v.memberNo;
		                        const nameTd = document.createElement('td');
		                        nameTd.innerText = v.memberName;
		                        const boardTd = document.createElement('td');
		                        boardTd.innerText = v.title;
		                        const statusTd = document.createElement('td');
		                        statusTd.id = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;
		                        statusTd.innerText = statusText(v.status);
		
		                        const btnTd = document.createElement('td');
		                        const approveBtn = document.createElement('button');
		                        approveBtn.textContent = '승인';
		                        approveBtn.className = 'btn btn-success';
		                        approveBtn.name = 'volunteerStatusButton';
		                        approveBtn.id = 'approveBtn';
		                        approveBtn.addEventListener('click', function() {
		                        	$('#modalApprove').modal('show');
		                        	document.getElementById('modalApprove').dataset.volunteerNo = v.volunteerNo;
		                        	document.getElementById('modalApprove').dataset.memberNo = v.memberNo;
		                            document.getElementById('modalApprove').dataset.status = 'Y';
		                            document.getElementById('modalApprove').dataset.statusTdId = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;		                        	
		                        });
		                        
		
		                        const refusalBtn = document.createElement('button');
		                        refusalBtn.textContent = '거부';
		                        refusalBtn.className = 'btn btn-danger';
		                        refusalBtn.name = 'volunteerStatusButton';
		                        refusalBtn.id = `refusalBtn`
		                        refusalBtn.addEventListener('click', function() {
		                        	$('#modalRefusal').modal('show');
		                        	document.getElementById('modalRefusal').dataset.volunteerNo = v.volunteerNo;
		                        	document.getElementById('modalRefusal').dataset.memberNo = v.memberNo;
		                            document.getElementById('modalRefusal').dataset.status = 'N';
		                            document.getElementById('modalRefusal').dataset.statusTdId = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;
		                        });
		                        
		
		                        btnTd.appendChild(approveBtn);
		                        btnTd.appendChild(refusalBtn);
		
		                        const tds = [vNoTd,mNoTd, nameTd, boardTd, statusTd, btnTd];
		                        tr.append(...tds);
		                        tbody.append(tr);
		                    });
		
		                    const pagination = document.getElementById('pagination5');
		                    pagination.innerHTML = '';
		
		                    if (data.maxPage > 1) {
		                        for (let i = 1; i <= data.maxPage; i++) {
		                            const pageItem = document.createElement('li');
		                            pageItem.classList.add('page-item');
		                            const pageLink = document.createElement('a');
		                            pageLink.classList.add('page-link');
		                            pageLink.href = '#';
		                            pageLink.innerText = i;
		                            (function(pageNumber) {
		                                pageLink.addEventListener('click', function(event) {
		                                    event.preventDefault();
		                                    loadPage5(pageNumber);
		                                });
		                            })(i);
		
		                            if (i === page) {
		                                pageItem.classList.add('active');
		                            } else {
		                                pageItem.classList.remove('active');
		                            }
		                            pageItem.append(pageLink);
		                            pagination.append(pageItem);
		                        }
		                    }
		                } else {
		                    console.error(data);
		                }
		            },
		            error: function(error) {
		                console.error(error);
		            }
		        });
		    }
		
		    loadPage5(currentPage);
		});
			 
			 document.getElementById('volunteer2').addEventListener('click', function() {
				    document.getElementById('volunteerApproveList').classList.toggle('hidden');
				    document.getElementById('userInfo').classList.add('hidden');
				    document.getElementById('userUpdate').classList.add('hidden');
				    document.getElementById('userDelete').classList.add('hidden');
				    document.getElementById('supportList').classList.add('hidden');
				    document.getElementById('searchResult').classList.add('hidden');
				    document.getElementById('domesticBoardList').classList.add('hidden');
				    document.getElementById('infoList').classList.add('hidden');
				    document.getElementById('volunteerList').classList.add('hidden');
				    document.getElementById('volunteerRafusalList').classList.add('hidden');
				
				    let currentPage = 1;
				    const pageSize = 10;
				    
				    
				    function loadPage6(page) {
						currentPage = page;
				        const url = '${contextPath}/adminVolunteerApproveList.ad?page=' + page + '&size=' + pageSize;
				        $.ajax({
				            url: url,
				            method: 'GET',
				            success: function(data) {
				                if (data && data.volunteer) {
				                    document.getElementById('volunteerApproveList').classList.remove('hidden');
				                    const volunteerApproveList = document.getElementById('volunteerApproveList');
				                    const tbody = volunteerApproveList.querySelector('tbody');
				                    tbody.innerHTML = '';
				
				                    data.volunteer.forEach(v => {
				                        
				                        
				                        const tr = document.createElement('tr');
				
				                        const vNoTd = document.createElement('td');
				                        vNoTd.innerText = v.volunteerNo;
				                        const mNoTd = document.createElement('td');
				                        mNoTd.innerText = v.memberNo;
				                        const nameTd = document.createElement('td');
				                        nameTd.innerText = v.memberName;
				                        const boardTd = document.createElement('td');
				                        boardTd.innerText = v.title;
				                        const statusTd = document.createElement('td');
				                        statusTd.id = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;
				                        statusTd.innerText = statusText(v.status);
				
				                        const btnTd = document.createElement('td');
				                        const approveBtn = document.createElement('button');
				                        approveBtn.textContent = '승인';
				                        approveBtn.className = 'btn btn-success hidden';
				                        approveBtn.name = 'volunteerStatusButton';
				                        approveBtn.id = 'approveBtn';
				                        approveBtn.addEventListener('click', function() {
				                            //updateStatus(v.volunteerNo, 'Y', statusTd);
				                        	$('#modalApprove').modal('show');
				                        	document.getElementById('modalApprove').dataset.volunteerNo = v.volunteerNo;
				                        	document.getElementById('modalApprove').dataset.memberNo = v.memberNo;
				                            document.getElementById('modalApprove').dataset.status = 'Y';
				                            document.getElementById('modalApprove').dataset.statusTdId = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;		                        	
				                        });
				                        
				
				                        const refusalBtn = document.createElement('button');
				                        refusalBtn.textContent = '거부';
				                        refusalBtn.className = 'btn btn-danger';
				                        refusalBtn.name = 'volunteerStatusButton';
				                        refusalBtn.id = `refusalBtn`
				                        refusalBtn.addEventListener('click', function() {
				                        	$('#modalRefusal').modal('show');
				                        	document.getElementById('modalRefusal').dataset.volunteerNo = v.volunteerNo;
				                        	document.getElementById('modalRefusal').dataset.memberNo = v.memberNo;
				                            document.getElementById('modalRefusal').dataset.status = 'N';
				                            document.getElementById('modalRefusal').dataset.statusTdId = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;
				                        });
				                        
				
				                        btnTd.appendChild(approveBtn);
				                        btnTd.appendChild(refusalBtn);
				
				                        const tds = [vNoTd,mNoTd, nameTd, boardTd, statusTd, btnTd];
				                        tr.append(...tds);
				                        tbody.append(tr);
				                    });
				
				                    const pagination = document.getElementById('pagination6');
				                    pagination.innerHTML = '';
	
				                    if (data.maxPage > 1) {
				                        for (let i = 1; i <= data.maxPage; i++) {
				                        	const pageItem = document.createElement('li');
				                        	pageItem.classList.add('page-item');
				                            const pageLink = document.createElement('a');
				                            pageLink.classList.add('page-link');
				                            pageLink.href = '#';
				                            pageLink.innerText = i;
				                            pageLink.addEventListener('click', function(event) {
				                                event.preventDefault();
				                                loadPage6(i);
				                            });
	
				                            if (i === currentPage) {
				                                pageItem.classList.add('active');
				                            } else {
				                                pageItem.classList.remove('active');
				                            }
											pageItem.append(pageLink)		
				                            pagination.append(pageItem);
				                        }
				                    }
				                } else {
				                    console.error(data);
				                }
				            },
				            error: function(error) {
				                console.error(error);
				            }
				        });
				    }
	
				    loadPage6(currentPage); 
				});
		 
			 document.getElementById('volunteer3').addEventListener('click', function() {
				    document.getElementById('volunteerRafusalList').classList.toggle('hidden');
				    document.getElementById('userInfo').classList.add('hidden');
				    document.getElementById('userUpdate').classList.add('hidden');
				    document.getElementById('userDelete').classList.add('hidden');
				    document.getElementById('supportList').classList.add('hidden');
				    document.getElementById('searchResult').classList.add('hidden');
				    document.getElementById('domesticBoardList').classList.add('hidden');
				    document.getElementById('infoList').classList.add('hidden');
				    document.getElementById('volunteerList').classList.add('hidden');
				    document.getElementById('volunteerApproveList').classList.add('hidden');
				
				    let currentPage = 1;
				    const pageSize = 10;
				    
				    
				    function loadPage7(page) {
				        const url = '${contextPath}/adminVolunteerRafusalList.ad?page=' + page + '&size=' + pageSize;
				
				        $.ajax({
				            url: url,
				            method: 'GET',
				            success: function(data) {
				                if (data && data.volunteer) {
				                    document.getElementById('volunteerRafusalList').classList.remove('hidden');
				                    const volunteerRafusalList = document.getElementById('volunteerRafusalList');
				                    const tbody = volunteerRafusalList.querySelector('tbody');
				                    tbody.innerHTML = '';
				
				                    data.volunteer.forEach(v => {
				                        
				                        
				                        const tr = document.createElement('tr');
				
				                        const vNoTd = document.createElement('td');
				                        vNoTd.innerText = v.volunteerNo;
				                        const mNoTd = document.createElement('td');
				                        mNoTd.innerText = v.memberNo;
				                        const nameTd = document.createElement('td');
				                        nameTd.innerText = v.memberName;
				                        const boardTd = document.createElement('td');
				                        boardTd.innerText = v.title;
				                        const statusTd = document.createElement('td');
				                        statusTd.id = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;
				                        statusTd.innerText = statusText(v.status);
				
				                        const btnTd = document.createElement('td');
				                        const approveBtn = document.createElement('button');
				                        approveBtn.textContent = '승인';
				                        approveBtn.className = 'btn btn-success';
				                        approveBtn.name = 'volunteerStatusButton';
				                        approveBtn.id = 'approveBtn';
				                        approveBtn.addEventListener('click', function() {
				                        	$('#modalApprove').modal('show');
				                        	document.getElementById('modalApprove').dataset.volunteerNo = v.volunteerNo;
				                        	document.getElementById('modalApprove').dataset.memberNo = v.memberNo;
				                            document.getElementById('modalApprove').dataset.status = 'Y';
				                            document.getElementById('modalApprove').dataset.statusTdId = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;		                        	
				                        });
				                        
				
				                        const refusalBtn = document.createElement('button');
				                        refusalBtn.textContent = '거부';
				                        refusalBtn.className = 'btn btn-danger hidden';
				                        refusalBtn.name = 'volunteerStatusButton';
				                        refusalBtn.id = `refusalBtn`
				                        refusalBtn.addEventListener('click', function() {
				                        	$('#modalRefusal').modal('show');
				                        	document.getElementById('modalRefusal').dataset.volunteerNo = v.volunteerNo;
				                        	document.getElementById('modalRefusal').dataset.memberNo = v.memberNo;
				                            document.getElementById('modalRefusal').dataset.status = 'N';
				                            document.getElementById('modalRefusal').dataset.statusTdId = 'statusTd-' + v.volunteerNo + '-' + v.memberNo;
				                        });
				                        
				
				                        btnTd.appendChild(approveBtn);
				                        btnTd.appendChild(refusalBtn);
				
				                        const tds = [vNoTd,mNoTd, nameTd, boardTd, statusTd, btnTd];
				                        tr.append(...tds);
				                        tbody.append(tr);
				                    });
				
				                    const pagination = document.getElementById('pagination7');
				                    pagination.innerHTML = '';
	
				                    if (data.maxPage > 1) {
				                        for (let i = 1; i <= data.maxPage; i++) {
				                        	const pageItem = document.createElement('li');
				                        	pageItem.classList.add('page-item');
				                            const pageLink = document.createElement('a');
				                            pageLink.classList.add('page-link');
				                            pageLink.href = '#';
				                            pageLink.innerText = i;
				                            pageLink.addEventListener('click', function(event) {
				                                event.preventDefault();
				                                loadPage7(i);
				                            });
	
				                            if (i === data.currentPage) {
				                                pageItem.classList.add('active');
				                            } else {
				                                pageItem.classList.remove('active');
				                            }
											pageItem.append(pageLink)		
				                            pagination.append(pageItem);
				                        }
				                    }
				                } else {
				                    console.error(data);
				                }
				            },
				            error: function(error) {
				                console.error(error);
				            }
				        });
				    }
	
				    loadPage7(currentPage); 
				});
		 
			 
		 function updateStatus(volunteerNo, memberNo, status, statusTd) {
			 console.log(statusTd);
		        $.ajax({
		            url: '${contextPath}/updateVolunteerStatus.ad',
		            method: 'POST',
		            data: {
		                volunteerNo: volunteerNo,
		                memberNo: memberNo,
		                status: status
		            },
		            success: function(response) {
		                	statusTd.innerText = statusText(response.status);
		                	$('#modalApprove').modal('hide');
		                    $('#modalRefusal').modal('hide');
		            },
		            error: function(error) {
		                console.error('상태 업데이트 오류:', error);
		            }
		        });
		    }

			 
		
		function deleteMember(memberNo){
			if (confirm("정말 탈퇴하시겠습니까?")) {
                alert("탈퇴되었습니다.");
            }
				$.ajax({
					url: '${contextPath}/adminDelete.ad',
					data: {mNo:memberNo},
					success: data =>{
						console.log(data)
					},
					error: data => console.log(data)
					
				})
			
		}
		
		function updateMember(memberNo, memberName, nickName, email, address, phone){
			$.ajax({
	        	url: '${contextPath}/adminUpdate.ad',
	        	type: 'POST',
	        	data: {
	        		memberNo:memberNo,
	                memberName:memberName,
	                nickName:nickName,
	                email:email,
	                address:address,
	                phone:phone
		            },
	        		success: data =>{
	        			console.log(data)
	        			if (data === "success") {
	                        alert("회원 정보가 성공적으로 업데이트되었습니다.");
	                    } else {
	                        alert("회원 정보 업데이트에 실패했습니다.");
	                    }
	        		},
	        		error: data => console.log(data)
	        })
	        
		}
		
		function toggleStatus(status, memberNo, statusButton) {
			const updateStatus = status === 'Y' ? 'N' : 'Y'; 
			$.ajax({
				url:'${contextPath}/updateStatus.ad',
				data: {status:status, memberNo:memberNo},
				success: data => {
					if (status == 'Y') {
		                alert('회원번호 ' + memberNo + '님의 활동 권한을 해제합니다.');
		            } else {
		                alert('회원번호 ' + memberNo + '님의 활동 권한을 부여합니다.');
		            }		
		            statusButton.innerText = updateStatus;
				},
				error: data => console.log(data)
			})
            
		}
		
		function toggleAdmin(isAdmin, memberNo, adminButton) {
			const updateAdmin = isAdmin == 'Y' ? 'N' : 'Y';
			$.ajax({
				url:'${contextPath}/updateAdmin.ad',
				data: {isAdmin:isAdmin, memberNo:memberNo},
				success: data => {
					if (isAdmin == 'Y') {
		                alert('회원번호 ' + memberNo + '님의 관리자 권한을 해제합니다.');
		            } else {
		                alert('회원번호 ' + memberNo + '님의 관리자 권한을 부여합니다.');
		            }
					adminButton.innerText = updateAdmin;
				},
				error: data => console.log(data)
			})
		}
		
		function selectMembers(){
			 document.getElementById('userInfo').classList.add('hidden');
			 document.getElementById('userUpdate').classList.add('hidden');
			 document.getElementById('userDelete').classList.add('hidden');
			 document.getElementById('supportList').classList.add('hidden');
			 document.getElementById('volunteerList').classList.add('hidden');
			 document.getElementById('volunteerApproveList').classList.add('hidden');
			 document.getElementById('volunteerRafusalList').classList.add('hidden');
			 document.getElementById('infoList').classList.add('hidden');
		}
		document.getElementById('searchText').addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
                event.preventDefault(); 
                document.getElementById('searchBtn').click();
            }
        });
		
		function searchMember() {
	        var searchType = document.getElementById('searchType').value;
	        var searchText = document.getElementById('searchText').value;
	        $.ajax({
				url: '${contextPath}/searchMember.ad',
				data: {
					   type:searchType,
					   text:searchText	
						},
				success: data =>{
					selectMembers()
					document.getElementById('searchResult').classList.remove('hidden');
					const searchResult = document.getElementById('searchResult');
					const tbody = searchResult.querySelector('tbody');
					tbody.innerHTML = '';
					
					for(const s of data){
						const tr = document.createElement('tr');
						
						const noTd = document.createElement('td');
						noTd.innerText = s.memberNo;
						const nameTd = document.createElement('td');
						nameTd.innerText = s.memberName;
						const nickTd = document.createElement('td');
						nickTd.innerText = s.nickName;
						const emailTd = document.createElement('td');
						emailTd.innerText = s.email;
						const phoneTd = document.createElement('td');
						phoneTd.innerText = s.phone;
						const addressTd = document.createElement('td');
						addressTd.innerText = s.address;
						const ageTd = document.createElement('td');
						ageTd.innerText = s.age;
						const createDateTd = document.createElement('td');
						createDateTd.innerText = s.createDate;
						
						tr.append(noTd);
						tr.append(nameTd);
						tr.append(nickTd);
						tr.append(emailTd);
						tr.append(phoneTd);
						tr.append(addressTd);
						tr.append(ageTd);
						tr.append(createDateTd);
						
						const tds = [noTd, nameTd, nickTd, emailTd, phoneTd, addressTd, ageTd, createDateTd];
		                tds.forEach(td => {
		                    td.addEventListener('click', () => {
		                        window.location.href = '${contextPath}/adminSelectMember.ad?memberNo=' + s.memberNo ;
		                    });
		                });
						
						tbody.append(tr);
					}
				},
				error: data => console.log(data)
				
			});
		       
	        
	        window.onload = () => {
	        	statistics();
	        	
				
			}
		}
	</script>
</body>
</html>
