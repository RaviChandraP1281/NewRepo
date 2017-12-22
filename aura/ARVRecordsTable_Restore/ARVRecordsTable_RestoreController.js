({
	checkAllCheckboxes : function(component, event, helper) {
         var target = event.getSource();
         var checkboxes = component.find("backedupRecords");
         helper.checkAll(checkboxes, target);
    },
})