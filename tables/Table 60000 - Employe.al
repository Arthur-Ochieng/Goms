table 60000 Employe
{
    DataClassification = ToBeClassified;
    Caption = 'Employee Table';
    
    fields
    {
        field(1;EmpCode; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Code';
        }
        field(2; EmpName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Name';
        }
        field(3; EmpSalary; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee Salary';

        }
        field(4; DOJ; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Of Join';
        }
        field(5; Cities; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Nairobi, Mombasa, Busia, Kisumu, Eldoret;
        }
    }
    
    keys
    {
        key(Key1; EmpCode)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        Message('Data Inserted');
    end;
    
    trigger OnModify()
    begin
        Message('Data Modified');
    end;
    
    trigger OnDelete()
    begin
        Message('Data Deleted');
    end;
    
    trigger OnRename()
    begin
        Message('Data Renamed');
    end;
    
}