pageextension 60000 SalesCust extends "Sales Order"
{
    actions
    {
        addafter(AssemblyOrders)
        {
            action(CustomerSalesQuantity)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                var
                    MyCodeunit: Codeunit MyCodeunit;
                begin
                    Clear(MyCodeunit);
                    MyCodeunit.Run();
                end;
            }
        }
    }
}