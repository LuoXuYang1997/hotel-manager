<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

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
										
				<li><span><img src="images/ico06.png"></img></span>
				<a href="Roomtype.s">查询客房类型</a>
				</li>
				
				<li><span><img src="images/ico06.png"></img></span>
				<a href="getroomstatus.s?status=3">查询待清理房间</a>
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
							<td><input type="submit" class="button" value="查询"/></td>
						</tr>					
				</table>
				</form>
			</div>
		</div>
		
		
		<form method="post" id="form1" action="delallrooms.s">
			<table class="tablelist">
				<thead>
					<tr>
						<th>
						</th>						
						<th>房间编号</th>
						<th>价格</th>
						<th>房间类型</th>
						<th>押金</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${page.list}" var="r">
						<tr>
						<td>
						<input id="check1" type="checkbox" name="checkbox" value="${r.roomnumber}" />
						</td>
						<td>${r.roomnumber}</td>
						<td>${r.price}</td>
						<td>${r.type}</td>										
						<td>${r.deposit}</td>
						<c:if test="${r.status==1}">
						 <td>可入住</td>	  
						</c:if>
					    <c:if test="${r.status==2}">
						 <td>已入住</td>	  
						</c:if>	
						<c:if test="${r.status==3}">
						 <td>待清理</td>	  
						</c:if>	
						<c:if test="${r.status==4}">
						 <td>停用</td>	  
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
	<div class="pagin">
	     <div class="message">共<i class="blue">${page.totalpage }</i>页，
	            当前显示第&nbsp;<i class="blue">${page.pageno }&nbsp;</i>页</div>
	     <ul class="paginList">
	     
	      <c:if test="${ page.pageno-1<1}">
	      <li class="paginItem"> <a href="roompage.s?pageno=${page.pageno}"><span class="pagepre"></span></a></li>
	      </c:if>
	      <c:if test="${ page.pageno-1>=1}">
	      <li class="paginItem"><a href="roompage.s?pageno=${page.pageno-1}"><span class="pagepre"></span></a></li>
	      </c:if>
	       
	      <li class="paginItem"><a href="roompage.s?pageno=1">首页</a></li>
	      <c:forEach begin="1" end="${page.totalpage}" var="i">
	      <li class="paginItem"><a href="roompage.s?pageno=${i}">${i}</a></li>
	      </c:forEach>
	      <li class="paginItem more"><a href="javascript:;">...</a></li>
	      
	      <li class="paginItem"><a href="roompage.s?pageno=${page.totalpage}">尾页</a></li>
	      <c:if test="${page.pageno+1>page.totalpage}">
	      <li class="paginItem">&ldquo;<a href="roompage.s?pageno=${page.pageno}"><span class="pagenxt"></span></a></li>
	      </c:if>
	      
	    </ul>
	  </div>
		
	</div>
	
</body>
</html>
