<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>

<h1>태풍</h1>
<hr>
<div id="chart_div" style="width: 900px; height: 500px"></div>
<div class="temp"></div>
<script>
	let result;
	let temp = document.querySelector('.temp')
	function ajax() {
		const url = '${cpath}/board/typhoon/json'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => {
			json.forEach(element => {
				for(var key in element){
					const div = document.createElement('div')
					div.className = 'sum'
					div.innerText = element[key]
					temp.appendChild(div)
				}
				
			})
			result = temp.childNodes
		})
		.then(e => googlechart())
	}
	window.onload = () => {
		ajax()
// 		googlechart()
	}
</script>

<!-- 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	function googlechart() {
		
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawVisualization);
	    
	    function drawVisualization() {
	    	
	    	const dat = temp.childNodes
			let sample = [
				['년도', '태풍발생횟수', '한반도 영향도']
	        ]

	         for(let i = 1 ; i <dat.length; i++){
	        	 const year = i + 2000
	        	 let tot = dat[i].innerText.split('(')[0] * 1
	        	 let j = dat[i].innerText.split('(')[1].replace(')','') * 1
	        	 const arr = [year + "" , tot, j]        	 
	        	 sample.push(arr)
	         }
	         
			var data = google.visualization.arrayToDataTable(sample);	// draw
	        var options = {
	          title : '연간 태풍 횟수(자료 출처 : 기상청 국가기후센터데이터)',
	          vAxis: {title: '횟수'},
	          hAxis: {title: '년도'},
	          seriesType: 'bars',
	          series: {0: {type: 'line'},1: {type: 'line'}}
	        };
	        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }
	}
</script>

</body>
</html>