pageextension 60001 SystemVariables extends "Customer Card"
{
    actions
    {
        addafter("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                Caption = 'Update Credit Limit';
                ApplicationArea = All;
                ToolTip = 'Update Credit Limit';
                Image = CalculateCost;
                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }

    local procedure CallUpdateCreditLimit()
    var
        Cust: Record Customer;
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;
        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false,Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitRoundedTxt,CreditLimitActual);
    end;

    var
        // Confirmation message
        AreYouSureQst: Label 'Are you sure that you want to set the %1 to %2';

        // Information about the rounded credit limit
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies';

        // Information about an up-to-date credit limit
        CreditLimitUpToDateTxt: Label 'The credit limit is up to date';
}