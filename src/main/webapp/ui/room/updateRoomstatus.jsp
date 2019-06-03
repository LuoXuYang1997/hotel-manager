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
		   //jquery中循环的函数
		   $(".st").each(function(i,obj){
		     //alert("循环第"+i+"次");
			 obj.checked=true;
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
				<li><span><img src="images/t01.png" /></span>
				<a href="Roomtype1.s">添加</a>
				</li>
								
				<li onclick="document.getElementById('form1').submit();">
				<span><img src="images/t03.png" /> </span>删除
				</li>
						
				<li><span><img src="images/t02.png"></img></span>
				<a href="cleanAllRooms.s">修改待清理状态</a>
				</li>
				
			</ul>
			
			<div class="toolbar1">
			<form method="post" name="serch" action="getllselectbyrooms.s">
				<table>					
						<tr>
						    <td class="zi"><span>房间号：</span></td>
						    <td><input type="text"name="roomnumber" value="" placeholder="请输入" /></td>
							<td class="zi"><span>房间类型：</span></td>
							
							<td>
							<select name="roomtype" size="1" id="select" style="width:100px;">
						    <option  value="" >请选择</option>
						    <c:forEach items="${bytype}" var="rt">
						    <option value="${rt.id}">${rt.type}</option>
						    </c:forEach>  
						    </select>
							</td>
							
							<td class="zi"><span>房间状态：</span></td>
							<td>
							<select name="status" style="width:100px;" id="select2"  >
							   <option value="">请选择</option>
							   <option value="1">可入住</option>
							   <option value="2">已入住</option>
							   <option value="3">待清理</option>
							   <option value="4">停用</option>
							</select>
						    </td>					
						</tr>					
				</table>
				</form>
			</div>
		</div>
		
		
		<form method="post" id="form1" action="cleanAllRooms.s">
			<table class="tablelist">
				<thead>
					<tr>
					<th>
				    <input class="st"  id="chick" type="checkbox" name="checkbox"  />
					</th>												
					<th>房间编号</th>						
					<th>状态</th>
				   <th>操作</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${roomstatys}" var="r">
						<tr>
						<td>
						<input class="st"  id="checkbox" type="checkbox" name="roomnumber" value="${r.roomnumber}" />
						</td>
						<td>${r.roomnumber}</td>																	
						<c:if test="${r.status==3}">
						 <td>待清理</td>	  
						</c:if>	  																
						<td>
						<a class="tablelink" href="selectoneroom.s?roomnumber=${r.roomnumber}">修改</a>
						<a class="tablelink" href="delroom.s?roomnumber=${r.roomnumber}" >删除</a>
						</td>												
						</tr>
					</c:forEach>

				</tbody>

			</table>
		</form>		
	</div>
	
</body>
</html>
