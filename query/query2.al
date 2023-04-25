query 60001 "Customer Sales by Quantity"
{
    QueryType = Normal;
    Caption = 'Customer Sales by Quantity';
    OrderBy = descending(Quantity);
    
    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustNo_; "No."){ }
            column(Name;Name){ }
            dataitem(Sales_Line;"Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                Description = 'This is an example of an inner join';
                column(Quantity;Quantity){
                    Method = Sum;
                }
            }
        }
    }
}