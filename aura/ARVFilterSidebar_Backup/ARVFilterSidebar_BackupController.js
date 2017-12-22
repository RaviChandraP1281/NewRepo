({
	fo : function(component, event, helper) {
        /*
    <span id="popover" aura:id="popover" class="slds-popover slds-nubbin--right" role="dialog" 
          style="position:absolute;">
        <div class="slds-popover__body" onclick="{!c.fo}">Sit nulla est ex deserunt exercitation anim occaecat. Nostrud ullamco deserunt aute id consequat veniam incididunt duis in sint irure nisi.</div>
    </span>
    **/
        var a =component.find("datepick").getElement();
         var b =component.find("popover").getElement();
        
        debugger;       
        var place= a.offsetLeft-a.offsetWidth-b.offsetWidth;
         document.getElementById("popover").style.left =place+"px";

        alert("x:"+place +", y:"+a.offsetWidth);
	}
})