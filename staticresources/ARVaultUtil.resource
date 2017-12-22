window.arv = (function() {
    return {
	setUIChanges:function(component,helper){
	  var a = component.getElement();
	  debugger;
	  a.setAttribute("class","");
	},
  	NaNShouldZero:function(val){
          return (isNaN(val)?0:val);
    },
    searchInTable: function(component, event, helper) {
          var array=component.get("v.resultCriteria");
          var top=[],j=0;
          let input = event.getSource().get("v.value");
          for(let i=0;i<array.length;i++){
            let c = arv.containsRegex(array[i], input);
            if(c>-1)
            top[j++]=array[i];
          }
          let max=component.get("v.PAGE_MAX_SIZE");
          component.set("v.searchResultCriteria",top);  
          component.set("v.topResultCriteria",top.slice(0, max));  
          component.set("v.page",1);
      },
    sortTable: function(component, event, helper) {
          var array=[];
           let input = component.find("quickfind").get("v.value");
             if(input!=null && input!=undefined && input.length>0)
               array=component.get("v.searchResultCriteria");
             else
               array=component.get("v.resultCriteria");
          var a=event.target.getAttribute("id");
          debugger;
          var sortType=event.target.getAttribute("name");
          var isAsc=false;
          if(sortType=="asc"){
             isAsc=true;
             event.target.setAttribute("name","desc");
          }
          else{
             isAsc=false; 
             event.target.setAttribute("name","asc");
          }
          array.sort(arv.GetSortOrder(a,isAsc));
          component.set("v.searchResultCriteria",array);
          let max=component.get("v.PAGE_MAX_SIZE");
          component.set("v.topResultCriteria",array.slice(0, max));
          component.set("v.page",1);
      },
    sortTable: function(component, event, helper, Column) {
          var array=[];
           let input = component.find("quickfind").get("v.value");
             if(input!=null && input!=undefined && input.length>0)
               array=component.get("v.searchResultCriteria");
             else
               array=component.get("v.resultCriteria");
          var a=Column;
          var sortType=event.target.getAttribute("name");
          var isAsc=false;
          if(sortType=="asc"){
             isAsc=true;
             event.target.setAttribute("name","desc");
          }
          else{
             isAsc=false; 
             event.target.setAttribute("name","asc");
          }
          array.sort(arv.GetSortOrder(a,isAsc));
          component.set("v.searchResultCriteria",array);
          let max=component.get("v.PAGE_MAX_SIZE");
          component.set("v.topResultCriteria",array.slice(0, max));
          component.set("v.page",1);
      },
    rightMove: function(component, event, helper) {
           let page=component.get("v.page");
           let array=[];
          let input = component.find("quickfind").get("v.value");
           if(input!=null && input!=undefined && input.length>0)
             array=component.get("v.searchResultCriteria");
           else
             array=component.get("v.resultCriteria");
		   	  let max=component.get("v.PAGE_MAX_SIZE");
		   var totalpages=1;
		  if(array.length>max)
		  {
			  totalpages=parseInt(array.length/max)+1;
		  }
		  component.set("v.totalpages",totalpages);
          if(page<(array.length/max)){
           let startIndex =max*page;
           max = (startIndex+max);
           component.set("v.topResultCriteria",array.slice(startIndex, max));
           ++page;
          component.set("v.page",page);
          }
    },
	recent: function(component, event, helper) {
			 
          let array=[];
          let input = component.find("quickfind").get("v.value");
           if(input!=null && input!=undefined && input.length>0)
             array=component.get("v.searchResultCriteria");
           else
             array=component.get("v.resultCriteria");
		  let max=component.get("v.PAGE_MAX_SIZE");
		   var totalpages=1;
		  if(array.length>max)
		  {
			  totalpages=parseInt(array.length/max)+1;
		  }
		  component.set("v.totalpages",totalpages);
           component.set("v.topResultCriteria",array.slice(0, max));
          component.set("v.page","1");
    },
	 old: function(component, event, helper) {	  
	
           let array=[];
          let input = component.find("quickfind").get("v.value");
           if(input!=null && input!=undefined && input.length>0)
             array=component.get("v.searchResultCriteria");
           else
             array=component.get("v.resultCriteria");
		  let max=component.get("v.PAGE_MAX_SIZE");
		   var totalpages=1;
		  if(array.length>max)
		  {
			  totalpages=parseInt(array.length/max)+1;
		  }
		  component.set("v.totalpages",totalpages);
		   let startIndex=0;
		   if(array.length>0){
			  if(array.length>max){
			   startIndex =array.length-max;
			   }
			   else{
				startIndex =0;
			   }
			   max = (startIndex+max);
			   component.set("v.topResultCriteria",array.slice(startIndex, max));
			   
			  component.set("v.page",totalpages);
		   }
    },
    leftMove: function(component, event, helper){
             let page=component.get("v.page");
             let input = component.find("quickfind").get("v.value");
             let array=[];
             if(input!=null && input!=undefined && input.length>0)
               array=component.get("v.searchResultCriteria");
             else
               array=component.get("v.resultCriteria");
             if(page>1){
             	  let max=component.get("v.PAGE_MAX_SIZE");
		   var totalpages=1;
		  if(array.length>max)
		  {
			  totalpages=parseInt(array.length/max)+1;
		  }
		  component.set("v.totalpages",totalpages);
             let startIndex =max*(page-2);
             max = (startIndex+max);
             component.set("v.topResultCriteria",array.slice(startIndex, max));
             --page;
            component.set("v.page",page);
          }
    },
    GetSortOrder : function(prop, isAsc) {
          return function(a, b) {  
              if (a[prop] > b[prop]) {
                  if(isAsc)
                   return 1;
                  else
                   return -1;
              } else if (a[prop] < b[prop]) {  
                  if(isAsc)
                   return -1;
                  else
                   return 1;
              }  
              return 0;  
          }  
    },
    containsRegex : function(a, regex){
        for(var i in a) {
            let strA = ""+a[i];
            strA=strA.toLowerCase();
            regex= regex.toLowerCase();
            if(strA.search(regex) > -1){
              return 1;
          }
        }
        return -1;
    },
	getDuration : function(millis){
		var dur = {};
		var units = [
			{label:"ms",    mod:1000},
			{label:"s",   mod:60},
			{label:"m",   mod:60},
			{label:"h",     mod:24},
			{label:"d",      mod:31}
		];
		units.forEach(function(u){
			millis = (millis - (dur[u.label] = (millis % u.mod))) / u.mod;
		});
		var nonZero = function(u){ return dur[u.label]; };
		dur.toString = function(){
			return units
				.reverse()
				.filter(nonZero)
				.map(function(u){
					return dur[u.label] + "" + (dur[u.label]==1?u.label.slice(0,-1):u.label);
				})
				.join(' ');
		};
		return dur;
	},
    historyGraph: function(component, helper, divId, data, page) {
        var div =component.find(divId);
        if(div!=undefined)
        {
        let hasHideClass = false;
        if($A.util.hasClass(div,"slds-hide"))
        {
          $A.util.removeClass(div,"slds-hide"); 
            hasHideClass=true;
        }
        component.find(divId).set("v.body",[]);
        var a = component.find(divId).getElement();
        a.innerHTML ="";
        var  margin = {top: 20, right: 0, bottom: 40, left: 50},
        width = a.offsetWidth-70,
        height = 300;
        var svg  = d3.select(a)
            .append("div")
            .classed("svg-container", true) 
            .append("svg")
            .attr("preserveAspectRatio", "xMinYMin meet")
            .classed("svg-content-responsive", true)
            .attr("id", "chart")
            .attr("width", width+60)
            .attr("height", height+60)
            .style("font-size","20px");
         svg.selectAll(".xaxis text")  
          .attr("transform", function(d) {
            return "rotate(-45)";
         });
        svg.append("text")
            .attr("text-anchor", "middle") 
            .attr("transform", "translate("+ (20) +","+(height/2)+")rotate(-90)")  
            .text("Records");

        svg.append("text")
            .attr("text-anchor", "middle") 
            .attr("transform", "translate("+ (width/2) +","+(height+50)+")")
            .text(function(d){ 
			 if(page=="backup")
				return "Backups";
			 else
				 return "Restores";
			});
            
    var x = d3.scaleBand().rangeRound([0, width]).padding(0.1),
         y2 = d3.scaleLinear().rangeRound([height, 0]),
        y = d3.scaleLinear().rangeRound([height, 0]);
    var colours = d3.scaleOrdinal()
        .range(["#6F257F", "#CA0D59","#235322", "#CAffff","#6F6666", "#D59D59","#6F6F6F", "#0D5CA9","#CACACA", "#A0A0A0","#7F7F7F", "#0D0D59","#25257F", "#A0D559","#57F6F2", "#0DCA59"]);

    var g = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")"); 


    x.domain(data.map(function(d) { 
      if(page=="backup") 
        return d.backupId+"_sd";
      else 
        return d.idRestore; 
    }));
    y.domain([0, d3.max(data, function(d) { 
      return arv.NaNShouldZero(d.successCount); 
    })]);
    y2.domain([0, d3.max(data, function(d) { 
      let fail= arv.NaNShouldZero(d.nbrTotRecords);
      return fail; 
    })]);
    g.append("g")
        .attr("class", "axis axis--x")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

    g.append("g")
        .attr("class", "axis axis--y")
        .call(d3.axisLeft(y).ticks(5)
              .tickFormat(function(d) 
                          { 
                              if(d<1000)
                                  return parseInt(d) ; 
                              else if(d>1000)
                               return parseInt(d / 1000) + "K"; 
                          })
              .tickSizeInner([-width]))
      .append("text")
        .attr("transform", "rotate(-45)")
        .attr("y", 6)
        .attr("dy", "0.71em")
        .attr("text-anchor", "end")
        .attr("fill", "#49a5dd");
  g.selectAll(".bar2")
        .data(data)
        .enter().append("rect")
      .attr("class","bar2")
        .attr("x", function(d) { 
         let id;
        if(page=="backup") 
         id=d.backupId+"_sd";
        else 
         id=d.idRestore; 
         if(x.bandwidth()>50)
           return x(id)+(x.bandwidth()/2)-25;  
         else
            return x(id) ; 
        })
        .attr("y", function(d) { 
            let fail= arv.NaNShouldZero(d.nbrTotRecords);
            return y2(fail); 
        })
        .attr("width", d3.min([x.bandwidth(), 50]))
        .attr("height", function(d) { 
            let fail= arv.NaNShouldZero(d.nbrTotRecords);
            fail=height - y2(fail);
            return fail; 
        })
        .attr("fill", "#5d6971")
        .on('mouseover', function(d){
      if(page=="backup") 
           component.set("v.backupInfo", d);
     else
        component.set("v.restoreInfo", d);
       });
    g.selectAll(".bar")
        .data(data)
        .enter().append("rect")
        .attr("class","bar")
         .attr("x", function(d) { 
		 debugger;
                let id;
				if(page=="backup") 
				 id=d.backupId+"_sd";
				else 
				 id=d.idRestore; 
				 if(x.bandwidth()>50)
					return x(id)+(x.bandwidth()/2)-25;  
				 else
					return x(id) ; 
         })
        .attr("y",  function(d) {return y(arv.NaNShouldZero(d.successCount))})
        .attr("width", d3.min([x.bandwidth(), 50]))
        .attr("height", function(d) { 
          let fail =height - y(arv.NaNShouldZero(d.successCount));
          return fail;   
        })
      .attr("fill", function(d) { return "#49a5dd"; })
         .on('mouseover', function(d){
       if(page=="backup") 
        component.set("v.backupInfo", d);
         else
           component.set("v.restoreInfo", d);
        });
            if(hasHideClass)
            {
                $A.util.addClass(div,"slds-hide");
            }
        }
     }
	};
}());