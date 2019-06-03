<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>酒店管理系统主页</title>

  <link rel="stylesheet" href="css/select.css" type="text/css"></link> 
  <link rel="stylesheet" href="css/style.css" type="text/css"></link>
  
  </head>

<body>

<div class="place"> <span>位置：</span>
	  <ul class="placeul">
	    <li><a href="main.html">首页</a></li>
	    <li><a href="#">客房管理</a></li>
	    <li><a href="#">添加客房</a></li>
	  </ul>
	</div>

<div class="formbody">
<div class="formtitle"><span>修改房间</span></div>
<div id="usual1" class="usual">
<div id="tab1" class="tabson">


<form method="post" action="updateroom.s">

	<ul class="forminfo">
	<li>
	<label>客房编号<b>*</b></label>
	<div class="vocation">
	<input  readonly="readonly" type="text" name="roomnumber" id="roomNumber" class="dfinput" value="${oneroom.roomnumber}" style="width:344px;"/>
	<br/> 
	<br/>
	</div>
	</li>

	<li>
	<label>客房价格<b>*</b></label>
	<div class="vocation">
	<input type="text" name="price" class="dfinput" value="${oneroom.price}"   style="width:344px;"/>
	<span id="priceSpan">&nbsp;</span> 
	</div>
	<br/> 
	</li>

   <li> 
   <label >客房类型<b>*</b></label>
   <div class="vocation">
   <select name="roomtype"  id="select" style="opacity:1; width:200px; height:35px;"class="dfinput" >
    <c:forEach items="${type }" var="ro">
    <option  <c:if test="${oneroom.roomtype==ro.id }">selected=selected</c:if> value="${ro.id }">${ro.type}</option>   
    </c:forEach> 
    </select>
   </div>
    <br/> 
   </li>
	
	<li>
	<label>客房押金<b>*</b></label>
	<div class="vocation">
	<input type="text" name="deposit"  class="dfinput" value="${oneroom.deposit}"   style="width:344px;"/>
	<br/> 
    <br/>
	</div>
	</li>

	<li>
	<label>客房状态<b>*</b></label>
	<div class="vocation">
	<select name="status" id="select2" style="opacity:1; width:200px; height:35px;"class="dfinput">
	 <option <c:if test="${oneroom.status==1}">selected="selected" </c:if> value="1">可入住</option>
	 <option <c:if test="${oneroom.status==2}">selected="selected" </c:if> value="2">已入住</option>
	 <option <c:if test="${oneroom.status==3}">selected="selected" </c:if>>待清理</option>
	 <option <c:if test="${oneroom.status==4}">selected="selected" </c:if> value="4">停用</option>
	</select>   
	 </div>
	 <br/> 
	 <br/>
	 <br/>  
	</li>
	
	 <li>
     <label>&nbsp;</label>
     <input name="button" type="submit" class="btn" value="修改"/>
     </li>
	 </ul>
	 </form> 
  </div>
 </div>
</div>

</body>
</html>
