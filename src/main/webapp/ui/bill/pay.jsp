<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pay.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  
  <body>
   <table style="font-size: 24px;font-weight: bold;" border=1>
   		<tr>
   			<td>房间号</td>
   			<td>${bill.roomnumber}</td>
   		</tr>
   		   		<tr>
   			<td>会员姓名</td>
   			<td>${bill.guestname }</td>
   		</tr>
   		<tr>
   			<td>VIP折扣</td>
   			<td>${rate}</td>
   		</tr>
   		 <tr>
   			<td>消费金额</td>
   			<td>${bill.payamount }</td>
   		</tr>
   		<tr>
   			<td>房间押金</td>
   			<td>${deposit }</td>
   		</tr>
   			<tr>
   			<td>余额</td>
   			<td>${vip.balance }</td>
   		</tr>
   			<tr>
   			<td>所需要交费</td>
   			<td></td>
   		</tr>
   </table>
   
   
  </body>
</html>
