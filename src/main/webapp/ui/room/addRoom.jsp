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

	<script type="text/javascript" >
$.ajaxSetup({
     			async:false
     		});
	//返回值时，先定义全局变量，由ajax改变值，返回该全局变量
	var flag=false;	
	function myblurCheckRoomNumber(){
	//判断房间号	
			var temp=false;
			var $v=$("#roomNumber");
			$v.css("background-color", "#FFF");
			var text= $v.val();
			var room = /^[0-9]{4,4}$/;
			if (room.test(text)==false) {
			    $("#roomNumberSpan").html("房间号不能为空或房间号必须为4位数字组成").css("color","red");
			      return false
			 }else{
			    $.post("checkroomumber.s",{"roomnumber":text},function(data){ 
			   // window.location.reload(true);
			       if(data==1){
			       $("#roomNumberSpan").html("房间号已存在").css("color","red");
			       }else{
			         $("#roomNumberSpan").html("正确");
						$("#roomNumberSpan").css("color","green");
			      	flag=true;
			           temp= true;
			           return flag;
			       }
			     });
			
			}
			 return flag;
	}
	
	
	function myblurCheckPrice(){
	var price=$("#price").val().trim();
	var reg = /^[1-9]+[0-9]*$/;
	//alert(typeof(parseFloat(price)));
	//alert(price>0);
	var	ok=false;
	if(!isNaN(price)&&parseFloat(price)>0){
		//alert("12");
		ok=true;
		}
	var ok = reg.test(price); 
	//alert(ok);
	if(ok){
		//如果是true，那么颜色是正常的
						$("#priceSpan").html("正确");
						$("#priceSpan").css("color","green");
						return true;
	}else{
		//如果是false
						$("#priceSpan").html("价格不能为空,或价格必须为大于0的数字");
						$("#priceSpan").css("color","red");
						return false;
	}
}
function myblurCheckDeposit(){
	var deposit=$("#deposit").val().trim();
	//alert(deposit);
	var	ok=false;
	if(!isNaN(deposit)&&parseFloat(deposit)>0){
		//alert("12");
		ok=true;
		}
	if(ok){
		//如果是true，那么颜色是正常的
						$("#depositSpan").html("正确");
						$("#depositSpan").css("color","green");
						return true;
	}else{
		//如果是false
						$("#depositSpan").html("押金不能为空,或押金必须为大于0的数字");
						$("#depositSpan").css("color","red");
						return false;
	}
}


	$(function(){
			
		$("#formAdd").submit(function(){
		    var	ok=false;
			if(myblurCheckRoomNumber()&&myblurCheckPrice()&&myblurCheckDeposit()){			
				
				return true;
			} else {
			//alert(myblurCheckRoomNumber());
			//alert(myblurCheckPrice());
			alert("信息输入错误");
				return false;				
			}
			
		});
	});
						
	</script>

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
 <div class="formtitle"><span>添加房间</span></div>
  <div id="usual1" class="usual">
   <div id="tab1" class="tabson">
   
   <form id="formAdd" method="post" action="addroom.s" >
   
   <ul class="forminfo">
	   <li> 
	   <label>客房编号<b>*</b></label>
	   <div class="vocation">
	   <input type="text" name="roomnumber" id="roomNumber" onblur="myblurCheckRoomNumber();"    class="dfinput" placeholder="请填写房间号,如：3302"  style="width:344px;" />
	   </div> 
	   <span id="roomNumberSpan"></span>
	   <br/>
	   </li>
       
	   <li> 
	   <label>客房价格<b>*</b></label>
	   <div class="vocation">
	   <input type="text" name="price" id="price" onblur="myblurCheckPrice();"  class="dfinput" placeholder="输入房间价格，如108元/天"  style="width:344px;"/>
	   </div>
	   <span id="priceSpan">&nbsp;</span>    
	   </li>
   
	   <li> 
	   <label >客房类型<b>*</b></label>
	   <div class="vocation" >
	   <select  class="dfinput"  name="roomtype"  id="select" style="opacity:1; width:200px; height:35px;" >
	   <option >请选择</option>
	   <c:forEach items="${roomtype1}" var="rs">
	   <option value="${rs.id}">${rs.type}</option>
	   </c:forEach>  
	   </select>   
	   </div> 
	   <br/>  	     
	   </li>
	    
	   <li> 
	   <label>房间押金<b>*</b></label>
	   <div class="vocation">
	   <input type="text" name="deposit" id="deposit"  onblur="myblurCheckDeposit();" class="dfinput" placeholder="输入押金金额"  style="width:344px;" />
	   </div> 
	   <span id="depositSpan">&nbsp;</span>  
	   </li>
	    
	   <li> 
	   <label >客房状态<b>*</b></label>
	   <div class="vocation">
	   <select style="opacity:1; width:200px; height:35px;"  class="dfinput" name="status" id="select2"  >
	   <option value="" >请选择</option>
	   <option value="1">可入住</option>
	   <option value="3">待清理</option>
	   <option value="4">停用</option>
	   </select>  
	   </div>
	     <br/>
	     <br/>
	     <br/>
	   </li>
	              
   <li>
     <label>&nbsp;</label>
     <input name="" type="submit" class="btn" value="添加"/>
   </li>
   
   </ul> 
     
    </form>  
    
   </div>    
  </div> 
</div>

</body>
</html>
