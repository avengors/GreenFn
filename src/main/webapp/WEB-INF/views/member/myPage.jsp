<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

 
 <div class="overlay hidden"></div>
    
    <div class="mypageRoot">
	    <div class="myPageForm">
	        <form method="POST">
	            <h2 class="mypageTitle">정보수정</h2>
	            <div class="mypageInfo">
	                <div class="idDiv">
	                    <p>ID : ${login.email }</p>
	                </div>
	                
	                <div class="passwordDiv">
	                    <div class="modifyInputDiv hidden">
	                        <input type="password" name="userpw" placeholder="비밀번호" oninput="fn_pw_check()">
	                    	<input type="password" name="userpw2" placeholder="비밀번호 확인" oninput="checkPw()">
	                    	<div id="pwMsg"></div>
	                    </div>
	                </div>
	                
	                <div class="myPageNameDiv">
	                    <p>이름 : ${login.name}</p>
	                    <div class="modifyInputDiv hidden">
	                        <input type="text" name="name" placeholder="이름" value="${login.name }">
	                    </div>
	                </div>
	
	                <div class="myPageDate">
	                    <p>생년월일 : ${login.birth}</p>
	                    <div class="modifyInputDiv hidden">
	                        <input type="date" name="birth" value="${login.birth}">
	                    </div>
	                </div>
	                
	                <div class="genderDiv">
	                    <p>성별 : ${login.gender}</p>
	                    <div class="modifyInputDiv hidden">
	                        <label><input type="radio" name="gender" value="male" ${login.gender == 'male' ? 'checked' : '' }>남성</label>
	                        <label><input type="radio" name="gender" value="female" ${login.gender == 'female' ? 'checked' : '' }>여성</label>
	                    </div>
	                </div>
	
	                <div class="addressDIv">
	                    <p>주소 : ${login.address}</p>
	                    <div class="modifyInputDiv hidden">
	                        <input type="text" name="address" placeholder="주소" value="${login.address }">
	                    </div>
	                </div>
	                <div class="mypageBtns">
		                <button class="modifyBtn">수정</button>
		                <input class="submitBtn hidden" type="submit" value="수정완료">
		                <button class="cancelBtn hidden">취소</button>
		                <button class="deleteBtn hidden">회원탈퇴</button>
	                </div>
	                <input type="hidden" name="idx" value="${login.idx }">
	            </div>
	        </form>
	    </div>
    </div>
    <script>
    // 정보수정란 열기
    const modifyInputDiv = document.querySelectorAll('.modifyInputDiv')
    const modifyBtn = document.querySelector('.modifyBtn')
    const submitBtn = document.querySelector('.submitBtn')
    const cancelBtn = document.querySelector('.cancelBtn')
    const deleteBtn = document.querySelector('.deleteBtn')
    
    modifyBtn.onclick = (event) => {
        event.preventDefault()
        modifyInputDiv.forEach(e => {
            if(e.classList.contains('hidden')){
                e.classList.remove('hidden')
                modifyBtn.classList.add('hidden')
                submitBtn.classList.remove('hidden')
                cancelBtn.classList.remove('hidden')
                deleteBtn.classList.remove('hidden')
            }            
        }) 
    }
    
    // 취소버튼
    cancelBtn.onclick = (event) => {
    	event.preventDefault()
    	modifyInputDiv.forEach(e => {
    		e.classList.add('hidden')
    		modifyBtn.classList.remove('hidden')
            submitBtn.classList.add('hidden')
            cancelBtn.classList.add('hidden')
            deleteBtn.classList.add('hidden')
    	})
    }
    
    // 회원탈퇴
    deleteBtn.onclick = (event) => {
    	event.preventDefault()
    	confirm('정말 탈퇴하시겠습니까?')
    	if(confirm){
    		const url = '${cpath}/member/myPage'
    		const opt = {
    			method: 'delete'	
    		}
    		fetch(url, opt).then(resp => resp.text())
    		.then(text => {
    			if(text == 1){
    				alert('이용해 주셔서 감사합니다.')
    				sessionStorage.clear();
    				location.replace('${cpath}')
    			}else{
    				alert('비정상적인 접근입니다.')
    			}
    		})
    	}
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
  	
    // 수정완료
   	const myPageForm = document.forms[0]
    myPageForm.onsubmit = function(event){
   		event.preventDefault()
   		if(pwFlag != 0) {
			alert('비밀번호가 일치하지 않습니다')
			pw1.value = ''	
			pw2.value = ''
			pw1.focus()
			return;
		}
   		const ob = {}
		const formData = new FormData(event.target)
		
		for(key of formData.keys()){
			ob[key] = formData.get(key)
		}
   		console.log(ob)
   		const url = '${cpath}/member/myPage'
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
			console.log(text)
			if(text == 1) {
				alert('수정 성공')
				location.replace('${cpath}')
			}else {
				alert('비정상적인 접근입니다.')
			}
		})
   		
   		
    }
    	
    </script>


</body>
</html>