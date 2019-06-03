<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
</script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="main.jsp">首页</a>
			</li>
			<li><a href="#">入住管理</a>
			</li>
			<li><a href="#">入住信息查询</a>
			</li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="tools">
			<ul class="toolbar">
				<li><span><img src="images/t01.png" /></span>
				<a href="ui/room/addRoomtype.jsp">添加</a>
				</li>
								
				<li onclick="document.getElementById('form1').submit();">
				<span><img src="images/t03.png" /> </span>删除
				</li>
						
				<li><span><img src="images/ico06.png"></img></span>
				<a href="Roomtype.s">查询客房类型</a>
				</li>				
			</ul>
			
			<br/>
     <div class="formbody">
      <div id="usual1" class="usual">
        <div id="tab1" class="tabson">			
         <form method="post" id="form1" action="delallroomtypes.s">      
		  <table class="tablelist">
		    <thead>
				<tr>
				<th></th>
				<th>类型编号</th>
				<th>房间类型</th>
				<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${roomtypes}" var="rs">
				<tr>
				<td>
				<input id="check1" type="checkbox" name="checkbox" value="${rs.id}" />
				</td>
				<td>${rs.id}</td>
				<td>${rs.type}</td>
				<td>				
				 <a class="tablelink" href="selectoneroomtype.s?id=${rs.id}">修改</a>
				 <a class="tablelink" href="delroomtype.s?id=${rs.id}">删除</a>
				</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
			
		
	</div>
  </div>    
 </div> 
</div>
	</div>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
