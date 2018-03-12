<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="keywords" content="scclui框架">
		<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
		<title>首页</title>

		<link rel="stylesheet" href="${staticWebsite}resources/layui/css/layui.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/sccl.css">

	</head>

	<body class="login-bg">
		<div id="login-box">
			<div class="login-box">
				<header>
					<h1>信息科学与技术学院奖项查询系统</h1>
				</header>
				<div class="login-main">
					<form action="${website}login/checkLogin" class="layui-form" method="post">
						<input name="__RequestVerificationToken" type="hidden" value="">
						<div class="layui-form-item">
							<input type="text" name="username" lay-verify="userName" autocomplete="off" placeholder="请输入用户名" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="请输入密码" class="layui-input">
						</div>
						<div class="layui-form-item">
							<button class="submit layui-btn layui-btn-primary" lay-submit="" lay-filter="login"> 登录</button>
						</div>
					</form>
				</div>
				<footer>
					<p>东北师范大学@信息科学与技术学院</p>
				</footer>
			</div>
		</div>
		<script type="text/html" id="code-temp">
			<div class="login-code-box">
				<input type="text" class="layui-input" id="code" />
				<img id="valiCode" src="/manage/validatecode?v=636150612041789540" alt="验证码" />
			</div>
		</script>
		<script src="${staticWebsite}resources/layui/layui.js"></script>
		<script src="${staticWebsite}resources/js/background.js"></script>
		<script src="${staticWebsite}resources/js/three.min.js"></script>
		<script>
			var SEPARATION = 100,
				AMOUNTX = 50,
				AMOUNTY = 50;
			
			var container;
			var camera, scene, renderer;
			
			var particles, particle, count = 0;
			
			var mouseX = 0,
				mouseY = -350;
			
			var windowHalfX = window.innerWidth / 2;
			var windowHalfY = window.innerHeight / 2;
			
			init();
			animate();
			
			function init() {
			
				container = document.createElement('div');
				document.body.appendChild(container);
			
				camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
				camera.position.z = 1000;
			
				scene = new THREE.Scene();
			
				particles = new Array();
			
				var PI2 = Math.PI * 2;
				var material = new THREE.ParticleCanvasMaterial({
			
					color: 0xc4c4c4,
					program: function(context) {
			
						context.beginPath();
						context.arc(0, 0, 1, 0, PI2, true);
						context.fill();
			
					}
			
				});
			
				var i = 0;
			
				for(var ix = 0; ix < AMOUNTX; ix++) {
			
					for(var iy = 0; iy < AMOUNTY; iy++) {
			
						particle = particles[i++] = new THREE.Particle(material);
						particle.position.x = ix * SEPARATION - ((AMOUNTX * SEPARATION) / 2);
						particle.position.z = iy * SEPARATION - ((AMOUNTY * SEPARATION) / 2);
						scene.add(particle);
			
					}
			
				}
			
				renderer = new THREE.CanvasRenderer();
				renderer.setSize(window.innerWidth, window.innerHeight);
				container.appendChild(renderer.domElement);
			
				document.addEventListener('mousemove', onDocumentMouseMove, false);
				document.addEventListener('touchstart', onDocumentTouchStart, false);
				document.addEventListener('touchmove', onDocumentTouchMove, false);
			
				//
			
				window.addEventListener('resize', onWindowResize, false);
			
			}
			
			function onWindowResize() {
			
				windowHalfX = window.innerWidth / 2;
				windowHalfY = window.innerHeight / 2;
			
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
			
				renderer.setSize(window.innerWidth, window.innerHeight);
			
			}
			
			//
			
			function onDocumentMouseMove(event) {
			
				mouseX = event.clientX - windowHalfX;
				mouseY = event.clientY - windowHalfY;
			
			}
			
			function onDocumentTouchStart(event) {
			
				if(event.touches.length === 1) {
			
					event.preventDefault();
			
					mouseX = event.touches[0].pageX - windowHalfX;
					mouseY = event.touches[0].pageY - windowHalfY;
			
				}
			
			}
			
			function onDocumentTouchMove(event) {
			
				if(event.touches.length === 1) {
			
					event.preventDefault();
			
					mouseX = event.touches[0].pageX - windowHalfX;
					mouseY = event.touches[0].pageY - windowHalfY;
			
				}
			
			}
			
			//
			
			function animate() {
			
				requestAnimationFrame(animate);
			
				render();
			
			}
			
			function render() {
			
				camera.position.x += (mouseX - camera.position.x) * .05;
				camera.position.y += (-mouseY - camera.position.y) * .05;
				camera.lookAt(scene.position);
			
				var i = 0;
			
				for(var ix = 0; ix < AMOUNTX; ix++) {
			
					for(var iy = 0; iy < AMOUNTY; iy++) {
			
						particle = particles[i++];
						particle.position.y = (Math.sin((ix + count) * 0.3) * 50) + (Math.sin((iy + count) * 0.5) * 50);
						particle.scale.x = particle.scale.y = (Math.sin((ix + count) * 0.3) + 1) * 2 + (Math.sin((iy + count) * 0.5) + 1) * 2;
			
					}
			
				}
			
				renderer.render(scene, camera);
			
				count += 0.1;
			
			}
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
					$ = layui.jquery,
					form = layui.form();

				form.verify({
					userName: function(value) {
						if(value === '')
							return '请输入用户名';
					},
					password: function(value) {
						if(value === '')
							return '请输入密码';
					}
				});

                form.on('submit(login)', function(data) {
                    window.location.href = "..common/page/index.jsp";
                });

            });

		</script>
	</body>

</html>