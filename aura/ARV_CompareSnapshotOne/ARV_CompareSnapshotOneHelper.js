({
	getObjectsList : function(component, event, helper) {
    	var action = component.get("c.getSfObjects");
    	var sfOrgID = '';
    	action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId"),
         });
        action.setCallback(this, function(response) {
            component.set("v.objList",response.getReturnValue()); 
        });
        $A.enqueueAction(action);
        
	},
    getFieldsList : function(component, event, helper) {
    	var action = component.get("c.getSfFields");
    	var sfOrgID = '';
    	action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId"),
            "sfObjName" : component.get("v.objSelected")
         });
        action.setCallback(this, function(response) {
            component.set("v.fieldList",response.getReturnValue()); 
        });
        $A.enqueueAction(action);
        
	},
    showPopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.removeClass(modal, className + 'hide');
        $A.util.addClass(modal, className + 'open');
    },
    hidePopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.addClass(modal, className+'hide');
        $A.util.removeClass(modal, className+'open');
        component.set("v.body", "");
    }
})