codeunit 60001 TryMethods
{
    trigger OnRun()
    begin
        if MyTryMethod() then
            Message('Everything went well')
        else
            Message('Something went wrong');
    end;

    local procedure MyTryMethod(): Boolean
    begin
        Error('An Error occured during the operation');
    end;
    
    var
        myInt: Integer;
}