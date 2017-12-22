({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    getSampleJSON : function(component){
        var action = component.get("c.getOrgsList");
        var userid = 'f939bec89dc549d9bb2a5ef164ac0eb5';
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
  		 // var jsonData = JSON.parse(response.getReturnValue());
          var jsonData = response.getReturnValue();
        var objectArray =[];
        for(var j=0;j<jsonData.length;j++)
        {	
            var obje = jsonData[j];
            objectArray.push({"nmLable" : obje["nmLable"], "idSforg" : obje["idSforg"]});
		}
        component.set("v.orgData",objectArray);
        alert('orgListhelper:'+objectArray);
         // component.set("v.orgData",jsonData);
 	}
})