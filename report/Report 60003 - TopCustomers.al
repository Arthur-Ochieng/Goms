report 60003 TopNCustomers
{
    // Caption = 'Top Customers';
    CaptionML = ENU = 'Name', DAN = 'Navn', ESP = 'Nombre', FRA = 'Nom', ENC = 'Name';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Report TopNCustomers';
    DefaultLayout = RDLC;
    RDLCLayout = 'Top N Customers Report.rdl';

    dataset
    {
        // integer acts as a placeholder for the query<Dummy Data>
        dataitem(Integer; Integer)
        // You cant call a table since it will override the query
        {
            DataItemTableView = sorting(Number);
            column(CustomerNo; CustomerNo) { }
            column(CustomerName; CustomerName) { }
            column(CustomerBalance; CustomerBalance) { }
            column(City; City) { }

            // Runs before the data item has been processed
            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, TopN);
                TopNCustomers.TopNumberOfRows(TopN);
                TopNCustomers.Open();
                // Method used to open a query on a report
            end;

            // Runs each time data is retrieved from the dataitem
            trigger OnAfterGetRecord()
            begin
                if TopNCustomers.Read() then begin
                    CustomerNo := TopNCustomers.No_;
                    CustomerName := TopNCustomers.Name;
                    CustomerBalance := TopNCustomers.Balance__LCY_;
                end
                else begin
                    CurrReport.Skip();
                end;
            end;
        }
    }

    requestpage
    // Prompts the user to input(enter the number of Customers they'd like) 
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(TopN; TopN)
                    {
                        Caption = 'Top Records which you would like to use in generating the report';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    // Runs whenever the report is loaded
    // Before requestpage runs
    trigger OnInitReport()
    begin
        TopN := 5;
        // Sets TopN as 5 if the user fails to enter the value on the request page
    end;

    var
        TopNCustomers: Query TopNCustomers;
        TopN: Integer;
        // Creating variables to hold the columns decalred in the query
        CustomerNo: Code[20];
        CustomerName: Text;
        CustomerBalance: Decimal;
        Amount: Decimal;
        City: Text;
}