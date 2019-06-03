<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<link href="../../css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../../js/select-ui.min.js"></script>
<script type="text/javascript" src="../../editor/kindeditor.js"></script>
<script type="text/javascript" src="../../js/laydate/laydate.js"></script>

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
	


      
		
	  
	  
	  //判断自编号
	  $("#id").blur(function() {
			$(this).css("background-color", "#FFF")
			var text= $(this).val();
			var phone = /^\d{1,4}$/;
			if (phone.test(text)==false) {
			    $("#eid").html("输入有误").css("color","red");
			   return false;
			}else{
			   $("#eid").html("");
			return true;
			}
		});
		
		
		//判断真实姓名
		$("#realname").blur(function() {
			$(this).css("background-color", "#FFF")
			var text = $(this).val();
			if (text == "") {
				$("#real").text("请填写用户名").css("color","red");
				return false;
			}else{
			    $("#real").text("");
			return true;
			}
		});
		
		//判断登陆密码
		 $("#upwd").blur(function() {
			$(this).css("background-color", "#FFF")
			var text= $(this).val();
			var phone = /^\d{6,10}$/;
			if (phone.test(text)==false) {
			    $("#pd").html("输入有误").css("color","red");
			   return false;
			}else{
			   $("#pd").html("");
			return true ;
			}
		});
		
	
		
		//判断身份证号
		 $("#icd").blur(function() {
			$(this).css("background-color", "#FFF")
			var text= $(this).val();
			var card =  /^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
			
			if (card.test(text)==false) {
			    $("#card").html("输入有误").css("color","red");
			      return false
			 }else{
			    $.post("../../checkidcard.s",{"idcard":text},function(data){
			  
			   // window.location.reload(true);
			       if(data==1){
			       $("#card").html("用户已存在").css("color","red");
			       }else{
			         $("#card").html("");
			        $("#birthdate").val(data);
			           return true;
			       }
			     });
			
			}
		});
		
		//判断手机号
		
		 $("#tel").blur(function() {
			$(this).css("background-color", "#FFF")
			var text= $(this).val();
			var phone = /^[1]{1}\d{10}$/;
			if (phone.test(text)==false) {
			    $("#phone").html("输入有误").css("color","red");
			   return false;
			}else{
			   $("#phone").html("");
			return true ;
			}
		});
		
		
		//判断地址
		$("#addres").blur(function() {
			$(this).css("background-color", "#FFF")
			var text = $(this).val();
			if (text == "") {
				$("#ads").text("请填写地址").css("color","red");
				return false;
			}else{
			    $("#ads").text("");
			return true;
			}
		})
	});

  	//判断出生日期
		function checkdate(){
		  var text= $("#birthdate").val();
		  var date=/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/;
		  if(date.test(text)==false){
		      $("#bdate").html("输入有误").css("color","red");
			   return false;
		  }else{
		        $("#bdate").html("");
			  return true ;
		  }
		}
		//判断员工账号
		function checkaccount(){
		 //var flag=false;
		 var text= $("#account").val();
		 if (text == "") {
				$("#acc").text("请填写账户名称").css("color","red");
				return false;
			}else{
			 $.post("../../checkaccount.s",{"account":text},function(data){
			   if(data==1){
			   	$("#acc").text("该账号已存在").css("color","red");
			     return false;
			   }
			 });
			 if($("#acc").text("")){ return true;}
			
			}
		}
		
		//判断登陆密码
		function checkpassword(){
		  var text= $("#upwd").val();
		  var phone = /^\d{6,10}$/;
			if (phone.test(text)==false) {
			    $("#pd").html("输入有误").css("color","red");
			   return false;
			}else{
			   $("#pd").html("");
			return true ;
			}
		}
 
</script>

<script type="text/javascript">
  //加载函数
	$(function(){
	
		   $("#form1").submit(function(){
		  
			if(checkdate()&&checkpassword()&&checkaccount()){
			   return true;
			}else {
				      alert( checkdate());
				      alert(checkaccount());
				      alert(checkpassword());
					  alert("信息不完整，请将信息填写完整！");
				return false;
			}
			
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
  <div class="formtitle"><span>员工添加</span></div>
   <form id="form1" name="form1" method="post" action="../../addemplyee.s">
  <div id="usual1" class="usual">
    <div id="tab1" class="tabson">
      <ul class="forminfo">
        <li>
          <label>员工账号<b>*</b></label>
          <div class="vocation"> 
              <input name="account" type="text" onblur="checkaccount()" id="account" class="dfinput" placeholder="请填写员工账号"  style="width:344px;"/>
          </div>
          <span id="acc"></span>
        </li>
        <br/>
       
           <li  style="margin-top:20px;">
          <label for="name" >员工真实姓名<b>*</b></label>
          <div class="vocation">
            <input name="realname" id="realname" type="text" onblur="checkpassword()" class="dfinput" placeholder="请输入员工姓名"  style="width:344px;"/>
          </div>
          <span id="real"></span>
        </li>
       <br/>
       <br/>
           <li  style="margin-top:20px;">
          <label for="name" >员工登陆密码<b>*</b></label>
          <div class="vocation">
            <input name="password" id="upwd" type="text" class="dfinput" placeholder="请输入员工登陆密码"  style="width:344px;"/>
          </div>
            <span id="pd"></span>
        </li>
         <br />
        <li>
          <label for="sex">性别<b>*</b></label>
          <input name="sex" type="radio" value="男" checked="checked" />
          男&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="sex" type="radio" value="女" />
          女
        </li>
        <br />
          <li  style="margin-top:10px;">
          <label for="name" >员工出生日期<b>*</b></label>
          <div class="vocation">
            <input name="birthdate" id="birthdate"  onblur="checkdate()" type="text" class="dfinput" placeholder="请输入员工出生日期"  style="width:344px;"/>
          </div>
          <span id="bdate"></span>
        </li>
        <br />
        
         <li>
          <label for="name" >员工身份证号<b>*</b></label>
          <div class="vocation">
            <input name="idcard" id="icd"  type="text" class="dfinput" placeholder="请输入员工身份证号码"  style="width:344px;"/>
          </div>
          <span id="card"></span>
        </li>
        <br />
        <li>
          <label for="name" >员工手机号码<b>*</b></label>
          <div class="vocation">
            <input name="phone" id="tel" type="text" class="dfinput" placeholder="请输入员工手机号码"  style="width:344px;"/>
          </div>
          <span id="phone"></span>
        </li>
        <br />
        <li>
          <label for="name" >员工地址<b>*</b></label>
          <div class="vocation">
            <input name="address"  id="addres" type="text" class="dfinput" placeholder="请输入员工地址"  style="width:344px;"/>
          </div>
          <span id="ads"></span>
        </li>
        <br />
        <li>
          <label for="name" >员工类型<b>*</b></label>
          <div class="vocation" style="border: none"> 
            <!--   <input name="" type="text" class="dfinput" value="请填写单位名称"  style="width:518px;"/>-->
            <select class="select1" name="type" style="opacity:1;width:200px;height:35px;">
               <option value="1">经理</option>
               <option value="2">普通员工</option>
            
            </select>
          </div>
        </li>
        <br />
        
        <br />
        <li>
          <label>&nbsp;</label>
          <input name="" type="submit" class="btn" id="submit" value="添加员工"/>
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
