<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
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
<script type="text/javascript">



$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
	
	
	
});


</script>
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">员工信息管理</a></li>
    <li><a href="#">添加员工信息</a></li>
  </ul>
</div>
<div class="formbody">
  <div class="formtitle"><span>员工修改</span></div>
   <form id="form1" name="form1" method="post" action="updateemplyee.s">
  <div id="usual1" class="usual">
    <div id="tab1" class="tabson">
      <ul class="forminfo">
        <li>
          <label>员工账号<b>*</b></label>
          <div class="vocation"> 
              <input name="account" type="text" class="dfinput" value="${emplyee.account }"   style="width:518px;"/>
            
          </div>
        </li>
        <br />
        <li  style="margin-top:20px;">
          <label for="name" >员工自编号<b>*</b></label>
          <div class="vocation">
            <input name="id" type="text" class="dfinput" disabled="disabled" value="${emplyee.id }"  style="width:344px;"/>
          </div>
        </li>
        <br />
           <li  style="margin-top:20px;">
          <label for="name" >员工真实姓名<b>*</b></label>
          <div class="vocation">
            <input name="realname" type="text" class="dfinput" value="${emplyee.realname }"  style="width:344px;"/>
          </div>
        </li>
        <br />
           <li  style="margin-top:20px;">
          <label for="name" >员工登陆密码<b>*</b></label>
          <div class="vocation">
            <input name="password" type="text" class="dfinput" value="${emplyee.password }"  style="width:344px;"/>
          </div>
        </li>
         <br />
        <li>
          <label for="sex">性别<b>*</b></label>
          <input name="sex" type="radio" value="男" <c:if test="${emplyee.sex=='男'}">
           checked="checked"
          </c:if>  />
          男&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="sex" type="radio" value="女" <c:if test="${emplyee.sex=='女'}">
           checked="checked"
          </c:if>  />
          女
        </li>
        <br />
          <li  style="margin-top:10px;">
          <label for="name" >员工出生日期<b>*</b></label>
          <div class="vocation">
            <input name="birthdate" type="text" class="dfinput"  value="${emplyee.birthdate }"  disabled="disabled" style="width:344px;"/>
          </div>
        </li>
        <br />
        
         <li>
          <label for="name" >员工身份证号<b>*</b></label>
          <div class="vocation">
            <input name="idcard" type="text" class="dfinput" value="${emplyee.idcard }" disabled="disabled" style="width:344px;"/>
          </div>
        </li>
        <br />
        <li>
          <label for="name" >员工手机号码<b>*</b></label>
          <div class="vocation">
            <input name="phone" type="text" class="dfinput" value="${emplyee.phone }"  style="width:344px;"/>
          </div>
        </li>
        <br />
        <li>
          <label for="name" >员工地址<b>*</b></label>
          <div class="vocation">
            <input name="address" type="text" class="dfinput" value="${emplyee.address }"  style="width:344px;"/>
          </div>
        </li>
        <br />
        <li>
          <label for="name" >员工类型<b>*</b></label>
          <div class="vocation"> 
            <!--   <input name="" type="text" class="dfinput" value="请填写单位名称"  style="width:518px;"/>-->
            <select class="select1" name="type" value="${emplyee.type }">
              <option value="1">经理</option>
           
              <option value="2">员工</option>
              <option>其他</option>
            </select>
          </div>
        </li>
        <br />
        
        <br />
        <li>
          <label>&nbsp;</label>
          <input name="" type="submit" class="btn" value="修改员工"/>
        </li>
      </ul>
    </div>
  </div>
  </form>
  <script type="text/javascript"> 
  
      $("#usual1 ul").idTabs(); 
    </script> 
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	
	!function(){
laydate.skin('qianhuang');
laydate({elem: '#Calendar'});
laydate.skin('qianhuang');
laydate({elem: '#Calendar2'});
}();
$(function dd(){
		var d=new Date(),str="";
		str+=(d.getFullYear()+"-");
		str+="0";
		str+=(d.getMonth()+1+"-");
		str+=d.getDate();
		$("#Calendar").attr("value",str);
		$("#Calendar2").attr("value",str);
	});

	</script> 
</div>
</body>
</html>
