({
	checkAll:function(checkboxes, target){
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