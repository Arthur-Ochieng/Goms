/// A Query for extracting the top customers to be implemented onto the report
query 60002 TopNCustomers
{
    QueryType = Normal;
    OrderBy = descending(Balance__LCY_);
    Caption = 'Top N Customers';
    QueryCategory = 'Customers List'; 
    
    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No."){}
            column(Name;Name){}
            column(Balance__LCY_;"Balance (LCY)"){}
            column(City;City){}
        }
    }
}