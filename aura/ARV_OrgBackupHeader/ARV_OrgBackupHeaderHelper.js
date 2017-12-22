({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    getSampleJSON : function(component){
        var action = component.get("c.getOrgsList");
        var userid = '';
         action.setParams({ 
            "userid" : userid
         });
        action.setCallback(this, function(response) {
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component)
    {
        alert('in dolayout:'+response.getReturnValue());
        	//var jsonData = JSON.parse(response.getReturnValue());
        var jsonData = response.getReturnValue();
        var objectArray =[];
        for(var j=0;j<jsonData.length;j++)
        {	
            var obje = jsonData[j];
            objectArray.push({"label" : obje["label"]});
		}
        component.set("v.orgData",objectArray);
        console.log(objectArray);
        //  component.set("v.orgData",jsonData);
 	}
})