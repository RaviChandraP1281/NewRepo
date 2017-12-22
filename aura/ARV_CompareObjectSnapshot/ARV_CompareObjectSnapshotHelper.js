({
	compareCols : function(component, event, helper, i, f, colName) {
		if(f != '' && (f == colName) ){
            if(i==0){
                component.set("v.Colname0", colName);    
            }
            if(i==1){
                component.set("v.Colname1", colName);
            }
            if(i==2){
                component.set("v.Colname2", colName);
            }
            if(i==3){
                component.set("v.Colname3", colName);
            }
            if(i==4){
                component.set("v.Colname4", colName);                
            }    
        }
	}
})