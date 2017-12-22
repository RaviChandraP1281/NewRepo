({
	  openlist:function(component,event,helper){
       var options = component.get("v.orgData");
         var el = component.find("ds").get("v.value");
        var newarr = [];
        if(el!="" && el!=undefined && el!=null){
        for(var i=0;i<options.length;i++){
            let label = options[i].nmLable;
            label=label.toLowerCase();
            if(label.indexOf(el.toLowerCase())>=0){
                newarr.push(options[i]);
            }
        }
          component.set("v.orgDataReplica", newarr);  
        }
        else
        {
             for(var i=0;i<options.length;i++){
            let label = options[i].nmLable;
            label=label.toLowerCase();
                  newarr.push(options[i]);
             }
            component.set("v.orgDataReplica", newarr);  
        }
        var div =component.find("dsf");
        $A.util.addClass(div, "slds-is-open");  
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
          var jsonData = response.getReturnValue();
          var objectArray=[];
      	  objectArray=jsonData;
            if(objectArray.length>0)
            {
                component.set("v.sfOrgId", objectArray[0].idSforg);  
                 var cmpEvent = component.getEvent("orgChangeEvent");
                    cmpEvent.setParams({
                       "sfOrgId": objectArray[0].idSforg
                    });
                    cmpEvent.fire();
            }
          component.set("v.orgData",objectArray);
        if(objectArray!=null && objectArray!=undefined && objectArray.length>0)
        {
              component.set("v.selectedOrgName",objectArray[0].nmLable);
        }
 	}
})