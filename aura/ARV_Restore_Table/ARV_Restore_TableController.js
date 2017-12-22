({
    doInit: function(component, event, helper) {        
        //helper.getRestores(component, event, helper);
    },
    calculateWidth : function(component, event, helper) {
            var childObj = event.target
            var parObj = childObj.parentNode;
            var count = 1;
            //parent element traversing to get the TH
            while(parObj.tagName != 'TH') {
                parObj = parObj.parentNode;
                count++;
            }
            console.log('final tag Name'+parObj.tagName);
            //to get the position from the left for storing the position from where user started to drag
            var mouseStart=event.clientX; 
            component.set("v.mouseStart",mouseStart);
            component.set("v.oldWidth",parObj.offsetWidth);
    },     
    setNewWidth : function(component, event, helper) {
            var childObj = event.target
            var parObj = childObj.parentNode;
            var count = 1;
            //parent element traversing to get the TH
            while(parObj.tagName != 'TH') {
                parObj = parObj.parentNode;
                count++;
            }
            var mouseStart = component.get("v.mouseStart");
            var oldWidth = component.get("v.oldWidth");
            //To calculate the new width of the column
            var newWidth = event.clientX- parseFloat(mouseStart)+parseFloat(oldWidth);
            parObj.style.width = newWidth+'px';//assign new width to column
    },
    navigateToActivityObject : function(component, event, helper) {
        var sfOrgId = component.get("v.sfOrgId");
        var restoreID = event.target.id;
        var cmpEvent = component.getEvent("restoreObject");   
        cmpEvent.setParams({
            "sfOrgId":sfOrgId,
            "restoreID":restoreID
        });
      	cmpEvent.fire();
	},
    viewLog : function(component, event, helper) {
        helper.previewLog(component, event, helper);
    },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "False"  
      component.set("v.isOpen", false);      
   }
})