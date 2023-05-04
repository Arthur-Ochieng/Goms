page 60002 "Arithmetic Operators"
{
    Caption = 'Arithmetic Operators';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Enter the values';
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                }
                field(Value2; Value2)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                Caption = 'The output is here';
                field(summ; summ)
                {
                    ApplicationArea = All;
                }
                field(diff; diff)
                {
                    ApplicationArea = All;
                }
                field(prod; prod)
                {
                    ApplicationArea = All;
                }
                field(quotient; quotient)
                {
                    ApplicationArea = All;
                }
                field(divInt; divInt)
                {
                    ApplicationArea = All;
                }
                field(modulus; modulus)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Execute';
                Image = ExecuteBatch;
                trigger OnAction()
                begin
                    summ := Value1 + Value2;
                    diff := Value1 - Value2;
                    prod := Value1 * Value2;
                    modulus := Value1 MOD Value2;
                    divInt := Value1 DIV Value2;
                    quotient := Value1 / Value2;
                end;
            }
        }
    }
    var
        Value1: Integer;
        Value2: Integer;
        summ: Integer;
        diff: Integer;
        prod: Integer;
        quotient: Decimal;
        divInt: Integer;
        modulus: Decimal;

}