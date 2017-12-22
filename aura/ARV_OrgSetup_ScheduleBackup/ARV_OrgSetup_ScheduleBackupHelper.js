({
    selectWeek:function(component, event, helper) {
          var week = component.find("week");
            for(let k=0;k<week.length;k++){
                debugger;
                let wName = week[k].get("v.value");
                if(wName == component.get("v.dayScd")){
                    week[k].set("v.checked", true);
                }
                else{
                    week[k].set("v.checked", false);
                }
            }
    },
	loadMinutes : function(component, event, helper) {
        var minutesObj = [];
        for(var k =0 ;k<60;k++){
            minutesObj.push(k);
        }
        component.set("v.minutesObj", minutesObj);
		/*v
		/*var getBObjects = component.get("c.getMinutes");
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	//alert(bObjects); 
            component.set("v.minutesObj", bObjects);
        });
        $A.enqueueAction(getBObjects); */
	},
    loadHours : function(component, event, helper) {
        
        var hoursObj = [];
        for(var k =0 ;k<12;k++){
            hoursObj.push(k);
        }
          component.set("v.hoursObj", hoursObj);
		/*var getBObjects = component.get("c.getHours");
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	//alert(bObjects); 
            component.set("v.hoursObj", bObjects);
        });
        $A.enqueueAction(getBObjects); */
	}
})