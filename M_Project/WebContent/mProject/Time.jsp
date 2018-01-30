<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>타임테스트페이지</title>

</head>
<body>
<canvas id="canvas" width="220" height="220" >cccc</canvas>
<script type="text/javascript">
var canvas = document.getElementById("canvas");
		var ctx = canvas.getContext("2d");
		// 채우기 색
		ctx.strokeStyle = '#8f5b38';
		ctx.lineWidth = 13;
		ctx.shadowBlur= 15;
		// 겉 테두리 색
		ctx.shadowColor = '#8f5b38';

		function degToRad(degree){
			var factor = Math.PI/180;
			return degree*factor;
		}

		function renderTime(){
			var now = new Date();
			var today = now.toDateString();
			var time = now.toLocaleTimeString();
			var hrs = now.getHours();
			var min = now.getMinutes();
			var sec = now.getSeconds();
			var mil = now.getMilliseconds();
			var smoothsec = sec+(mil/1000);
      		var smoothmin = min+(smoothsec/60);

			//Background
			// 배경에 잔상의 위치
			gradient = ctx.createRadialGradient(110, 110, 5, 110, 110, 150);
			gradient.addColorStop(0, "#f6f6f6");
			//gradient.addColorStop(1, "white");
			ctx.fillStyle = gradient;
			//ctx.fillStyle = 'rgba(00 ,00 , 00, 1)';
			ctx.fillRect(0, 0, 500, 500);
			//Hours
			ctx.beginPath();
			ctx.arc(110,110,100, degToRad(270), degToRad((hrs*30)-90));
			ctx.stroke();
			//Minutes
			ctx.beginPath();
			ctx.arc(110,110,80, degToRad(270), degToRad((smoothmin*6)-90));
			ctx.stroke();
			//Seconds
			ctx.beginPath();
			ctx.arc(110,110,60, degToRad(270), degToRad((smoothsec*6)-90));
			ctx.stroke();
			//Date
			ctx.font = "11px Helvetica";
			ctx.fillStyle = 'rgba(90, 90, 90, 1)'
			ctx.fillText(today, 69, 90);
			//Time
			ctx.font = "11px Helvetica Bold";
			ctx.fillStyle = 'rgba(90, 90, 90, 1)';
			ctx.fillText(time+":"+mil, 69, 105);

		}
		setInterval(renderTime, 40);
</script>