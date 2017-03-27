<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="keywords" content="滚动条, scrollbar, 页面底部, 聊天窗口, " />
  <title>机器人</title>
  <style type="text/css">
	*{padding:0;margin:0;}
	body{background:url(image/bg.jpg) center no-repeat;}
	/*start cat*/
	.cat{height:400px;width:900px;margin:0px auto;overflow: auto}
	.cat-head{height:60px;background-color:#f90;line-height:60px;font-family:"楷体";font-size:22px;color:#f6f9f8;text-indent:20px;margin:50px auto 0px;width:900px;}
	.cat-y{padding: 10px;text-align:left;}
	.cat .cat-y img{vertical-align:middle;}
	.cat-x{padding: 10px;text-align:right;}
	.cat .cat-x img{vertical-align:middle;border-radius: 25px}
	.cat-footer{width:900px;height:80px;margin:0px auto;}
	.cat-footer .cat-edit{width:820px;float:left;height:60px;outline:none;line-height:60px;background-color:rgba(202, 194, 194, 0.35);text-indent:20px;font-family:cursive;font-size:22px;}
	.cat-footer input{border:none;height:60px;width:80px;float:right;outline:none;cursor:pointer;background-color:rgba(102, 51, 153, 0.62);}
	/*end cat*/
  </style>
     <link rel="icon"  href="image/robot.png" type="image/png" />
 </head>
 <body >
	<div  class="cat-head">
	图灵机器人系统PK真人
	</div>
	<!--start cat-->
  <div  class="cat">
	<div  class="cat-y">
		<img alt="机器人" height="50px" width="50px" src="image/robot.png" />
		<span>我是全宇宙最聪明的机器人哟～～～～</span>
	</div>
  </div>
	<div class="cat-footer">
		<div contentEditable=true class="cat-edit"></div>
		<input type="button" value="发 送"/>
	</div>
	<!-- end cat-->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
		$(".cat-edit").keypress(function(even){
			if(even.keyCode==13 ){
			/*禁用enter换行*/
			event.cancelBubble=true;
			event.preventDefault();
			event.stopPropagation();
			$(":button").click();
			};
		});
		$(":button").click(function (){
		var $content = $(".cat-edit").html();
			if($content!=null && $content!=undefined && $content!=""){
			$(".cat-edit").html("");
			var tend="<div  class='cat-x'><span>"+$content+"&nbsp;&nbsp;</span><img alt='真人' height='50px' width='50px' src='image/title.jpg' /></div>";
				$(".cat").append(tend);
				$.ajax({
				url:"servlet/RobotServlet",
				type:"post",
				data:{"info":$content},
				dataType:"json",
				success:function(data){
				var tends="<div  class='cat-y'><img alt='机器人' height='50px' width='50px' src='image/robot.png' /><span>"+data.text+"</span></div>";
				$(".cat").append(tends);
				// 控制滚动条最低部
				$(".cat").scrollTop( $(".cat")[0].scrollHeight );
				},
				});
			};
		});
		});
	</script>
 </body>
</html>
