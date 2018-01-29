@isTest
public class BankAccountTest {
    public static testMethod void test1(){
        Bank_Account ba = new Bank_Account();
        ba.setValues('Testaccount',121315,1245);
        ba.checkBalance();
        ba.countCustomer();
        ba.deposit(1520);
        
        ba.getValues();
        ba.withDraw(100);
        Bank_Account ba1 = new Bank_Account('Testaccount',121315,1245);
        ba.setValues('Testaccount1',1213115,1345);
        Bank_Account.getCount();
    }
}