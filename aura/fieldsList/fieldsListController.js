({
	checkAllCheckboxes : function(component, event, helper) {
        var target = event.getSource();
         var checkboxes = component.find("Mcheckbox");
         if(target.get("v.checked") == true){
        
        for (var i = 0; i < checkboxes.length; i++){
            checkboxes[i].set("v.checked",true);
        }
         }else{
             for (var i = 0; i < checkboxes.length; i++){
            checkboxes[i].set("v.checked",false);
        }
         }
    }
})