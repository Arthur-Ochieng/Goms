page 60000 "Employe"
{
    Caption = 'Caption';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Employe;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {                
                field(EmpCode; Rec.EmpCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.';
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
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
}