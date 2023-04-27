pageextension 60002 "SetFileter and Range" extends "item List"
{
    actions
    {
        addfirst(processing)
        {
            action("SetFilter")
            {
                ApplicationArea = All;
                Caption = 'Set Filter';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    Rec.SetFilter("No.", '1000');
                end;
            }
            action("SeRange")
            {
                ApplicationArea = All;
                Caption = 'Set Range';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    Rec.SetRange("Unit Price", 5000, 10000);
                end;
            }

        }
    }
}