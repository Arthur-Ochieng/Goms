tableextension 60000 CustomerExt extends Customer
{
    fields
    {
        
    }

    procedure UpdateCreditLimit(var NewCreditLimit: Decimal)
    var
    begin
        // Rounds off the NewCreditLimit to the nearest 10,000
        // Validates and modifies the record
        NewCreditLimit := Round(NewCreditLimit, 10000);
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.Modify();
    end;

    procedure CalculateCreditLimit(): Decimal
    var 
        Customer: Record Customer;
    begin
        Customer := Rec;
        Customer.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Customer.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(Customer."Sales (LCY)"*0.5));
    end; 
}