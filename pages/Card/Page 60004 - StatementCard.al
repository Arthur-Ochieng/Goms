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
            action(SetGetTable)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    invent.Find('-');
                    RecID := invent."Source Line ID";
                    RecRef := RecID.GetRecord();
                    // SetTable -> Sets the table to which a record variable refers as the same table as a RecordRef variable
                    RecRef.SetTable(ProdOrder);
                end;
            }
            action(GetTable)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    RecRef.GetTable(ProdOrder);
                    Message('The table used to get set %1', ProdOrder);
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

    var
        invent: Record "Inventory Event Buffer";
        RecID: RecordId; // RecordID contains the table number and the primary key of a table. We can use two methods -> GetRecord(), TableNo)()
        RecRef: RecordRef; // RecordRef -> This object can refer to any table in the database
        ProdOrder: Record "Prod. Order Component"; // Record is a complex data type
        Cust: Record Customer;
}