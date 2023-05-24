page 60006 "SetGetFunctions"
{
    Caption = 'Set Current Key';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    actions
    {
        area(Processing)
        {
            action(SetCurrentKey)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if Cust.SetCurrentKey("Salesperson Code")then
                        Message(ValueOfTxt1)
                    else
                        Message(ValueOfTxt2);
                end;
            }
            action(SetPosition)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    InputString := 'No. := Const(20001)';
                    MyRecordRef.Open(23); //Vendor table
                    MyFieldRef := MyRecordRef.field(1);  //Stores the first field in the vendor table to the variable
                    MyFieldRef.SetFilter('10000..20000');
                    MyRecordRef.FindLast(); // Retrieves the last field from the set
                    Message(ValueOfTxt4, MyRecordRef.RecordId, MyRecordRef.Field(2)); // Displays value before change
                    MyRecordRef.SetPosition(InputString);
                    Message(ValueOfTxt5, MyRecordRef.RecordId, MyRecordRef.Field(2)); // Displays value after change
                    InputString := MyRecordRef.GetPosition(true);  // Sets a new value to our inputstring
                    Message(ValueOfTxt3, InputString);  // Displays the new value of the input string
                end;
            }
        }
    }
    var
        Cust: Record Customer;
        ValueOfTxt1: Label 'Key Selected Successfully';
        ValueOfTxt2: Label 'Key not found';
        RecRef: RecordRef;
        // RecordRef can refer to any table in the database
        VarPrimaryKey: Text;
        ValueOfTxt3: Label 'The primary key is: %1';

        // SetPosition - Used to 
        MyRecordRef: RecordRef;
        InputString: Text;
        MyFieldRef: FieldRef;
        // FieldRef can refer to any field in the table
        ValueOfTxt4: Label 'The record no. before the primary key was changed is %1. \\ The vendoe name before the primary key was changed is %2';
        ValueOfTxt5: Label 'The record no. after the primary key was changed is %1 \\ The vendor name after the primary key was changed is %2';
}