({
	checkAllCheckboxes : function(component, event, helper) {
         var target = event.getSource();
         var checkboxes = component.find("fMcheckbox");
         if(target.get("v.checked") == true){
            for (var i = 0; i < checkboxes.length; i++){
                checkboxes[i].set("v.checked",true);
            }
         }else{
             for (var i = 0; i < checkboxes.length; i++){
            checkboxes[i].set("v.checked",false);
        }
         }
    },
    changed: function(component, event, helper) {
        debugger;
       var checked = event.target.checked;  
        alert(checked);
	}
})