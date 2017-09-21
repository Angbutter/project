<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="com.util.HangulConversion" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>MUZI</title>
		<script type="text/javascript">
			$(document).ready(function(){

			});
			function logout(){
				location.href="./loginForm.jsp";
			}
			function scheduleCare(){
				location.href="./index.jsp?gugu=cal";
			}
		</script>
	</head>
	<body>

		<!-- Wrapper -->

			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">MUZI</a></h2>
										<p>오늘 같은밤 이대로 머물러도 될 꿈이라면</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-11-01"><%=today %></time>
										<a href="#" class="author"><span class="name">Jane Doe</span><img src="../images/avatar.jpg" alt="" /></a>
									</div>
								</header>
								<a href="#" class="image featured"><img src="../images/bgbg.png" alt="" /></a>
								<p>저희 MUZI는 사람과 사람,   오늘과 내일,   네트워크와 네트워크가 연결되는 더 큰 
세상을 만들어왔습니다. 이제 국내뿐 아니라 전 세계 이용자들에게 새로운 경험과 가치를 전하는 새로운 기술을 통해 한 단계 진화된 연결을 만들어가고자 합니다.

수많은 개인과 소상공인, 창작자들이 MUZI와 함께 새로운 기회와 지속 가능한 성장을 함께 만들고 있습니다. 이미 많은 사람들이 MUZI의 다양한 플랫폼과 서비스를 통해 손쉽게 창업하고 사업의 경쟁력을 높이며 성과를 보이고 있으며, 창작자들도 MUZI 플랫폼을 통해 자신만의 콘텐츠를 국내외 이용자들과 공유하며 수익을 창출하고 창작활동의 영역을 넓혀가고 있습니다.</p>
								<footer>
									<ul class="actions">
										<li><a href="#" class="button big">Continue Reading</a></li>
									</ul>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon fa-heart">28</a></li>
										<li><a href="#" class="icon fa-comment">128</a></li>
									</ul>
								</footer>
							</article>
						<!-- Pagination -->
							<ul class="actions pagination">
								<li><a href="" class="disabled button big previous">Previous Page</a></li>
								<li><a href="#" class="button big next">Next Page</a></li>
							</ul>

					</div>
				</body>
				</html>
				</script>
				<!-- Sidebar -->
					<section id="sidebar">
						<!-- Intro -->
							<section id="intro">
								<a href="#" class="image"><img src="../images/qqqq.png" alt="" /></a>
								<header>
									<h2>MUZI</h2>
									<p>Another fine responsive site template in HTML5</a></p>

<style rel="stylesheet">
body {background-color: white;}
</style>

<canvas id="canvas" width="220" height="220" >cccc</canvas>
<script type="text/javascript">
var canvas = document.getElementById("canvas");
		var ctx = canvas.getContext("2d");
		// 속 색
		ctx.strokeStyle = '#48FFFF';
		ctx.lineWidth = 13;
		ctx.shadowBlur= 15;
		// 겉 색
		ctx.shadowColor = '#48FFFF';
		

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
			gradient.addColorStop(0, "white");
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
			ctx.font = "10px Helvetica";
			ctx.fillStyle = 'rgba(90, 90, 90, 1)'
			ctx.fillText(today, 73, 90);
			//Time
			ctx.font = "10px Helvetica Bold";
			ctx.fillStyle = 'rgba(90, 90, 90, 1)';
			ctx.fillText(time+":"+mil, 73, 105);

		}
		setInterval(renderTime, 40);
</script>

								</header>
							</section>

						<!-- Mini Posts -->
							<section>
								<div class="mini-posts">

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="#">Vitae sed condimentum</a></h3>
												<time class="published" datetime="2015-10-20">October 20, 2015</time>
												<a href="#" class="author"><img src="../images/avatar.jpg" alt="" /></a>
											</header>
											<a href="#" class="image"><img src="../images/bgbg2.png" alt="" /></a>
										</article>
								</div>
							</section>

						<!-- Posts List -->
							<section>
								<ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="#">Lorem ipsum fermentum ut nisl vitae</a></h3>
												<time class="published" datetime="2015-10-20">October 20, 2015</time>
											</header>
											<a href="#" class="image"><img src="../images/pic08.jpg" alt="" /></a>
										</article>
									</li>
								</ul>
							</section>

						<!-- About -->
							<section class="blurb">
								<h2>About</h2>
								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at phasellus sed ultricies.</p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</section>

						<!-- Footer -->
							<section id="footer">
								<ul class="icons">
									<li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
									<li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
								</ul>
								<p class="copyright">&copy; Untitled. Crafted: <a href="http://designscrazed.org/">HTML5</a>.</p>
							</section>

					</section>
			</div>
	</body>
</html>