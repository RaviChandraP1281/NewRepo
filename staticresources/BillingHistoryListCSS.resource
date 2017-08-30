 <!-- ********************************************* CSS stylesheet for BillingHistoryList page ****************************************************-->

            <style>

                .caseIcon {

                    background-image: url(/img/sprites/master.png);

                    background-position: 0 -446px;

                    width: 24px;

                    height: 24px;

                    display: inline-block;

                }

                
                .caseListHeaderTitle {

                    text-align: left; 

                    display: inline-block; 

                    vertical-align: top; 

                    padding-top: 4px;

                }   

                .billingHistoryTitle {

                    font-size: 18px;

                    font-weight: normal;

                    margin-bottom: 4px;

                    margin-left: -20px;

                    vertical-align: text-top;

                    height: 20px;

                    display: inline-block;

                    float: left;

                } 

                .accountLink {

                    display: inline-block;

                    float: left;

                    clear: left;

                    padding-top: 20px;

                    margin-bottom: 10px;

                   

                }

                

                a.specialLink {

                    text-decoration: none !important;

                    color: blue !important;

                }

               

                .headerPhotoContainer {

                    height: 30px;

                    text-align: center;

                    width: 67px;

                    margin-bottom: 20px;

                    display: inline-block;

                    float: left;

                }

                .socialProfilePhoto {

                    max-height: 65px;

                    max-width: 67px;

                    display: inline-block;

                    float: left;

                }

                .buttonContainer {

                    display: inline-block;

                    float: left;

                    clear: both;

                }

                .input-wrapper {

                    padding: 3px 10px 3px 10px;

                    text-align: left; 

                    display: inline-block; 

                    background-color: RGB(206, 238, 247); 

                    width: 99%; border: solid; 

                    border-width: 1px; 

                    border-color: #E0E0E0

                }

                .popbox {

                    display: none; 

                    position: absolute; 

                    margin-left: 50px;

                    background-color: white; 

                    border: 2px solid grey; 

                    border-radius: 10px;

                    border-top: 5px;

                    padding-bottom: 10px;
                    
                    padding-right: 10px;

                   

                    

                }

                .popup-top-border {

                    border-top: 3px solid;

                    border-left: 0px;

                    border-right: 0px;

                    border-bottom: 0px;

                    border-color: #236FBD;

                    border-radius: 10px;

                    width: 98%;

                    margin-left: 4px;

                }

                .popbox h2 {

                    background-color: #58D3F7;

                    color:  #29220A;

                    font-size: 14px;

                    display: block;

                    width: 100%;

                    margin: -10px 0px 8px -10px;

                    padding: 5px 10px;

                }

                 div.popupLabelBold {

                    padding-left: 20px;

                    display: inline;

                    font-weight: bold;

                    vertical-align: top;

                    width: 30%;

                }

                div.popupValueHalf {

                    padding-left: 2px;

                    display: inline-block;

                    width: 50%;

                }

                

                

                .popbox:after

                {

                content: '';

                position: absolute;

                border-style: solid;

                border-width: 20px 40px 20px 0;

                border-color: transparent white;

                display: block;

                width:0px;
                
                z-index: 1;

                left: -40px;

                top: 50px;

                    

                }

                

                .popbox:before

                {

                content: '';

                position: absolute;

                border-style: solid;

                border-width: 22px 44px 22px 0;

                border-color: transparent grey;

                display: block;
                
                width:0px;

                z-index: 0;

                left: -45px;

                top: 48px;

                    

                }

                .innerPopupTable, th {

                

                border: 1px solid silver;

                border-collapse: collapse;

                background-color: #F2F2F2;

              

            }

            .popupHeader {

            font-size: 20px;

            align = "left";

            margin-top: 10px;

            }

            .popper {
                text-decoration:underline;
                cursor:pointer;
            }
            

            .notesBox {

                border: 1px solid #4DB8FF ;

                width : 80%;

                height : 60px;

            }

                

            #overlayDialogBox {

             visibility: hidden;

             background-color: #E6E6E6;

             

             position: absolute;

             width:100%;

             height:100%;

             z-index: 1;

            }

            

            #AdjustmentDialogMainContainer {

            display: none;

            position: fixed;

            top: 50%;

            left: 50%;

            width:50em;

            margin-top: -20em; 

            margin-left: -25em;

            background-color: white;

            border:1px solid grey;

            text-align:center;

            z-index: 1000;



           }

           #ChargeContainer {

               position: relative;

               border:1px solid grey;

               height: 105px;

               margin-top: 1%;

               background-color: #EBF5FF;

               margin-left: 1%;
               
               margin-right: 1%;

           }

           

           .account_POID, .event_type_POID, .event_POID, .item_POID, .billInfoPoid, .payType, .accountId {

               display: none;

           }
           
           
           .LoadingSpinner img {
               
               
               display: block;
               margin-left: auto;
               margin-top:20%;
               margin-right: auto;
               
               
           }

            
            .popboxCloseButton {
              color: #777;
              font: 18px/100% arial, sans-serif;
              position: absolute;
              right: 10px;
              text-decoration: none;
              text-shadow: 0 1px 0 #fff;
              top: 5px;
            }

            .popboxCloseButton:after {
                content: 'X';
            }

            #MakeAdjustmentButton {
              visibility: hidden;
            }

            #SerivceResponseDialogBox {

            display: none;

            position: fixed;

            top: 50%;

            left: 50%;

            width:25em;

            margin-top: -20em; 

            margin-left: -25em;

            background-color: white;

            border:1px solid grey;

            text-align:center;

            z-index: 2000;



           }

                

            </style>

            

        <!-- ********************************************* # ******************************************************>
