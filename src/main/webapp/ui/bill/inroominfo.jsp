<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
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
	function getElementStr(){
		var $guestname="";
		var $roomnumber="";
		var $phone="";
		var $checkintime="";
		var $checkouttime="";
		if($("[name='guestname']").val()!=""){
			$guestname="&guestname="+$("[name='guestname']").val();
			//alert($guestname);
		}
			if($("[name='roomnumber']").val()!=""){
			$roomnumber="&roomnumber="+$("[name='roomnumber']").val();
			//alert($guestname);
		}
			if($("[name='phone']").val()!=""){
			$phone="&phone="+$("[name='phone']").val();
			//alert($guestname);
		}
			if($("[name='checkintime']").val()!=""){
			$checkintime="&checkintime="+$("[name='checkintime']").val();
			//alert($guestname);
		}
			if($("[name='checkouttime']").val()!=""){
			$checkouttime="&checkouttime="+$("[name='checkouttime']").val();
			//alert($guestname);
		}
		var str=$guestname+$roomnumber+$phone+$checkintime+$checkouttime;
		return str;
	}
	$("#frontpage").click(function(){
		var str=getElementStr();
		location.href="getBillPageCon.s?page="+${page-1}+str;
	});
	$("#firstpage").click(function(){
		var str=getElementStr();
		location.href="getBillPageCon.s?page=1"+str;
	});
		$("#lastpage").click(function(){
		var str=getElementStr();
		location.href="getBillPageCon.s?page="+${maxpage}+str;
	});
	$("#nextpage").click(function(){
		var $guestname="";
		var $roomnumber="";
		var $phone="";
		var $checkintime="";
		var $checkouttime="";
		if($("[name='guestname']").val()!=""){
			$guestname="&guestname="+$("[name='guestname']").val();
			//alert($guestname);
		}
			if($("[name='roomnumber']").val()!=""){
			$roomnumber="&roomnumber="+$("[name='roomnumber']").val();
			//alert($guestname);
		}
			if($("[name='phone']").val()!=""){
			$phone="&phone="+$("[name='phone']").val();
			//alert($guestname);
		}
			if($("[name='checkintime']").val()!=""){
			$checkintime="&checkintime="+$("[name='checkintime']").val();
			//alert($guestname);
		}
			if($("[name='checkouttime']").val()!=""){
			$checkouttime="&checkouttime="+$("[name='checkouttime']").val();
			//alert($guestname);
		}
		location.href="getBillPageCon.s?page="+${page+1}+$guestname+$roomnumber+$phone+$checkintime+$checkouttime;
	});
});
</script>

</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="main.html">首页</a></li>
    <li><a href="#">入住管理</a></li>
    <li><a href="#">入住信息查询</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
 
    </ul>
    
    <div class="toolbar2">
      <table>
        <form method="post" name="serch" action="getBillPageCon.s">
          <tr>
            <td class="zi"><span>房间号：</span></td>
            <td><input type="text" placeholder="房间号" name="roomnumber" value="${roomnumber }"/></td>
               <td class="zi"><span>姓名：</span></td>
            <td><input type="text" placeholder="姓名" name="guestname" value="${guestname }"/></td>
            <td class="zi"><span>电话：</span></td>
            <td><input type="text" placeholder="电话" name="phone" value="${phone}"/></td>
            <td class="zi"><span>入住日期：</span></td>
            <td><input type="text" placeholder="入住日期"  name="checkintime" id="Calendar"  value="${checkintime}"/></td>
            <td class="zi"><span>离开日期：</span></td>
            <td><input type="text" placeholder="离开日期" id="Calendar2" name="checkouttime"  value="${checkouttime }"/></td>
          
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
        <th>手机号码</th>
        <th>身份证号码</th>
        <th>入住时间</th>
        <th>退房时间</th>
        <th>消费金额</th>
        <th>是否结账</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>    
      <c:forEach items="${bill}" var="b">
      <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>${b.roomnumber}</td>
        <td>${b.roomtypestr}</td>
        <td>${b.guestname}</td>
        <td>${b.phone}</td>
        <td>${b.idcard}</td>
        <td>${b.checkintime}</td>
        <td>${b.checkouttime}</td>
        <td>${b.payamount}</td>
        <td><c:if test="${b.billstatus==0}"><a href="toPaybill.s?id=${b.id }">未结账<a/></c:if><c:if test="${b.billstatus==1}">已结账</c:if></td>
        <td> <a href="#" class="tablelink"> 无</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <div class="pagin">
    <div class="message">共<i class="blue">${maxline }</i>条记录，当前显示第&nbsp;<i class="blue">${page}&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem" id="firstpage"><a  href="javascript:;">首页</a></li>
      <li class="paginItem"  id="frontpage"><a style="width: 40px;" href="javascript:;">上一页</a></li>
      <li class="paginItem" id="nextpage"><a style="width: 40px;" href="javascript:;">下一页</a></li>
      <li class="paginItem" id="lastpage"><a href="javascript:;">尾页</a></li>
    </ul>
  </div>

  
  <div class="tip">
    <div class="tiptop"><span>提示信息</span><a></a></div>
    <div class="tipinfo"> <span><img src="images/ticon.png" /></span>
      <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite> </div>
    </div>
    <div class="tipbtn">
      <input name="" type="button"  class="sure" value="确定" />
      &nbsp;
      <input name="" type="button"  class="cancel" value="取消" />
    </div>
  </div>
</div>


  
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	
	!function(){
laydate.skin('qianhuang');
laydate({elem: '#Calendar'});
laydate.skin('qianhuang');
laydate({elem: '#Calendar2'});
}();


	</script> 
</body>
</html>
