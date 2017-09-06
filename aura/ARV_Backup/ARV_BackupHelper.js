({
    orgIdChanged:function(component, event, helper) {
        var sfOrgId =event.getParam("sfOrgId");
        if(sfOrgId==undefined || sfOrgId=="" || sfOrgId==null)
        {
            sfOrgId= component.get("v.sfOrgId");
        }
        component.set("v.sfOrgId", sfOrgId);  
        helper.getBackupActivity(component, helper, sfOrgId);
    },
    toggleHide:function(component, id){
  		var div = component.find(id);
        $A.util.toggleClass(div, "slds-hide");
 	},
    getBackupActivity : function(component, helper, sfOrgID){
        var action = component.get("c.getListOfBackups");
        action.setParams({ "sfOrgID" : sfOrgID});
		action.setCallback(this, function(response) {
            this.getBackupResponse(component,helper, response);
        });
        $A.enqueueAction(action);
    },
    historyGraph : function(component, divId, data) {
        debugger;
        var div =component.find(divId);
        let hasHideClass = false;
        if($A.util.hasClass(div,"slds-hide"))
        {
       	 	$A.util.removeClass(div,"slds-hide"); 
            hasHideClass=true;
        }
   	    component.find(divId).set("v.body",[]);
        var a = component.find(divId).getElement();
        a.innerHTML ="";
        var  margin = {top: 20, right: 20, bottom: 30, left: 50},
        width = a.offsetWidth,
        height = 400;
        var svg  = d3.select(a)
            .append("div")
  		    .classed("svg-container", true) 
            .append("svg")
            .attr("preserveAspectRatio", "xMinYMin meet")
   			.attr("viewBox", "0 0 "+(width-100)+" "+(height+50))
  			.classed("svg-content-responsive", true)
            .attr("id", "chart")
            .attr("width", width)
            .attr("height", height);

    var x = d3.scaleBand().rangeRound([0, width]).padding(0.1),
        y = d3.scaleLinear().rangeRound([height, 0]);
  
    var colours = d3.scaleOrdinal()
        .range(["#6F257F", "#CA0D59","#235322", "#CAffff","#6F6666", "#D59D59","#6F6F6F", "#0D5CA9","#CACACA", "#A0A0A0","#7F7F7F", "#0D0D59","#25257F", "#A0D559","#57F6F2", "#0DCA59"]);

    var g = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


    x.domain(data.map(function(d) { return d.Org; }));
    y.domain([0, d3.max(data, function(d) { return d.sucess; })]);

    g.append("g")
        .attr("class", "axis axis--x")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

    g.append("g")
      	.attr("class", "axis axis--y")
      	.call(d3.axisLeft(y).ticks(5).tickFormat(function(d) { return parseInt(d / 1000) + "K"; }).tickSizeInner([-width]))
      .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", "0.71em")
        .attr("text-anchor", "end")
        .attr("fill", "#5D6971")
        .text("ddddddd");
	g.selectAll(".bar2")
      	.data(data)
        .enter().append("rect")
        .attr("x", function(d) { return x(d.Org); })
        .attr("y", function(d) { return y(d.sucess+d.failed); })
        .attr("width", x.bandwidth())
        .attr("height", function(d) { return height - y(d.sucess+d.failed); })
        .attr("fill", function(d) { return "#49a5dd"; })
        .on("mousemove", function(d){
          
        }).on("mouseout", function(d){});
    g.selectAll(".bar")
      	.data(data)
        .enter().append("rect")
        .attr("x", function(d) { return x(d.Org); })
        .attr("y", function(d) { return y(d.sucess); })
        .attr("width", x.bandwidth())
        .attr("height", function(d) { return height - y(d.sucess); })
        .attr("fill", function(d) { return "#16325c"; })
        .on("mousemove", function(d){
          
        }).on("mouseout", function(d){});
        if(hasHideClass)
        {
        	$A.util.addClass(div,"slds-hide");
        }
	},
    InprogressGraph : function(component, divId, data) {
        var div =component.find(divId);
        let hasHideClass = false;
        if($A.util.hasClass(div,"slds-hide"))
        {
       	 	$A.util.removeClass(div,"slds-hide"); 
            hasHideClass=true;
        }      
      component.find(divId).set("v.body",[]);
      var a = component.find(divId).getElement();
      a.innerHTML ="";
      var  margin = {top: 20, right: 20, bottom: 30, left: 50},
      width = a.offsetWidth,
      height = 400;
        debugger;
		var svg  = d3.select(a)
            .append("div")
  		    .classed("svg-container", true) 
            .append("svg")
            .attr("preserveAspectRatio", "xMinYMin meet")
   			.attr("viewBox", "0 0 "+(width-100)+" "+(height+50))
  			.classed("svg-content-responsive", true)
            .attr("id", "chart")
            .attr("width", width)
            .attr("height", height);

    var x = d3.scaleBand().rangeRound([0, width]).padding(0.1),
        y = d3.scaleLinear().rangeRound([height, 0]);
      
    var colours = d3.scaleOrdinal()
        .range(["#62b7ed","#f1a932","#ef3b51", "#7e8be4","#4bca81"]);

    var g = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    x.domain(data.map(function(d) { return d.Org; }));
    y.domain([0, d3.max(data, function(d) { return d.sucess; })]);

    g.append("g")
        .attr("class", "axis axis--x")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

    g.append("g")
      	.attr("class", "axis axis--y")
      	.call(d3.axisLeft(y).ticks(5).tickFormat(function(d) { return parseInt(d / 1000) + "K"; }).tickSizeInner([-width]))
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", "0.71em")
        .attr("text-anchor", "end")
        .attr("fill", "#5D6971")
        .text("In-Progress Backups");

    g.selectAll(".bar")
      	.data(data)
        .enter().append("rect")
        .attr("x", function(d) { return x(d.Org); })
        .attr("y", function(d) { return y(d.sucess); })
        .attr("width", x.bandwidth())
        .attr("height", function(d) { return height - y(d.sucess); })
        .attr("fill", function(d) { return colours(d.Org); })
        .on("mousemove", function(d){        
        }).on("mouseout", function(d){
        
        
    		});
        if(hasHideClass)
        {
        	$A.util.addClass(div,"slds-hide");
            hasHideClass=false;
        }
	},
    getBackupResponse: function(component, helper, response) {
        var responseList = response.getReturnValue();
        let historyData = [];
        let inprogressData = [];
        let backupObjects =[];
        let inprogressObjects = [];
        debugger;
        for(let i=0,j=0,k=0; i<responseList.length;i++){
            if(responseList[i].objProcStatus=="COMPLETED"){
                console.log(backupObjects[j]);
                debugger;
                backupObjects[j] = responseList[i];
                historyData.push({
                    "Org" :backupObjects[j].backupId,
                    "sucess":backupObjects[j].nbrTotRecords,
                    "fail":0
                });
                j++;
            }
            else{
                inprogressObjects[k]= responseList[i];
                 inprogressData.push({
                    "Org" :backupObjects[k].backupId,
                    "sucess":backupObjects[k].nbrTotRecords,
                    "fail":0
                });
                k++;
            }
        }
        component.set("v.backupObjects",backupObjects);    
        component.set("v.inprogressObjects",inprogressObjects);   
		helper.historyGraph(component, "historyChartDiv", historyData);   
        helper.InprogressGraph(component, "inprogressChartDiv", inprogressData);
    },
    getOrgsList : function(component, helper) {
        helper.getOrgsListService(component,helper);
	},
    getOrgsListService : function(component,helper){
        var action = component.get("c.getOrgsList");
          action.setParams({ 
            "idUser" : "f939bec89dc549d9bb2a5ef164ac0eb5"
         });
        action.setCallback(this, function(response) {
            this.getOrgsListData(response, component,helper);
        });
        $A.enqueueAction(action);
    },
    getOrgsListData:function(response, component,helper){  	
        debugger;
          var jsonData = response.getReturnValue();
          var objectArray=[];
      	  objectArray=jsonData;
            if(objectArray.length>0)
            {
                component.set("v.sfOrgId", objectArray[1].idSforg);  
                helper.getBackupActivity(component, helper, objectArray[1].idSforg);
            }
          component.set("v.orgsList",objectArray);
 	}
})