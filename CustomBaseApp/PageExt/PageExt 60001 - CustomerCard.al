pageextension 60001 SystemVariables extends "Customer Card"
{
    layout
    {
        
    }
    trigger OnOpenPage()
    begin
        Message('On Open page(before modify) the address is: %1', Rec.Address);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Message('On Modify, the address is: %1', Rec.Address);
        Message('On Modify, the previous address is: %1', xRec.Address);
    end;
}