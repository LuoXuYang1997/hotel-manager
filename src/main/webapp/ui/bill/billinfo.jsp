<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="main.html">首页</a></li>
    <li><a href="#">入住管理</a></li>
    <li><a href="#">入住信息</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
   
    
    <div class="toolbar1">
      <table>
        <form method="post" name="serch" action="selectCheckByConAndStatus0.s">
          <tr>
           <td class="zi"><span>房间类型：</span></td>
            <td>
            	<select name="roomtype">
            		<option value="">请选择房间类型</option>
            		<c:forEach items="${types }" var="t">
            		<option value="${t.id}"> ${t.type }</option>
            		</c:forEach>
            	</select>
            </td>
              <td class="zi"><span>客人身份证：</span></td>
            <td><input type="text" placeholder="客人身份证" name="idcard" value="${idcard }"/></td>  
             <td><input type="submit" value="查询" class="button"/></td>
          </tr>
        </form>
      </table>
    </div>
    
  </div>
  <table class="tablelist">
    <thead>
      <tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>房间号</th>
        <th>房间类型</th>
        <th>客人姓名</th>
        <th>客人身份证</th>
        <th>客人手机号</th>
        <th>入住时间</th>
        <th>房间单价</th>
        <th>房间押金</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="#{ checks}"  var="c">
      <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>${c.roomnumber}</td>
        <td>${c.room.type}</td>
        <td>${c.username}</td>
        <td>${c.idcard }</td>
        <td>${c.phone }</td>
        <td>${c.checkintime }</td>
        <td>${c.room.price }</td>
        <td>${c.room.deposit}</td>
        <td> <a href="#" class="tablelink"> 无</a></td>
      </tr>
      </c:forEach>

    </tbody>
  </table>
 
  </div>

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
