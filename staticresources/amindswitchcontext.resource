/* 
amindswitchcontext.js - Daniel Dickerson 9/14/1014
    
    Enables the aMind iFrame to communicate to the parent frame, to allow 
    communication between the aMind web application and salesforce.
    
    Global variables:
    
    aMindjQuery$ : an salesforce-safe instance of JQuery.  Used for making ajax calls.
    
    aMindSwitchContextObjectId : The object id (sfdc row id) of the object we need to
        switch context for.  For v1, should always be an opportunity object, but may add
        quotes and other objects in the future.  Because this is a salesforce id, it is assumed
        that that object being switched to exists in Salesforce prior to any calls.
    
    aMindSwitchContextQuoteId : for quote switching only, the siebel row id of the quote
        we are switching context to.  This object does not need to exist in salesforce, so
        when defined, the aMindSwitchContextObjectId is an opportunity object id.
    
    aMindSwitchContextPrimaryTabId : The salesforce id value of the primary (top-level) tab.
        Necessary per the salesforce console integration api in order to call openSubtab,
        which opens a new tab (or existing tab) in response to navigation.
    
    aMindSwitchContextPrimaryObjectId : the salesforce id of the object in the primary tab.
        May be null if the tab displays a list view or anything that does not display a single
        salesforce object.  We use this value to understand if we need to switch context or not.
    
    Subtab switching is easy -- When a subtab is clicked a subtab focused event fires, and event handler
    first verifies that the tab clicked is the right tab, and then the switchContext() method is called.
    This method uses the controller class (such as AMindSwitchContextOpportunityController) to get the
    five variables it needs to switch context in the aMind UI.  This switchContext() method must be defined
    in an apex page, and not in an attached file.  Therefore, the caller page must provide this method.
    
    Primary tab switching is a little bit more complicated.   When a primary tab is clicked, a primary
    tab focused event is fired.  Callback methods then must be invoked to find the newly focused subtab
    id and subtab object id (aMindGetPrimaryTabIdForConsole and aMindOpenSubtabIdForConsole) which then
    calls the openSubTab method to open a subtab. 
*/

var aMindSwitchContextObjectId = null; // Perhaps values should be set by the calling apex page.
var aMindSwitchContextSubtabId = null; 
// var aMindSwitchContextObjectId = '{!aMindSwitchContextObjectId}';
var aMindSwitchContextQuoteId = null;
var aMindSwitchContextPrimaryTabId = null;
var aMindSwitchContextPrimaryObjectId = null;

function getEighteenDigitId( id ) {
    if ( id == null || id.length != 15 ) {
        return id;
    }
    var suffix = "";
    var flags;
    var i = 0;
    for (; i < 3; i++) {
        flags = 0;
        var j = 0;
        for (; j < 5; j++) {
            var c = id.substring(i * 5 + j,i * 5 + j + 1);
            //Only add to flags if c is an uppercase letter:
            if (c.toUpperCase().equals(c) && c >= 'A' && c <= 'Z') {
                flags = flags + (1 << j);
            }
        }
        if (flags <= 25) {
            suffix = suffix + "ABCDEFGHIJKLMNOPQRSTUVWXYZ".substring(flags,flags+1);
        } else {
            suffix = suffix + "012345".substring(flags-25,flags-24);
        }
    }
    
    var longId = id + "" + suffix;
    aMindSwitchContextPrintConsole( "get18DigitIdFrom15DigitId (15=" + id + ", 18=" + longId + ")" );
    return longId;
}

/*
    function aMindSwitchContextPrintConsole
    Daniel Dickerson 9/8/2014
        Enables printing of debug statements to the firefox and chrome console log.
        May not be necessary in production, as this will only log to the agent desktop.
    @arg msg: the message to write to the console.  Should already be escaped.
*/
var aMindSwitchContextPrintConsole = function ( msg ) {
    if (typeof window.console != 'undefined') {
        console.log( msg );
    }
};

/*
    function aMindOpenSubtabIdForConsole
    Daniel Dickerson 9/14/2014
        Callback method returns the current subtab id and subtab object id.
        Precursor to reloading a tab.
    @arg result : the event that was fired.
        Contains id (the subtab id) and objectId (object id under the subtab)
        result.objectId can be null if a single object is not under the subtab.
    Uses aMindSwitchContextQuoteId and aMindSwitchContextObjectId to generate the URL to use,
    Uses aMindSwitchContextPrimaryTabId to open a new tab.
*/
var aMindOpenSubtabIdForConsole = function( result ) {
    var subtabId       = result.id;
    var subtabObjectId = result.objectId;
    
    aMindSwitchContextNavigate( aMindSwitchContextPrimaryTabId, subtabId);
}

/*
    function aMindGetPrimaryTabIdForConsole
    Daniel Dickerson 9/14/2014
        Callback method captures the primary tab id and primary tab object id,
        then calls getFocusedSubtabId to capture subtab values prior to navigation.
    @arg result : the event that was fired.
        Contains id (the primary tab id) and objectId (object id under the primary tab)
        result.objectId can be null if a single object is not under the tab.
    For some reason, primary tab events can only be captured by a console component.
*/
var aMindGetPrimaryTabIdForConsole = function( result ) {
    aMindSwitchContextPrimaryTabId    = result.id;
    aMindSwitchContextPrimaryObjectId = result.objectId;
    
    sforce.console.getFocusedSubtabId(aMindOpenSubtabIdForConsole);
}

/*
    function aMindSwitchContextReceiveMessage(event)
    Daniel Dickerson 9/9/2014
        Enables communication between child aMind frame and parent salesforce window.
        Starting point of the integration for context switching:  on mouse click in the
        aMind UI fires a message to the salesforce UI in the form of a message that contains
        the quote id we want to navigate to.  This method captures the aMindSwitchContextQuoteId
        if present in the message, and calls the aMindGetFocusedPrimaryTabId() methods to get
        the ball rolling with navigation.
        Message may contain quote id in JSON form:
        {quoteId:'1-29298AJX'}
*/
var aMindSwitchContextReceiveMessage = function(event)
{
  if ( typeof event.data != 'undefined' && event.data != null ) {
    aMindSwitchContextPrintConsole("aMindSwitchContextReceiveMessage: data=" + event.data );
    var quoteIdIdx = event.data.indexOf("quoteId:");
    // {quoteId:'QAL-51IP9GH'}
    if ( quoteIdIdx != -1 ) {
        aMindSwitchContextPrintConsole("aMindSwitchContextReceiveMessage: found quoteId word at idx " + quoteIdIdx );
        quoteIdIdx += 8; // length of string "quoteId:"
        var startIdx = event.data.indexOf("'", quoteIdIdx);
        if ( startIdx == -1 ) {
            startIdx = event.data.indexOf('"', quoteIdIdx);
        }
        var quoteChar = event.data.substring(startIdx, startIdx + 1);
        var endIdx = -1;
        aMindSwitchContextPrintConsole("quoteIdIdx: " + quoteIdIdx + ", startIdx: " + startIdx + ", quoteChar: " + quoteChar );
        if ( startIdx != -1 ) {
            endIdx = event.data.indexOf(quoteChar, startIdx + 1);
            aMindSwitchContextPrintConsole("quoteIdIdx: " + quoteIdIdx + ", startIdx: " + startIdx + ", quoteChar: " + quoteChar + ", endIdx: " + endIdx );
            aMindSwitchContextQuoteId = event.data.substring( startIdx + 1, endIdx );
            aMindSwitchContextPrintConsole("aMindSwitchContextQuoteId: " + aMindSwitchContextQuoteId );
            
            sforce.console.getFocusedPrimaryTabId(aMindGetPrimaryTabIdForConsole);
        }
    }
    /**
    var idx = event.data.indexOf( 'aMind Quote ' );
    if ( idx != -1 ) {
      idx += 12;  // move index over by length of 'aMind Quote ' string
      aMindSwitchContextPrintConsole( "Test event handler received: " + event.data );
      aMindSwitchContextQuoteId = event.data.substring( idx );
      aMindSwitchContextPrintConsole( "Found quote id '" + aMindSwitchContextQuoteId + "'" );
      
      sforce.console.getFocusedPrimaryTabId(aMindGetPrimaryTabIdForConsole);
    }
    **/
  }
}


/*
 *
    function aMindSwitchContext()
    Daniel Dickerson 9/10/2014
        Enables context switching by invoking an ajax callout to /intuitCPQ/context/tab-activated
        with four arguments: objectId, objectType, parentObjectId, parentObjectType.
        All arguments come from the controller which must implement the aMindSwitchContext methods
        that return these values.
    Uses a URL value taken from aMindSwitchContextSwitchedUrl.
    Uses the aMindJQuery$ object to make the ajax call.
 *  
var aMindSwitchContext = function() {
    var aMindjQuery$ = jQuery.noConflict();
    aMindSwitchContextPrintConsole('switch context called' );
    
    var parentObjectId   = '{!aMindSwitchContextParentObjectId}'; // '001f000000BymqKAAR'; // BERKSHIRE FAMILY MEDICINE
    var parentObjectType = '{!aMindSwitchContextParentObjectType}'; // 'Account';
    var objectId         = '{!aMindSwitchContextObjectId}'; // '006f0000006caErAAI'; // OptyExample
    var objectType       = '{!aMindSwitchContextObjectType}'; // 'Opportunity';
    var url              = '{!aMindSwitchContextUrl}'; // "https://aminddev.intuit.com/intuitCPQ/context/tab-activated";
    
    // withCredentials: true needs to be in xhr in order to share session cookie
    aMindjQuery$.ajaxSetup({ async: true, 
        xhrFields: {
           withCredentials: true
        },
        crossDomain: true
     });

     aMindjQuery$.ajax({url: url,
         type: 'POST',
         data: {
            objectId:objectId,
            objectType:objectType, 
            parentObjectId:parentObjectId,
            parentObjectType:parentObjectType
         },
         success: function(data, status){
            var msg = "AJAX call invoked to url: " + url;  // "\nData: " + data + "\nStatus: " + status;
            aMindSwitchContextPrintConsole( msg );
         },
         error: function( jqXHR, textStatus, errorThrown ) {
            var msg = "AJAX call erred out: " + "\nStatus: " + textStatus + "\nerrorThrown: " + errorThrown;
            aMindSwitchContextPrintConsole( msg );
         }
     });
};
 *
 */


/**
  {"url":"http://na1.salesforce.com/001x0000003DGQR?id=alskdjflksdjf&quoteId=sldkfja;lsdkfj",
   "objectId":"001x0000003DGQR","objectName":"Acme Person Account",
   "object":"Account", "contactId":"003D000000QOMqg", "personAccount":true}
*/
var aMindSwitchContextGetPageInfo = function( result ) {
    aMindSwitchContextPrintConsole( "GetPageInfo returned: " + result.pageInfo );
    var subtabId = aMindSwitchContextSubtabId;     // set in subtab focused event handler, below
    var pageInfo = JSON.parse(result.pageInfo);
    var url = pageInfo.url;
    aMindSwitchContextPrintConsole( "GetPageInfo returned url: " + url );
    // GetPageInfo returned: /apex/AMindQuoteDetailOverride?id=006f000000AUl22AAD&siebelQuoteId=QAL-51IOOMH&sfdc.override=1
    var idxStart = -1;
    var idxEnd   = -1;
    idxStart = url.indexOf("?id=" );
    if ( idxStart == -1 ) {
        idxStart = url.indexOf("&id=" ) + 4;
    } else {
        idxStart += 4;
    }
    idxEnd   = url.indexOf("&", idxStart );
    var subtabObjectId = null;
    if ( idxEnd == -1 ) {
        subtabObjectId = url.substring( idxStart );
    } else {
        subtabObjectId = url.substring( idxStart, idxEnd );
    }
    if ( subtabObjectId.length > 15 ) {
        subtabObjectId = subtabObjectId.substring(0,15);
    }
    
    aMindSwitchContextPrintConsole( "GetPageInfo url substring(" + idxStart + ", " + idxEnd + ") = " + subtabObjectId );
    
    aMindSwitchContextPrintConsole( 'Tab focused event fired for tabid : ' + subtabId + '(' + subtabObjectId + ')' );
    
    if ( aMindSwitchContextObjectId == null ) {
        aMindSwitchContextObjectId = getAMindSwitchContextObjectId();  // defined in calling apex page
    }
    var myObjectId = aMindSwitchContextObjectId.substring(0,15);
    
    if ( subtabObjectId == myObjectId ) {
        aMindSwitchContextPrintConsole( "clicked object id " + subtabObjectId + " matched object Id " + myObjectId );
        try {
            if (typeof aMindSwitchContext != 'undefined') {
                // method is defined in calling apex page
                aMindSwitchContextPrintConsole('Calling aMindSwitchContext...' );
                aMindSwitchContext(); 
            } else {
                aMindSwitchContextPrintConsole( 'Unable to call aMindSwitchContext!  Method is not defined!' );
            }
        } catch ( Ex ) {
            aMindSwitchContextPrintConsole( 'Exception caught while calling aMindSwitchContext: ' + Ex );
        }
    } else {
        aMindSwitchContextPrintConsole( "clicked object id " + subtabObjectId + " does not match object Id " + myObjectId );
    }

}


/*
    function aMindSwitchContextSubtabFocusedEvent
    Daniel Dickerson 9/9/2014
        Callback method fires when the subtab gains focus.  
        Uses salesforce console integration toolkit API integration.js
        Checks to be sure the subtab object id matches the object id reported by the
        controller object.  If it matches, call aMindSwitchContext() to switch context.
        aMindSwitchContext method must be defined in javascript by the calling apex page.
        
        Registered by call to sforce.console.onFocusedSubtab(aMindSubtabFocusedEvent);
*/
var aMindSwitchContextSubtabFocusedEvent = function( result ) {
    var subtabId       = result.id;
    aMindSwitchContextSubtabId = subtabId;
    var subtabObjectId = result.objectId;
    
    // DMD 9/23/2014: sometimes the subtabObjectId is null when it shouldn't be.  deal with this by calling getPageInfo()...
    if ( subtabObjectId != null ) {
        aMindSwitchContextPrintConsole( 'Tab focused event fired for tabid : ' + subtabId + '(' + subtabObjectId + ')' );
        
        if ( aMindSwitchContextObjectId == null ) {
            aMindSwitchContextObjectId = getAMindSwitchContextObjectId();  // defined in calling apex page
        }
        var myObjectId = aMindSwitchContextObjectId.substring(0,15);
        
        if ( subtabObjectId == myObjectId ) {
            aMindSwitchContextPrintConsole( "clicked object id " + subtabObjectId + " matched object Id " + myObjectId );
            try {
                if (typeof aMindSwitchContext != 'undefined') {
                    // method is defined in calling apex page
                    aMindSwitchContext(); 
                } else {
                    aMindSwitchContextPrintConsole( 'Unable to call aMindSwitchContext!  Method is not defined!' );
                }
            } catch ( Ex ) {
                aMindSwitchContextPrintConsole( 'Exception caught while calling aMindSwitchContext...');
            }
        } else {
            aMindSwitchContextPrintConsole( "clicked object id " + subtabObjectId + " does not match object Id " + myObjectId );
        }
    } else {
        sforce.console.getPageInfo(subtabId, aMindSwitchContextGetPageInfo);
    }
};

/*
    inline code
    Daniel Dickerson 9/15/2014
    Register to be notified when the aMind frame sends us a message.  
    For switching context and navigating between console tabs.
    
    Also register for focused subtab event, in case js is loaded in a subtab.
    
    DMD 9/15/2014
    Commenting out this code, as this needs to be defined in the calling apex page

// window.addEventListener("message", aMindSwitchContextReceiveMessage, false);
// sforce.console.onFocusedSubtab(aMindSwitchContextSubtabFocusedEvent);
*/