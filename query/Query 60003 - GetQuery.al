query 60003 SalesQuantity
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "No." = Customer."No.";
                SqlJoinType = InnerJoin;
                column(Quantity; Quantity) { }

                // Filters the sales to only where the quantity is greater than 5
                filter(Quantity_filter; Quantity)
                {
                    ColumnFilter = Quantity_filter = filter(> 5);
                }
            }

        }
    }
}