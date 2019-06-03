<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统菜单</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>
</head>

<body style="background:#fff3e1;">
<div class="lefttop"><span></span>功能菜单</div>
<dl class="leftmenu">
 <dd>
    <div class="title"> <span><img src="../images/leftico03.png" /></span>入住管理</div>
    <ul class="menuson">
       <li class="active">
        <div class="header"><cite></cite><a href="../selectCheckByStatus0.s" target="rightFrame">入住信息</a><i></i></div>
      </li>
      <li>
        <div class="header"> <cite></cite> <a href="../getRoomWithType.s" target="rightFrame">客人入住</a> <i></i> </div>
      </li>
       <li>
        <div class="header">
        <cite></cite><a href="../selectCheckwithInRoom.s" target="rightFrame">结账退房</a><i></i>
      </div>
      </li>
        <li>
        <div class="header"> <cite></cite> <a href="../getBillPageCon.s" target="rightFrame">订单查询</a> <i></i> </div>
      </li>
  
    </ul>
  </dd>

  <dd>
    <div class="title"><span><img src="../images/leftico03.png" /></span>会员管理</div>
    <ul class="menuson">
     <!--  <li>
        <div class="header"><cite></cite><a href="vip/vipinfo.jsp" target="rightFrame">会员信息查询</a><i></i></div>
      </li>--> 
      <li>
        <div class="header"><cite></cite><a href="../ShowPage11.s" target="rightFrame">会员信息管理</a><i></i></div>
      </li>
      <li>
        <div class="header"><cite></cite><a href="vip/addvip.jsp" target="rightFrame">添加会员</a><i></i></div>
      </li>
    </ul>
  </dd>
  <dd>
    <div class="title"><span><img src="../images/leftico03.png" /></span>客房管理</div>
    <ul class="menuson">
      <li><div class="header"><cite></cite><a href="../roompage.s" target="rightFrame">客房信息管理</a><i></i></div></li>      
      <li><div class="header"><cite></cite><a href="../Roomtype1.s" target="rightFrame">添加客房</a><i></i></div></li>
    </ul>
  </dd>

  <dd>
    <div class="title"><span><img src="../images/leftico03.png" /></span>员工管理</div>
    <ul class="menuson">
      <li><div class="header"><cite></cite><a href="../emplypage.s" target="rightFrame">员工信息管理</a><i></i></div></li>
        <c:if test="${account=='admin' }">
      <li><div class="header"><cite></cite><a href="emplyee/addemplyee.jsp" target="rightFrame">添加员工</a><i></i></div></li>
        </c:if>
        
       
    </ul>
  </dd>

  <dd>
  <div class="title"> <span><img src="../images/leftico03.png" /></span><a href="charts/roomtypecharts.jsp" target="rightFrame">客房状态</a></div>
  </dd>
</dl>
</body>
</html>
