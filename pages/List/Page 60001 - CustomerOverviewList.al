page 60001 CustomerOverviewList
{
    Caption = 'Customer Overview List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CustomerOverview;
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Run Date field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Import Records")
            {
                Caption = 'Import Records';
                ToolTip = 'Import Records';
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var
                    CustomerOverviewMgmt: Codeunit CustomerOverview;
                begin
                    CustomerOverviewMgmt.Run();
                end;
            }
            action(GetSet)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    MyCode.Run();
                end;
            }
        }
    }
    var
        MyCode: Codeunit SalesQuantity;
}