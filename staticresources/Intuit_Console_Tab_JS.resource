// TODO BTBE-545:Sales Console: Tabs and Subtabs refresh not working
if (sforce.console.isInConsole()) { 
    $(document).ready(function() {
        sforce.console.setTabLink(); 
    }); 
};
// END BTBE-545