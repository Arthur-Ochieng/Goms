report 60000 CustomerReport
{
    Caption = 'Customer Report';
    ApplicationArea = All;
    // Defines where the report will be accessible from
    UsageCategory = ReportsAndAnalysis;
    WordLayout = 'CustomerReport.docx';
    DefaultLayout = Word;
    
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name){ }
            column(City;City){}
            column(E_Mail;"E-Mail"){}
            column(Balance;Balance){}
        }
    }
    var
        Arthur: Action;

    ///xml comm
    /* 
    This is a type of a block comment
     */
}