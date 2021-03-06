<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <li><a href="#">员工管理</a></li>
    <li><a href="#">员工信息</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
     <c:if test="${account=='admin'}">
     <li class="click"><span><img src="images/t01.png" /></span><a href="ui/emplyee/addemplyee.jsp?account=${account}">添加</a></li>
    </c:if>
    
    <c:if test="${account!='admin'}">
     <li class="click"><span><img src="images/t01.png" /></span><a href="emplypage.s">添加</a></li>
    </c:if>
     
      <c:if test="${account=='admin'}">
     <li onclick="document.getElementById('form1').submit();"><span><img src="images/t03.png" /></span>多项删除</li>
    </c:if>
    
    <c:if test="${account!='admin'}">
     <li class="click"><span><img src="images/t01.png" /></span><a href="emplypage.s">多项删除</a></li>
    </c:if>
     
     
    </ul>
    
     <div class="toolbar1">
     
    <form method="post" name="serch" id="form3 "action="selectallemp.s">
          <table>
          <tr>
           <td><input type="text" name="account" placeholder="请填写员工账号" id="h"/></td>
           <td><input type="text" name="realname" placeholder="请输入员工姓名"  id="a"/></td>
              <td>
               <select name="sex" id="b">
                <option></option>
                <option value="男">男</option>
                <option value="女">女</option>
              </select>
              </td>
         
             <td><input type="text" name="phone" placeholder="请输入员工手机号码"   id="e"/></td>
             <td><input type="text" name="address"  placeholder="请输入员工地址" id="f"/></td>
            <td><input type="submit" value="查询" id="g" class="button"/></td>
          </tr>
        </table> 
        </form>
    </div>
  </div>
  
  
  <form id="form1" name="form1" method="post" action="deleteeallemp.s">

<table class="tablelist">
    <thead>
      <tr>
        <td>  ${account}</td>
         <td>员工账号</td>
         <td>自编号</td>
         <td>真实姓名</td>
         <td>登陆密码</td>
         <td>性别</td>
         <td>出生日期</td>
         <td>身份证号</td>
         <td>电话号</td>
         <td>地址</td>
         <td>员工类型</td>
         <td>操作</td>
      </tr>
    </thead>
    <tbody>
     
      <c:forEach items="${emp}" var="e">
          <tr>
           <td><input name="checkbox" type="checkbox" value="${e.id }" /></td>
         <td>${e.account }</td>
         <td>${e.id }</td>
         <td>${e.realname }</td>
         <td>${e.password }</td>
         <td>${e.sex }</td>
       <td><fmt:formatDate value="${e.birthdate }" pattern="yyyy-MM-dd" /></td>
         <td>${e.idcard }</td>
         <td>${e.phone }</td>
         <td>${e.address }</td>
        <c:if test="${e.type==1}">
          <td>经理</td>
         </c:if>
       <c:if test="${e.type==2}">
         <td>普通员工</td>
       </c:if>
         
        <c:if test="${account=='admin'}">
        <td>
           <a href="selectoneemplyee.s?id=${e.id}">修改</a>
           <a href="deleteemplyee.s?id=${e.id}">删除</a>
         </td>
        </c:if>
        <c:if test="${account!='admin'}">
          <td>禁用</td>
        </c:if>
      </tr>
      </c:forEach>
 
    </tbody>
  </table>
  </form>
 
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
</body>
</html>
