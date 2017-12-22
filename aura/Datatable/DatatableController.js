({
    openlist:function (component, event, helper) {
         var options = [
            { value: "ProdOrg", label: "Prod Org" },
            { value: "Development", label: "Development" },
            { value: "QA", label: "Development" },
             { value: "Integration", label: "Integration" },
            { value: "TestOrg", label: "Test Org" },
            { value: "Naresh Test", label: "NareshTest" }
        ];
        
        var el = component.find("ds").get("v.value");
        if(el!="" && el!=undefined && el!=null){
        var newarr = [];
        for(var i=0;i<options.length;i++){
            let label = options[i].label;
            label=label.toLowerCase();
            if(label.indexOf(el.toLowerCase())>=0){
                newarr.push(options[i]);
            }
        }
          component.set("v.statusOptions", newarr);  
        }
        else
        {
            component.set("v.statusOptions", options);  
        }
        var div =component.find("dsf");
        $A.util.addClass(div, "slds-is-open");
    },
    changeOrg:function (component, event, helper) {
        component.set("v.isChageOrg", false);
	},
    closelist:function (component, event, helper) {
        var div =component.find("dsf");
        debugger;
        var name=event.currentTarget.getAttribute("title");
        component.set("v.isChageOrg", true);
        $A.util.removeClass(div, "slds-is-open");
        component.set("v.org", name);
    },
    oes:function (component, event, helper) {
        alert("ddf");
	},
    loadOptions: function (component, event, helper) {
       var options = [
            { value: "ProdOrg", label: "Prod Org" },
            { value: "Development", label: "Development" },
            { value: "QA", label: "Development" },
             { value: "Integration", label: "Integration" },
            { value: "TestOrg", label: "Test Org" },
            { value: "Naresh Test", label: "NareshTest" }
        ];
        component.set("v.statusOptions", options);
    },
    handleChange: function (cmp, event) {
        // Get the string of the "value" attribute on the selected option
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue + "'");
    },
    init: function (cmp, event, helper) {
    cmp.set('v.mycolumns', [
        {label: 'Opportunity name', fieldName: 'opportunityName', type: 'text', sortable:'true'},
                {label: 'Confidence', fieldName: 'confidence', type: 'percent'},
                {label: 'Amount', fieldName: 'amount', type: 'currency', sortable:'true', typeAttributes: { currencyCode: 'EUR'}},
                {label: 'Contact Email', fieldName: 'contact', type: 'email', sortable:'true'},
                {label: 'Contact Phone', fieldName: 'phoneL', type: 'phone', sortable:'true'}
            ]);
        cmp.set('v.mydata', [{
                id: 'a',
                opportunityName: 'Cloudhub',
                confidence: 0.2,
                amount: 12000,
                contact: 'drogers@cloudhub.com',
                phone: '2352235235',
                opportunityNameL: 'Quip',
                confidenceL: 0.8,
                amountL: 740000,
                contactL: 'quipy@quip.com',
                phoneL: '000000'
            },
            {
                id: 'b',
                opportunityName: 'Quip',
                confidence: 0.78,
                amount: 740000,
                contact: 'auipy@quip.com',
                phone: '2352235235',
                opportunityNameL: 'Quip',
                confidenceL: 0.8,
                amountL: 740000,
                contactL: 'quipy@quip.com',
                phoneL: '11111111'
            },{
                id: 'c',
                opportunityName: 'Cloudhub',
                confidence: 1.2,
                amount: 25000,
                contact: 'jrogers@cloudhub.com',
                phone: '2352235235',
                opportunityNameL: 'Quip',
                confidenceL: 0.8,
                amountL: 740000,
                contactL: 'quipy@quip.com',
                phoneL: '11111111'
            },
            {
                id: 'd',
                opportunityName: 'Quip',
                confidence: 0.8,
                amount: 740000,
                contact: 'quipy@quip.com',
                phone: '2352235235',
                opportunityNameL: 'Quip',
                confidenceL: 0.8,
                amountL: 740000,
                contactL: 'quipy@quip.com',
                phoneL: '1111111'
            }]);
    },
    getSelectedName: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        for (var i = 0; i < selectedRows.length; i++){
            alert("You selected: " + selectedRows[i].opportunityName);
        }
    },
     // Client-side controller called by the onsort event handler
    updateColumnSorting: function (cmp, event, helper) {
        debugger;
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        // assign the latest attribute with the sorted column fieldName and sorted direction
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
        event.setParam('sortDirection','desc');
    },
    handleSelect : function (component, event, helper) {     
     var stepName = event.getParam("detail").value;
     var toastEvent = $A.get("e.force:showToast");
     toastEvent.setParams({
       "title": "Success!",
        "message": "Toast from " + stepName
        });
        toastEvent.fire();  
    },
    handleRemoveOnly: function (cmp, event) {
        event.preventDefault();
        alert('Remove button was clicked!');
    },
    handleClick: function (cmp, event) {
        // this won't run when you click the remove button 
        alert('The pill was clicked!');
    }
})