ccom$ = jQuery.noConflict();
ccom$(document).ready(function() { 
    
    <!-- This section is for javascript ,where we use jquery to append the data from the calidus to the table in salesforce -->
    oTable= ccom$('#transactionTable1').DataTable(  );
    
    
    
    // ccom$('#transactionTable1').DataTable();
    //$("div.toolbar").html('<b>Custom tool bar! Text/images etc.</b>');
    var refresh='<button id="Refresh" >Refre</button>';
    //<INPUT TYPE="button" onClick="history.go(0)" VALUE="Refresh">
    // ccom$(refresh).appendTo('div.dataTables_filter');
    //var temp3='{!fedIdPart}';
    //var temp= '<input onclick="$(\'#transactionTable1\').addClass(\'loadinggif\');" id="status" type="image" src="/resource/Refresh" alt="button" class="excel" > </input>';
    var temp= '<input id="status" type="image" src="/resource/Refresh" alt="button" class="excel" > </input>';
    var temp1= '<a href="/apex/CallidusDataExportPage" target="__blank"> <img src="/resource/Excel" style="width:15px;height:15px;"/></a>';
    ccom$(temp).appendTo('div.dataTables_filter');  
    ccom$(temp1).appendTo('div.dataTables_filter');
    // $(this).contents().wrap('<div id="loading"></div>');
    
    
    
    
    console.log(temp1) ;   
    
});

function applyTableStyle() {
    ccom$('#transactionTable1').DataTable();
}

function exportData(){
    
    location.href='/apex/CallidusDataExportPage';
    //   $('.export').each(function() {
    // var link = $(this).html();
    // $(this).contents().wrap('<a href="/apex/CallidusDataExportPage"></a>');
    
}  

function exportToCSS(){
    
    $.ajax({ url: '/apex/CallidusDataExportPage', success: function(data) { console.log(data); } });
}