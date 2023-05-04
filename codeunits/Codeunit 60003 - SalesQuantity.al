codeunit 60003 SalesQuantity
{
    trigger OnRun()
    begin
        MyQuery.SetFilter(Quantity, '>10');
        MyQuery.Open();
        MyFilter := MyQuery.GetFilter(Quantity);
        Message(Text1, MyFilter);
    end;

    var 
        MyQuery: Query SalesQuantity;
        MyFilter: Text;
        Text1: Label 'The filter is %1';
}