query 60000 "Top 5 customers"
{
    QueryType = Normal;
    Caption = 'List of Customers';
    TopNumberOfRows = 3;
    OrderBy = descending(Sales__LCY_);
    QueryCategory = 'Customer List';

    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {
            filter(Posting_Date; "Posting Date"){}
            column(Customer_No_;"Customer No."){}
            column(Customer_Name;"Customer Name"){}
            column(Sales__LCY_;"Sales (LCY)"){
                Method = Sum;
            }
        }
    }
}
  