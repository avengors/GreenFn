<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

</head>
<body class="joinBody">
    
	<div class="overlay hidden"></div>
    <div class="authForm hidden">
    	<input type="text" name="userNumber" placeholder="인증번호를 입력하세요">
    	<button id="authFormBtn">확인</button>
    </div>
    
    <div class="joinForm">
        <form method="POST">
            <h2>회원가입</h2>
            <div class="join">


                <div class="checkId">
                    <p>
                        <input type="email" name="email" placeholder="아이디" required oninput="checkId()">
                        <button id="checkEmail">인증</button>
                    </p>
                    <div id="idMsg"></div>
                </div>


                <div class="checkPw">
                    <input type="password" name="userpw" placeholder="비밀번호" required oninput="fn_pw_check()">
                    <input type="password" name="userpw2" placeholder="비밀번호 확인" required oninput="checkPw()">
                    <div id="pwMsg"></div>
                </div>
                
				<input type="text" name="name" placeholder="이름" required>
                <input type="date" name="birth" required>
                
                <div class="gender">
                    <label><input type="radio" name="gender" value="male">남성</label>
                    <label><input type="radio" name="gender" value="female">여성</label>
                </div>
                
                <input type="text" name="address" placeholder="주소" required>
            </div>
            
            <div class="">
                <input type="submit" value="회원가입" id="joinFormBtn">
            </div>
        </form>
    </div>
	
	<script>
		//ID 중복확인
		const email = document.querySelector('input[name="email"]')
		const idMsg = document.getElementById('idMsg')
		let idFlag = 1;
		function checkId() {
			idMsg.innerText = ''
			if(email.value == '') {
				idMsg.innerText = ''
				return;
			}
			const url = '${cpath}/member/checkId/' + email.value + '/'
			const opt = {
				method: 'GET'
			}
			fetch(url, opt)
			.then(function(resp) {return resp.text()})
			.then(function(text) {
				console.log('${cpath}')
				if(text == 0) {
					idMsg.innerText = '사용 가능한 E-mail'
					idMsg.style.color = 'blue'
					idFlag = 0;
				}else {
					idMsg.innerText = '사용할수 없는 E-mail'
					idMsg.style.color = 'red'
					let idFlag = 1;
				}
			}) 
		}
		
		//이메일 인증
		const checkEmailBtn = document.getElementById('checkEmail')
		let emailFlag = 1
		
		function sendMailHandler(event) {
			idMsg.innerText = ''
			const sendEmail = document.querySelector('input[name="email"]')
			const url = '${cpath}/mailto/' + sendEmail.value + '/'
			const opt = {
				method: 'GET'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text.length == 128) {	
					idMsg.innerText = '인증번호를 전송했습니다'
					idMsg.style.color = 'blue'
					document.querySelector('.overlay').classList.remove('hidden')
					document.querySelector('.authForm').classList.remove('hidden')
				}
				else {						
					idMsg.innerText = text
					idMsg.style.color = 'red'
				}
			})
		}
		checkEmailBtn.onclick = (event) =>{
			event.preventDefault()
			if(idFlag == 0) {
				sendMailHandler()
			}else{
				alert('사용이 불가능한 이메일 입니다.')
			}
		}
		const authFormBtn = document.getElementById('authFormBtn')
		function emailFlagHandler() {
			let userNumber = document.querySelector('input[name="userNumber"]')
			const url = '${cpath}/getAuthResult/' + userNumber.value
			const opt = {
				method: 'GET'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				userNumber.innerHTML = ''
				document.querySelector('.overlay').classList.add('hidden')
				document.querySelector('.authForm').classList.add('hidden')
				if(text == 'true') {
					alert('인증 성공!')
					idMsg.innerText = '인증 성공'
					idMsg.style.color = 'green'
					emailFlag = 0
				}else {
					alert('인증 실패!')
					idMsg.innerText = '인증 실패'
					idMsg.style.color = 'red'
					emailFlag = 1
				}
			})
		}
		authFormBtn.onclick = (event) => {
			event.preventDefault()
			console.log('onclick!!')
			emailFlagHandler()
		}
		
		
		
		//비밀번호 확인
		const pw1 = document.querySelector('input[name="userpw"]')
		const pw2 = document.querySelector('input[name="userpw2"]')
		
		const pwMsg = document.getElementById('pwMsg')
		let pwFlag = 1
		function checkPw() {
			if(pw1.value == pw2.value) {
				pwMsg.innerText = '일치'
				pwMsg.style.color = 'blue'
				pwFlag = 0
			}else {
				pwMsg.innerText = '일치 하지 않습니다'
				pwMsg.style.color = 'red'
				pwFlag = 1
			}
		}
		
		//비밀번호 확인 테스트
    	function fn_pw_check() {
        	var pattern1 = /[0-9]/;
        	var pattern2 = /[a-zA-Z]/;
        	var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
        	var pw_passed = true;
        	if(pw1.value.length == 0) {
        		pwMsg.innerText = '비밀번호를 입력해주세요'
				pwMsg.style.color = 'red'
        	}
        	if(!pattern1.test(pw1.value) || !pattern2.test(pw1.value)|| !pattern3.test(pw1.value) || pw1.value.length<8 || pw1.value.length>50){
        		pwMsg.innerText = '영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.'
    			pwMsg.style.color = 'red'
        	}else{
        		pwMsg.innerText = '적합한 비밀번호입니다'
        		pwMsg.style.color = 'blue'
        	}
        	var SamePass_0 = 0; //동일문자 카운트
            var SamePass_1 = 0; //연속성(+) 카운드
            var SamePass_2 = 0; //연속성(-) 카운드 
            for (var i = 0; i < pw1.value.length; i++) {
                var chr_pass_0;
                var chr_pass_1;
                var chr_pass_2;
                if (i >= 2) {
                    chr_pass_0 = pw1.value.charCodeAt(i - 2);
                    chr_pass_1 = pw1.value.charCodeAt(i - 1);
                    chr_pass_2 = pw1.value.charCodeAt(i);
                    //동일문자 카운트
                    if ((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {
                        SamePass_0++;
                    }else {
                        SamePass_0 = 0;
                    }
                    //연속성(+) 카운드
                    if (chr_pass_0 - chr_pass_1 == 1 && chr_pass_1 - chr_pass_2 == 1) {
                        SamePass_1++;
                    }else {
                        SamePass_1 = 0;
                    }
                    //연속성(-) 카운드
                    if (chr_pass_0 - chr_pass_1 == -1 && chr_pass_1 - chr_pass_2 == -1) {
                        SamePass_2++;
                    }else {
                        SamePass_2 = 0;
                    }
                }
                if (SamePass_0 > 0) {
                	pwMsg.innerText = '동일문자를 3자 이상 연속 입력할 수 없습니다.'
            		pwMsg.style.color = 'red'
                }
                if (SamePass_1 > 0 || SamePass_2 > 0) {
                    pwMsg.innerText = '영문, 숫자는 3자 이상 연속 입력할 수 없습니다.'
                	pwMsg.style.color = 'red'
                }
                if (!pw_passed) {
                    break;
                }
            }
            
         }

		//회원 가입
		
		const joinForm = document.forms[0]
		joinForm.onsubmit = function(event) {
			event.preventDefault()
			if(pwFlag != 0) {
				alert('비밀번호가 일치하지 않습니다')
				pw1.value = ''	
				pw2.value = ''
				pw1.focus()
				return;
			}
			if(emailFlag != 0) {
				alert('이메일 인증이 필요합니다')
				return;
			}
			const ob = {}
			const formData = new FormData(event.target)
			
			for(key of formData.keys()){
				ob[key] = formData.get(key)
			}
			const url = '${cpath}/member/join'
			const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type': 'application/json; charset=utf-8',
				}
			}
			fetch(url, opt)
			.then(function(resp) { return resp.text() })
			.then(function(text) {
				if(text == 1) {
					alert('가입 성공')
					location.replace('${cpath}')
				}else {
					alert('가입 실패')
				}
			})
			
		}
		
		
		
	</script>
    

</body>
</html>





























