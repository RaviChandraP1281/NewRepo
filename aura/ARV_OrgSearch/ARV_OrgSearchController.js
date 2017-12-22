({
    doInit:function (component, event, helper) {
        helper.getOrgsListService(component, helper);
    },
	orgDataChange:function (component, event, helper) {
        let orgData=component.get("v.orgData");
        component.set("v.orgDataReplica",orgData);
    },
    openlist:function (component, event, helper) {
         helper.openlist(component, event, helper);
    },
     changeOrg:function (component, event, helper) {
        component.set("v.isChageOrg", false);
        var hidden =component.find("hidden");
        $A.util.removeClass(hidden, "slds-hide");
        helper.openlist(component, event, helper);
	},
    closelistWithoutChange:function (component, event, helper) {
        var div =component.find("dsf");
        component.set("v.isChageOrg", true);
        $A.util.removeClass(div, "slds-is-open");
        var hidden =component.find("hidden");
        $A.util.addClass(hidden, "slds-hide");
    },
      closelist:function (component, event, helper) {
        var a =false;
        var div =component.find("dsf");
        var name=event.currentTarget.getAttribute("name");
        component.set("v.sfOrgId",name);
        component.set("v.isChageOrg", true);
        $A.util.removeClass(div, "slds-is-open");
        var title=event.currentTarget.getAttribute("title");
        component.set("v.selectedOrgName", title);
          var hidden =component.find("hidden");
        $A.util.addClass(hidden, "slds-hide");
        var cmpEvent = component.getEvent("orgChangeEvent");
        cmpEvent.setParams({
           "sfOrgId": name
        });
        cmpEvent.fire();
    }
})