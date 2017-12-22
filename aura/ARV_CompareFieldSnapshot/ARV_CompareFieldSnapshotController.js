({
	doloadFieldSnapshot : function(component, event, helper) {
        debugger;
		var f = component.get("v.fieldSelected");
        var s = component.get("v.snapshotDetail");
        var recordCols = component.get("v.recordColumns");
        var allFields = component.get("v.allFields");
        var cols=[];
        var allcols=[];
        if(s != null && s.length > 0){
            if(s[0] != null && s[0].length > 0){
                if(recordCols != null && recordCols != 'undefined' && recordCols != ''){
                    component.set("v.recordColumns", recordCols);
                    component.set("v.allFields", allFields); 
                    let colCount = recordCols.length;
                    component.set("v.colCount", colCount);    
                    for(let i=0; i < colCount; i++){
                        let colName = recordCols[i];
                        helper.compareCols(component, event, helper, i, f, colName);
                    }
                }    
            }else{
                component.set("v.recordDisplay", "There are no records for selected object");
            }
        }
                
        
        /*else{
            if(s[0] != null && s[0] != 'undefined'){
                var colNameList = s[0].ColumnName;
                if(colNameList != null && colNameList != 'undefined'){
                    if(colNameList.length > 4){
                        for(let i=0; i < 5; i++){
                            let colName = colNameList[i];
                            cols.push(colName);
                            helper.compareCols(component, event, helper, i, f, colName);                               
                        }
                        for(let i=0; i < colNameList.length; i++){
                            allcols.push(colNameList[i]);
                        }    
                    }
                }
                           
            }
            component.set("v.recordColumns", cols);
            component.set("v.allFields", allcols);
        }*/
        
	} 
})