<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结账退房</title>
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
    
    
    function getNowFormatDate() {
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
    return currentdate;
}
function checkouttime(){
		$("#out").val(getNowFormatDate());
	}
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
	
	checkouttime();
	//时间自动变化
	window.setInterval("checkouttime()", 1000);
	
	$("#roomnumber").change(function(){
		var $roomnumber=$(this).val();
		$.getJSON("selectCheckwithInRoomBynumber.s",{"roomnumber":$roomnumber},function(data){
				$("#name").val(data.username);
				$("#price").val(data.room.price);
				$("#yajin").val(data.room.deposit);
				$("#date1").val(data.strIndate);
		});
	});
	$("#form1").submit(function(){
	var reg=/^\d+$/;
	var $qi=$("#qita").val();
		if($("#roomnumber").val()==0||!reg.test($qi)){
			alert("请正确填写信息");
			return false;
		}else{
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
    <li><a href="#">结账退房</a></li>
  </ul>
</div>
<div class="formbody">
  <div class="formtitle"><span>消费信息</span></div>
<div id="usual1" class="usual">
  <div id="tab1" class="tabson">
  <form action="checkoutroom.s" method="post" id="form1">
    <ul class="forminfo">
      <li>
        <label>房间号<b>*</b></label>
        <div class="vocation"> 
          <!--   <input name="" type="text" class="dfinput" value="请填写单位名称"  style="width:518px;"/>-->
          <select class="select1"  id="roomnumber"   name="roomnumber">
            <option value="0"  >请选择房间</option>
            <c:forEach items="${checks }" var="c">
            	<option value="${c.roomnumber }">${c.roomnumber }</option>
            </c:forEach>
          </select>
        </div>
      </li>
      <li  style="margin-top:20px;"> 
        <label for="name" >客人姓名<b>*</b></label>
        <div class="vocation">
          <input readonly="readonly" name="name"  id="name" type="text" class="dfinput" value="客户姓名"  style="width:344px;"/>
        </div>
      </li>
      <br /> <br />
      <li>
        <label for="price" style="cursor:pointer" >单价<b>*</b></label>
        <div class="vocation">
          <input readonly="readonly" name="price" id="price" class="dfinput" value=""  style="width:344px;"/>
        </div>
      </li> <br />
      <li>
        <label for="yajin" style="cursor:pointer" >押金<b>*</b></label>
        <div class="vocation">
          <input readonly="readonly" name="yajin"  id="yajin" type="text" class="dfinput" value="押金"  style="width:344px;"/>
        </div>
      </li> <br />
       <li>
        <label for="qita" style="cursor:pointer" >其他消费<b>*</b></label>
        <div class="vocation">
          <input name="qita"  id="qita" type="text" class="dfinput" value="0"  style="width:344px;"/>
        </div>
      </li> <br />
      <li>
        <label for="date1" style="cursor:pointer" >入住时间<b>*</b></label>
        <div class="vocation">
          <input readonly="readonly" name="date1"  id="date1" class="dfinput" value=""  style="width:344px;"/>
        </div>
      </li> <br />
      <li>
        <label for="Calendar" style="cursor:pointer" >退房时间<b>*</b></label>
        <div class="vocation">
          <input type="text" name="date2" class="dfinput" id="out"   style="width:344px;" />
        </div> <br />
      </li>
      <li>
        <label>&nbsp;</label>
        <input name="" type="submit" class="btn" value="提交" />
      </li>
    </ul>
    </form>
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
</body>
</html>
