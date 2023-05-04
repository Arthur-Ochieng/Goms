page 60000 "Employe"
{
    Caption = 'Calculate Simple Interest';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Employe;

    layout
    {
        area(Content)
        {
            group("Basic Info")
            {
                field(EmpCode; Rec.EmpCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field(EmpName; Rec.EmpName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(EmpSalary; Rec.EmpSalary)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Salary field.';
                }
                field(Cities; Rec.Cities)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cities field.';
                }
                field(DOJ; Rec.DOJ)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Of Join field.';
                }
            }
            group(Input)
            {
                field(initialAmount; InitialAmount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Initial Amount';
                }
                field(NoOfYears; NoOfYears)
                {
                    ApplicationArea = All;
                    ToolTip = 'Number of Years';
                }
                field(RateOfInterest; RateOfInterest)
                {
                    ApplicationArea = All;
                    ToolTip = 'Rate Of Interest';
                }
            }
            group(Output)
            {
                field(FinalAmount; FinalAmount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Final Amount';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Calculate Simple Interest")
            {
                ApplicationArea = All;
                Caption = 'Calculate the Interest';
                Image = ExecuteBatch;
                ToolTip = 'Interest Calculation';
                trigger OnAction()
                begin
                    FinalAmount := InitialAmount * (1 + RateOfInterest * NoOfYears);
                end;
            }
        }
        area(Navigation)
        {
            group("More Information")
            {
                Caption = 'More Data';
                action(Customer)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Details';
                    RunObject = page "Customer Card";
                }
                action(Sales)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Analysis';
                    RunObject = page "Sales Analysis View Card";
                }
            }
        }
        area(Creation)
        {
            action("New Document")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
                Image = Create;
            }
        }
        area(Reporting)
        {
            action("Customer Aggregation")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = report CustomerAggregate;
            }
        }
    }

    var
        Counter1, Counter2, PowerNumber, Number, Result : Integer;
        CounterText: Text[5];
        ArmstrongNumbers, Newline : Text;
        ResultList: List of [Integer];
        Ch10, Ch13 : Char;
        
    trigger OnOpenPage()
    begin
        Ch10 := 10;
        Ch13 := 13;
        Newline := Format(Ch10) + Format(Ch13);
        for Counter1 := 0 to 1000 do begin
            CounterText := Format(Counter1);
            Evaluate(PowerNumber, CopyStr(CounterText, StrLen(CounterText), 1));
            for Counter2 := 1 to StrLen(CounterText) do begin
                Evaluate(Number, CopyStr(CounterText, Counter2, 1));
                Result += Power(Number, PowerNumber);
            end;
            if Result = Counter1 then
                ResultList.Add(Result);
            Clear(Result);
        end;
        foreach Counter1 in ResultList do
            ArmstrongNumbers += Newline + Format(Counter1);
        Message(ArmstrongNumbers);
    end;

    var
        InitialAmount: Decimal;
        NoOfYears: Integer;
        RateOfInterest: Decimal;
        FinalAmount: Decimal;
}