({ searchInTable: function(component, event, helper) {
        var input, filter, table, tr, td, i;
         var table = component.find("ht").getElement();
          input = event.getSource().get("v.value");
          filter = input.toUpperCase();
          tr = table.getElementsByTagName("tr");
          for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
              if (tr[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
              } else {
                tr[i].style.display = "none";
              }
            }   
    },
	navigateToActivityObject : function(component, event, helper) {
        var sfOrgId = component.get("v.sfOrgId");
        var backupActivityID = event.target.id;
        var cmpEvent = component.getEvent("activityObjects");   
        cmpEvent.setParams({
            "sfOrgId":sfOrgId,
            "backupActivityID":backupActivityID
        });
      	cmpEvent.fire();
	}
})