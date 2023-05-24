page 60005 Regex
{
    Caption = 'Regex Functions';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            field(EmpID; EmpID)
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Pattern := '[A-Z]{3}\-[0-9,A-Z]{3}';
                    if regex.IsMatch(EmpID, Pattern, 0) then
                        Message('Match')
                    else
                        Error('Please enter a valid input');
                end;
            }
            field(Email; Email)
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Pattern := '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';
                    if regex.IsMatch(Email, Pattern, 0) then 
                        Message('Matched')
                    else
                        Error('Invalid input');
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Calcfield)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if (Cust.Find('-') = true) then 
                        repeat
                            cust.CalcFields(Balance, "Net Change");
                        until (Cust.Next() = 0);
                    Message('Net Change %1', cust.Balance)
                end;
            }
            action(AutoCalcfield)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    cust.SetAutoCalcFields(Balance, "Net Change");
                    if (cust.Find('-') = true) then
                        repeat
                            // chunks of code
                        until (cust.Next() = 0)
                end;
            }
        }
        // Difference between calcfields and autocalcfield is perfomance based
        // Setauto is more optimized since it uses less memory 

    }
    var
        EmpID: Text[30];
        regex: Codeunit Regex;
        Pattern: Text;
        Email: Text;
        cust: Record Customer;

}