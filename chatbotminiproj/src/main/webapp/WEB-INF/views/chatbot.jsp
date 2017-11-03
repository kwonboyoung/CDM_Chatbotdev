<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/bubbles.css" />">
<script src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<title>Insert title here</title>
<link rel="shortcut icon" href="/favicon.ico" />

<script type="text/javascript">
$(document).ready(function(){
	ajax_process("");
	
	$('#txt_isay').keypress(function(e){
		if (e.which === 13){
			conversation();
		}
	});
	
	$('#btn_isay').click(function(){
		conversation();
	});
});

function conversation() {
	var _isay = $.trim($('#txt_isay').val());

	var isay = '<p class="triangle-border right">' + _isay + '</p>';
	$('#said').append(isay);
	$('#txt_isay').val('');
	ajax_process(_isay);
}

function ajax_process(_isay){
	$.ajax({
		type : 'POST',
		url  : 'watsonsay',
		data : 'isay=' + encodeURIComponent(_isay),
		async: false,
		success : function(data) {
			console.log(data);
			var watsonsay =
				'<p class="triangle-border left">' + data.output.text;
				
			/* for(var i in data.context.image){ */	
			
				if(data.context.image !==''){
					  watsonsay += '<br/><img src="resources/img/'+data.context.image+'.jpg" width="700" height="500"/>';
				}
			
		 	/* } */
		 	
				if(data.context.image1 !==''){
					  watsonsay += '<img src="resources/img/'+data.context.image1+'.jpg" width="700"/>';
				}
				
			/* if (_isay =='') {
				watsonsay += '<br/><img src="<c:url value="/resources/img/w cafe.png" />" width="300" />';
			} */	
			/* // 까페모카
			if(_isay === '초코'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/hotcafemoca.jpg" />" width="300" />';
			}
			// 카라멜 마끼야또
			if(_isay === '카라멜'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/hotcaramel.jpg" />" width="300" />';
			}
			//바닐라라떼
			if(_isay === '바닐라'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/hotvanila.jpg" />" width="300" />';
			}
			//헤이즐넛라떼
			if(_isay === '헤이즐넛'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/hothazelnut.jpg" />" width="300" />';
			}
			//아포가토
			if(_isay === '아이스크림'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/afocato.jpg" />" width="300" />';
			}
			//아메리카노
			if(_isay === '깔끔한 맛'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/hotamericano.jpg" />" width="300" />';
			}
			//라떼 & 카푸치노
			if(_isay === '부드러운 맛'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/hotlatte.jpg" />" width="300" />'+
			'<img src="<c:url value="/resources/img/hotcafuccino.jpg" />" width="300" />';
			}
			//밀크커피
			if(_isay == '믹스커피맛'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/hotmilkcoffee.jpg" />" width="300" />';
			}
			//샷그린티라떼
			if(_isay == '그린티맛'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/shotgreentea.jpg" />" width="300" />';
			}
			//에스프레소
			if(_isay === '진한 맛'){
				watsonsay += '<br/><img src="<c:url value="/resources/img/espresso.jpg" />" width="300" />';
			}
		 */
			watsonsay += '</p>';
			$('#said').append(watsonsay);	
			$('html, body').animate({scrollTop: $(document).height()}, 500);
		}
	});
}
</script>


</head>
<body>

<div id="said"></div>
<input type="text" id="txt_isay" class="triangle-border center" />
<button type="button" id="btn_isay" autofocus="autofocus" class="btn btn-default">전송</button>
</body>
</html>