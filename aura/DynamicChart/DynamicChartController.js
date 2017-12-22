({
	afterScriptsLoaded : function(component, event, helper) 
    {
        debugger;
        var dataSet = component.get("v.data");
        var datesSet = component.get("v.dates");
        if(datesSet!=undefined && datesSet!=null){
            datesSet.reverse();
            dataSet.reverse();
        new Highcharts.Chart({
            chart: {
                paddingRight: 20,
                renderTo: component.find("chart").getElement(),
                type: component.get("v.chartType")
            },
             title: {
        text: 'No.of Records'
    },
            borderWidth:"0px",
    xAxis: {
        categories: datesSet,//['1-Oct-2017','2-Oct-2017','3-Oct-2017','4-Oct-2017','5-Oct-2017','6-Oct-2017','7-Oct-2017','8-Oct-2017','9-Oct-2017','10-Oct-2017','11-Oct-2017','12-Oct-2017'],
        title:{
            enabled:true,
            text:"Date"
        }
    },
   yAxis: {
        title:{
            enabled:true,
            text:"Records"
        }
    },
    tooltip: {
      enabled: true,
        formatter: function() {
        return 'Date :'+ this.x+'<br/> Records : '+ this.y;
      }
    },
    series: [{
         showInLegend: false,
        data: dataSet,//[29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
        zoneAxis: 'x',
        zones: [{
            value: 8
        }]
    }]
        });
            
        }
    }
})