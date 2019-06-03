<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" >



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
	
	$("#roomtype").change(function(){
	//$("#roomid option:eq(0)").val(3);
		//alert($("#roomid option:eq(0)").text());
		var $roomtype=$(this).val();
		$("#roomid").empty();
		$.getJSON("getAvaliableRoom.s",{"roomtype":$roomtype},function(data){
			//alert(data[0].roomnumber);
			//alert(data.length);
			var json=data;
			var html="";
			$("#roomid option:gt(0)").remove();
			$("#roomid").html("<option>请选择</option>;");
			for(var i=0;i<json.length;i++){
				html=html+'<option value="'+json[i].roomnumber+'">'+json[i].roomnumber+'</option>';
			}
			$("#roomid").append(html);
		});
	});
	
	//自动填充押金
	$("#roomid").change(function(){
		var $roomnumber=$(this).val();
		//alert($roomnumber);
		$.getJSON("selectByPrimaryKey.s",{"roomnumber":$roomnumber},function(data){
			$("[name='money']").val(data.deposit);
		});
	});
	
	$("#idcard").blur(function(){
		var $idcard=$(this).val();
		//alert($idcard);
		$.getJSON("selectVipByIdcard.s",{"idcard":$idcard},function(data){
			if(data==0){
				$("#checkuser").text("用户不存在，请先注册");
			}else{
				$("[name='username']").val(data.name);
				$("#checkuser").html("&nbsp;");
				//alert(data.name);
				$("[name='sex']").attr("checked",false);
				var $s=data.sex;
				//alert(data.sex);
				if($s=="男"){
				//alert($s);
					$("[value='男']").attr("checked",true);
				}
				if($s=="女"){
					$("[value='女']").attr("checked",true);
				}
				$("[name='phone']").val(data.phone);
				$("[name='vipid']").val(data.vipid);
				alet(data.vipid);
			}
		});
	});
	$("[type='submit']").click(function(){
	 var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var strMinutes=date.getMinutes();
    var strHour=date.getHours();
    var strSecond=date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (strHour >= 0 &&strHour <= 9) {
       strHour = "0" + strHour;
    }
    if (strSecond >= 0 &&strSecond <= 9) {
       strSecond = "0" + strSecond;
    }
    if (strMinutes >= 0 &&strMinutes <= 9) {
       strMinutes = "0" + strMinutes;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + strHour + seperator2 + strMinutes
            + seperator2 + strSecond;
	$("#checkintime").val(currentdate);
	});

	$("#form1").submit(function(){
		if($("#roomtype").val()==0||$("#roomid").val()==0||$("#idcard").val()==""||$("#username").val()==""){
			alert("请填写正确的信息");
			return false;
		}
		else{
			return true;
		}
	});
});
</script>
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">入住信息管理</a></li>
    <li><a href="#">添加入住信息</a></li>
  </ul>
</div>
<form action="insertCheckAndUpdateRoom.s" method="post" id="form1">
<div class="formbody">
  <div class="formtitle"><span>入住信息</span></div>
  <div id="usual1" class="usual">
    <div id="tab1" class="tabson">
      <ul class="forminfo">
       <li>     
          <label>房间类型<b>*</b></label>
          <div class="vocation"> 
          <!-- 加隐藏域 -->
          <input type="hidden" name="vipid" value=""/>
          <input  type="hidden" name="checkintime"  id="checkintime" value=""/>
          
          <select class="select1" id="roomtype">  
          <option value="0">请选择房间类型</option>
          <c:forEach items="${rooms }" var="r">
          		<option value="${r.roomtype }">${r.type }</option>
          </c:forEach>
            </select>
          </div>  
          <span style="color:red;font-size: 21px">  ${full } </span> 
        </li>        
        <li>
          <label>房间号<b>*</b></label>
          <div class="vocation"> 
            <select class="select1"  name="roomnumber" id="roomid" >
            <option selected="selected" value="0" id="option0">请选择</option>
            </select>
          </div>
        </li>
        <br />
           <li>
          <label for="name" >身份证号码<b>*</b></label>
          <div class="vocation">
            <input name="idcard"  id="idcard" type="text" class="dfinput" placeholder="请填写客户身份证号码"  style="width:344px;"/>
          </div>
          	<span style="color:red;font-size: 21px" id="checkuser">&nbsp; </span>
        </li>
       
        
        <li  style="margin-top:20px;">
          <label for="name" >客人姓名<b>*</b></label>
          <div class="vocation">
            <input readonly="readonly" name="username"  id="username" type="text" class="dfinput" placeholder="请填写客户姓名"  style="width:344px;"/>
          </div>       	    
        </li>
        <br />
        <li>
          <label for="sex">性别<b>*</b></label>
           <div class="vocation"  style="padding-top: 10px;">
          <input readonly="readonly" name="sex" type="radio" value="男" checked="checked" />
          男&nbsp;&nbsp;&nbsp;&nbsp;
          <input readonly="readonly" name="sex" type="radio" value="女"    />
          女
          </div>
        </li>
        <br />

        <li>
          <label for="name" >手机号码<b>*</b></label>
          <div class="vocation">
            <input readonly="readonly" name="phone" type="text" class="dfinput" placeholder="请填写客户手机号码"  style="width:344px;"/>
          </div>
        </li>
        <br />
        <li>
          <label for="name" >押金<b>*</b></label>
          <div class="vocation">
            <input readonly="readonly" name="money" type="text" class="dfinput" placeholder="输入押金金额"  style="width:344px;"/>
          </div>
        </li>
        <br />
        <li>
          <label for="date" >入住时间<b>*</b></label>
          <div class="vocation">
            <input type="text"  class="laydate-icon span1-1" id="Calendar" style="width:324px; height:30px; line-height:28px; text-indent:10px; "/>
          </div>
        </li>
        <br />
        <li>
          <label>&nbsp;</label>
          <input name="" type="submit" class="btn" value="入住"/>
        </li>
      </ul>
    </div>
  </div>
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

</form>
</body>
</html>
