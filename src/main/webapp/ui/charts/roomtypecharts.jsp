<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'roomtypecharts.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script></head>
   <script language="javascript" type="text/javascript" src="echarts/echarts.js"></script>
   <link rel="stylesheet" href="charts/style.css" type="text/css"></link>
<script type="text/javascript" src="charts/amcharts.js"></script>
<script type="text/javascript" src="charts/pie.js"></script>
<script type="text/javascript" src="charts/serial.js"></script>
     
     <script>
     		$.ajaxSetup({
     			async:false
     		});
            var chart;
		
            var chartData ;
			
                
            AmCharts.ready(function () {
            $.getJSON("getRoomChart.s",null,function(data){
                	chartData=data;
                	
                });
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider =chartData;
                chart.categoryField = "year";
                chart.startDuration = 1;
                chart.plotAreaBorderColor = "#DADADA";
                chart.plotAreaBorderAlpha = 1;
                // this single line makes the chart a bar chart
                chart.rotate = true;

                // AXES
                // Category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridPosition = "start";
                categoryAxis.gridAlpha = 0.1;
                categoryAxis.axisAlpha = 0;

                // Value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 0;
                valueAxis.gridAlpha = 0.1;
                valueAxis.position = "top";
                chart.addValueAxis(valueAxis);

                // GRAPHS
                // first graph
                var graph1 = new AmCharts.AmGraph();
                graph1.type = "column";
                graph1.title = "房间数量";
                graph1.valueField = "income";
                graph1.balloonText = "Income:[[value]]";
                graph1.lineAlpha = 0;
                graph1.fillColors = "#ADD981";
                graph1.fillAlphas = 1;
                chart.addGraph(graph1);

                // second graph
                var graph2 = new AmCharts.AmGraph();
                graph2.type = "column";
            	    graph2.title = "不可入住房间数量";
                graph2.valueField = "expenses";
                graph2.balloonText = "Expenses:[[value]]";
                graph2.lineAlpha = 0;
                graph2.fillColors = "#81acd9";
                graph2.fillAlphas = 1;
                chart.addGraph(graph2);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                chart.addLegend(legend);

                chart.creditsPosition = "top-right";

                // WRITE
                chart.write("chartdiv");
            });
            
             var chart1;

            var chartData1;

            AmCharts.ready(function () {
            	$.getJSON("roomchartwithbill.s",null,function(data){
            		chartData1=data;
            	});
                // PIE CHART
                chart1 = new AmCharts.AmPieChart();

                // title of the chart
                chart1.addTitle("房间类型订单数量图", 16);

                chart1.dataProvider = chartData1;
                chart1.titleField = "roomtype";
                chart1.valueField = "billnumber";
                chart1.sequencedAnimation = true;
                chart1.startEffect = "elastic";
                chart1.innerRadius = "30%";
                chart1.startDuration = 2;
                chart1.labelRadius = 15;
                chart1.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // the following two lines makes the chart 3D
                chart1.depth3D = 10;
                chart1.angle = 15;
                // WRITE
                chart1.write("chartdiv1");
            });
        </script>


   
  <body>
    <div id="chartdiv"  style="height:600px;width:900px;float: left;"></div>
     <div id="chartdiv1" style="width:900px; height:600px;float: left;"></div>
  </body>
</html>
