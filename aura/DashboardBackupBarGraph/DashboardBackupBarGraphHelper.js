({
	 graphReload :  function(component){
     /*    if(chart!=null)
             chart.destroy();*/
        var dataPack1 = component.get("v.data1");
        var dataPack2 = component.get("v.data2"); 
        var dateSets = [];
         var labelNames =[];
         debugger;
         if(component.get("v.isStacked")==true)
         {
             labelNames = ["May 1", "May 2", "May 3", "May 4", "May 5"]
            dateSets = [
                    {
                        label: 'Dev',
                        data: dataPack1,
                                    backgroundColor: "#17325d"
                    },
                    {
                        label: 'Integration',
                        data: dataPack2,
                        backgroundColor: "#02a0e2"
                    }
            ];
         }
         else
         {  
             labelNames =['Dev1', 'Dev2', 'Integration', 'Production', 'QA'];
             dateSets =   [{
                label: 'Running',
                data: dataPack1,
                     backgroundColor: [
                          'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
                     ]
       			 },              
                {
                    label:"",
                    data: dataPack2,
                     backgroundColor: [
                              'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)'
                         ]
                }
        		]
         }
    var dates = labelNames;
        var ctx = component.find("chart");
        var chart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: dates,
        datasets: dateSets
    },
    options: {
        scales: {
          xAxes: [{ 
          	stacked: true
            }],
          yAxes: [{ 
          	stacked: true
     				}
            ]
        }
    } 
    });

     }
})