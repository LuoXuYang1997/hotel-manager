<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<script language="javascript">
  $(document).ready(function(){
       $("#chick").click(function(){	      
		   $(".st").each(function(i,obj){
		     if( obj.checked){
			  obj.checked=false;
			 }else{
			  obj.checked=true;
			 }
		    
		   });
		   
		  
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
						
				<li><span><img src="images/t02.png"></img></span>
				<a onclick="document.getElementById('form1').submit();" href="javascript:;">修改待清理状态</a>
				</li>
				
			</ul>
			
			</div>
		
		
		<form method="post" id="form1" action="cleanAllRooms.s">
			<table class="tablelist">
				<thead>
					<tr>
					<th>
				    <input class="st"  id="chick" type="checkbox" name="checkbox"/><samp>全选/全不选</samp>
					</th>												
					<th>房间编号</th>						
					<th>状态</th>				   				
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${roomstatys}" var="r">
						<tr>
						<td>
						<input class="st"  id="checkbox" type="checkbox" name="cleanrooms" value="${r.roomnumber}" />
						</td>
						<td>${r.roomnumber}</td>																	
						<c:if test="${r.status==3}">
						 <td>待清理</td>	  
						</c:if>	  																																		
						</tr>
					</c:forEach>

				</tbody>

			</table>
		</form>		
	</div>
	
</body>
</html>
