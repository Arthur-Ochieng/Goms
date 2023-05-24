pageextension 60002 "SetFilter and Range" extends "item List"
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

    // Setloadfields has been used to speed up the calculation of unit cost
    trigger OnOpenPage()
    var     
        Item: Record Item;
        Total: Decimal;
        cnt: Integer; 
    begin
        Item.SetLoadFields(Item."Unit Cost");
        if Item.FindFirst() then begin
            repeat
                Total += item."Unit Cost";
                cnt += 1;
            until Item.Next() = 0;
            Message(Format(Total / cnt));
        end;
    end;
    // The code finds the mean of the unit cost
}