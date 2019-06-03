<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>酒店管理系统主页</title>

<link rel="stylesheet" href="css/select.css" type="text/css"></link>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>	
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
   <div class="formtitle"><span>修改房间类型</span></div>
    <div id="usual1" class="usual">
     <div id="tab1" class="tabson">
  
<form method="post" action="updateroomtype.s"> 

  <ul class="forminfo">   
  
  <li> 
   <label>类型编号<b>*</b></label>
   <div class="vocation">
   <input  readonly="readonly" type="text" name="id" id="textfield2"  class="dfinput" value="${oneroomtype.id}"  style="width:344px;"/> 
    <span id="priceSpan">&nbsp;</span>
   </div>  
   </li>  
  
   <li> 
   <label>客房类型<b>*</b></label>
   <div class="vocation">
   <input type="text" name="type" id="textfield2"  class="dfinput" value="${oneroomtype.type}"  style="width:344px;"/> 
    <span id="priceSpan">&nbsp;</span>
   </div>  
   </li>   
   
   <br/>
   <li>
     <label>&nbsp;</label>
     <input name="" type="submit" class="btn" value="修改"/>
   </li> 
   
   </ul>     
    </form>  


   </div>    
  </div> 
</div>

</body>
</html>
