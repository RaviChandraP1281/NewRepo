({
	doloadFieldSnapshot : function(component, event, helper) {
        debugger;
		var f = component.get("v.fieldSelected");
        var s = component.get("v.snapshotDetail");
        //alert(JSON.stringify(s));
        /*for(let i=0; i< s.length;i++){
            let col = s[i];
            alert(JSON.stringify(col));
        }*/
        
        var recordCols = component.get("v.recordColumns");
        var allFields = component.get("v.allFields");
        debugger;
        var cols=[];
        var allcols=[];
        if(recordCols != null && recordCols != 'undefined' && recordCols != ''){
            component.set("v.recordColumns", recordCols);
            component.set("v.allFields", allFields); 
            for(let i=0; i < recordCols.length; i++){
                let colName = recordCols[i];
                helper.compareCols(component, event, helper, i, f, colName);
            }
        }else{
            if(s[0] != null && s[0] != 'undefined'){
                var colNameList = s[0].ColumnName;
                for(let i=0; i < 5; i++){
                    let colName = colNameList[i];
                    cols.push(colName);
                    helper.compareCols(component, event, helper, i, f, colName);                               
                }
                for(let i=0; i < colNameList.length; i++){
                    allcols.push(colNameList[i]);
                }            
            }
            component.set("v.recordColumns", cols);
            component.set("v.allFields", allcols);
        }
        
	} 
})