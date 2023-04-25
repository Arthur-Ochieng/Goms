codeunit 60000 MyCodeunit
{
    trigger OnRun()
    begin
        CustQuery.SetFilter(Quantity, '>10');
        CustQuery.Open();
        while CustQuery.Read() do begin
            Message(Textbox, CustQuery.Name, CustQuery.Quantity);
        end;
        CustQuery.Close();
    end;
    
    var
        CustQuery: Query "Customer sales by quantity";
        Textbox: TextConst ENU = 'Customer name = %1, Quantity = %2.';
} 