page 60004 StatementCard
{
    Caption = 'Statement Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(Input)
            { 
                Caption = 'Input'; 
                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        GetSuggestion();
                    end;
                }              
            }
            group(Output)
            {
                Caption = 'Output';
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                    Editable = false;
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
    var
        Level: Text[20];
        Suggestion: Text[50];
        Difficulty: integer;

    procedure GetSuggestion()
    begin
        Level := '';
        Suggestion := '';

        case Difficulty of
            1..5: 
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-learning or remote learning';
                end;
            6..8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend Instructor led';
                end;
            9..10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor led and self study';
                end;
        end;
    end;
}