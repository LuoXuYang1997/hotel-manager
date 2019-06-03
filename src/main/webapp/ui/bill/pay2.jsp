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
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	$(function(){
	//$("#test").click(function(){
	
	var payamount=$("[name='payamount']").val();
	var deposit=$("[name='deposit']").val();
	var balance=$("[name='balance']").val();
	var pay;
	if(deposit-payamount>0){
		pay=deposit-payamount;
		$("#payout").html("您一共消费"+payamount+"元，您的押金有"+deposit+"元"+"<br>我们将找您"+pay+"元");
	}
	else{
	pay=payamount-deposit;
		$("#payout").html("您一共消费"+payamount+"元，您的押金有"+deposit+"元"+"<br>您需要付款"+pay+"元");
	}		
	//});
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
  <form action="billpayout.s" method="post" id="form0">
    <ul class="forminfo">
      <li  style="margin-top:20px;"> 
        <label for="name" >房间号<b>*</b></label>
        <div class="vocation">
          <input name="roomnumber"  readonly="readonly" type="text" class="dfinput" value="${bill.roomnumber}"  style="width:344px;"/>
        </div>
      </li>
      <br /> 
      <li >
        <label for="guestname" style="cursor:pointer" >会员姓名<b>*</b></label>
        <div class="vocation">
          <input name="guestname"  readonly="readonly"  class="dfinput" value="${bill.guestname }"  style="width:344px;"/>
        </div>
      </li> <br />
      <li>
        <label for="rate" style="cursor:pointer" >VIP折扣<b>*</b></label>
        <div class="vocation">
          <input name="rate"   readonly="readonly"  class="dfinput" value="${rate}"  style="width:344px;"/>
        </div>
      </li> <br /> <li>
        <label for="payamount" style="cursor:pointer" >消费金额<b>*</b></label>
        <div class="vocation">
          <input name="payamount"   readonly="readonly"  class="dfinput" value="${bill.payamount }"  style="width:344px;"/>
        </div>
      </li> <br /> <li>
        <label for="deposit" style="cursor:pointer" >房间押金<b>*</b></label>
        <div class="vocation">
          <input name="deposit"  readonly="readonly"  class="dfinput" value="${deposit }"  style="width:344px;"/>
        </div>
      </li> <br /> <li>
        <label for="balance" style="cursor:pointer" >余额<b>*</b></label>
        <div class="vocation">
          <input name="balance"  readonly="readonly"  class="dfinput" value="${vip.balance }"  style="width:344px;"/>
        </div>
      </li><br /> 
      <input type="hidden"  name="id" value="${bill.id}"/>
      <input type="hidden" name="vipid"  value=${vip.vipid } />
      <li>
      	<div id="payout" style="color: red;font-size: 24px;"></div>
      </li>
        <input id="pay"   type="submit" class="btn" value="付款" />
      </li>
    </ul>
    </form>
  </div>
</div>

</div>
</body>
</html>
