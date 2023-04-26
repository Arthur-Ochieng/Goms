report 60001 ItemReport
{
    Caption = 'Item Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'ItemReport.rdl';
    DefaultLayout = RDLC;
    ApplicationArea = All;
    
    dataset
    {
        dataitem(Item; Item)
        {
            column(Last_Date_Modified;"Last Date Modified"){}
            column(Description;Description){}
            column(Type;Type){}
            column(Base_Unit_of_Measure;"Base Unit of Measure"){}
        }
    }
}