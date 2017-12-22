({	
    firstSnapshotRemoved: function(component, event) {
       let obj= event.getParam("oldValue");
        debugger;
        try{
        if(obj!=null && obj!=undefined && obj!='undefined' && obj!='')
        {
            let backupId= obj.backupId;
            var radBack = component.find("radBackupID");
            for(let i=0;i<radBack.length;i++){
			var k=radBack[i];
                if(k.get("v.label")==backupId)
                {
                    component.set("v.radiobtnDisabled",false);
                    k.set("v.checked",false);
                    component.set("v.countofSnapshots", 1);
                    component.set("v.firstSelectedSnapID",'');
                }
            }           
        }
        }catch(e){
            
        }
    },
     secondSnapshotRemoved: function(component, event) {
         let obj= event.getParam("oldValue");
        debugger;
        try{
        if(obj!=null && obj!=undefined && obj!='undefined' && obj!='')
        {
            let backupId= obj.backupId;
            var radBack = component.find("radBackupID");
            for(let i=0;i<radBack.length;i++){
			var k=radBack[i];
                if(k.get("v.label")==backupId)
                {
                    component.set("v.radiobtnDisabled",false);
                    k.set("v.checked",false);
                    component.set("v.countofSnapshots", 2);
                    component.set("v.secondSelectedSnapID",'');
                }
            }
           
        }
        }catch(e){
            
        }
    },
    orgchange : function(component, event, helper) {
     	 component.set("v.countofSnapshots",1); 
         component.set("v.radiobtnDisabled",false);
    },
    selSnapshots: function(component, event, helper) {
        debugger;
        var value = event.getSource().get("v.value");
		var label = event.getSource().get("v.label");        
        component.set("v.radioLabelSelected", label);
        
        var fbackupID = component.get("v.firstSelectedSnapID");
        var sbackupID = component.get("v.secondSelectedSnapID");
       if(fbackupID != ''){
            if(label == fbackupID ){
                alert('You have selected same backup for compare. Please select another one');
            }else{
            	helper.showSnapshotOptions(component, event, helper, label, value);                
            }            
        }else{
            helper.showNextSnapshot(component, event, helper, label, value); 
            
        }                
    }
})