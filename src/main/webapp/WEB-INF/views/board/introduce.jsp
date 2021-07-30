<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <style>
        body{
            margin: 0;
            padding: 0;
        }
        .wrapper{
            margin: 0px;
            padding: 0px;
            width: 100%;
        }
        .header{
            width: 100%;
            height: 150px;
        }
        .title{
            margin: 0;
            height: 80px;
            
        }
        h1{
           font-size: 2rem;
           text-align: center;
           margin-top: 30px;
		}
        .menu{
            border-bottom: 3px solid black;
            width: 100%;
            height: 50px;
           margin-left: 50px;
            width: 90%;
            display: flex;
        	justify-content: center;
            
        }
        .menu ul{
            text-align: center;
            float: left;
        }
        .menu ul li{
            display: inline-block;
            text-align: center;
            margin-right: 30px;
            list-style: none;
            
        }
        .introduceNav{
        	display: flex;
        	justify-content: center;
            width: 100%;
            height: 300px;
            margin-bottom: 100px;
            
        }
        .img{
            display: inline-block;
            float: left;
            margin-left: 200px;
            
        }
        .img img{
            width: 350px;
            height: auto;
            padding: 30px 0;

        }
        .introduce{
            display: inline-block;
            float: left;
            width: 550px;
           
          
        }
        a{
            text-decoration: none;
            color: black;
        }
        .first{
        	text-align: center;
            font-size: 1.5rem;
            display: block;
            margin-top: 70px;
        }
        .main{
            display: block;
            margin: 40px;
        }
    </style>
</head>
<body>
    <div class="wrapper"> <!--wrapper-->
        <div class="header"><!--header-->
            <div class="title">
                <h1>Green</h1>
            </div>

            <div class="menu">
                <ul>
                    <li><a href="${cpath }">홈</li></a>
                    <li><a href="">새소식</li></a>
                    <li><a href="${cpath }/board/write">글쓰기</li></a>
                    <li><a href="">공지사항</li></a>
                    <li><a href="${cpath }/board/oneWord">한마디</li></a>
                </ul>
            </div>
        </div><!--header끝-->
		<div class="first">지구의 건강은 우리 모두가 지켜주자</div>
        <div class="introduceNav"> <!--nav시작-->
            <div class="img"><img src="${cpath }/resources/image/greenTree.jpg"></div><!--이미지 사진-->
            <div class="introduce">
                <div class="main">
                <p>오늘날 많은 쓰레기들과 함께 살아가고 있습니다</p>
                <p>세상이 빠르게 성장하면서 쓰레기도 증가했습니다 </p>
                <p>여러분은 우리가 살고있는 지구의 유효기간이 언제라고 생각하나요</p>
                <p>우리는 건강이 나빠지면 병원에 가거나 충분히 휴식기를 가져요 </p>
                <p>하지만 지구의 건강은 나빠지면 병원에 갈수도없어요</p>
                <p>지금도 많이 늦었어요</p>
                <p>지금부터라도 우리모두가 지구를 지켜줘야해요</p>
                </div>

            </div>
        </div><!--nav끝-->

    </div>
</body>
</html>
<%@ include file="../footer.jsp" %>