report 60002 CustomerAggregate
{
    Caption = 'Customer Aggregation Report';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'CustomerAggregation.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Phone_No_; "Phone No.")
            {
                IncludeCaption = true;
            }
            column(Address; Address)
            {
                IncludeCaption = true;
            }
            column(E_Mail; "E-Mail")
            {
                IncludeCaption = true;
            }
            column(SalesDocumentCaptionLbl;SalesDocumentCaptionLbl){}
            column(TotalCaptionLbl;TotalCaptionLbl){}
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemTableView = sorting("Entry No.");
                DataItemLink = "Customer No." = field("No.");
                column(Customer_No_; "Customer No.")
                {
                    IncludeCaption = true;
                }
                column(Posting_Date; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(Entry_No_; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(Document_No_; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(Document_Type; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(Description; Description)
                {
                    IncludeCaption = true;
                }
                column(Amount; Amount)
                {
                    IncludeCaption = true;
                }
                column(Remaining_Amount; "Remaining Amount")
                {
                    IncludeCaption = true;
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemTableView = sorting("Entry No.");
                    DataItemLink = "Cust. Ledger Entry No." = field("Entry No."), "Customer No." = field("Customer No.");
                    column(Detailed_Entry_No_; "Entry No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Detailed_Entry_Type; "Entry Type")
                    {
                        IncludeCaption = true;
                    }
                    column(Detailed_Posting_Date; "Posting Date")
                    {
                        IncludeCaption = true;
                    }
                    column(Detailed_Document_Type; "Document Type")
                    {
                        IncludeCaption = true;
                    }
                    column(Detailed_Document_No_; "Document No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Amount__LCY_; "Amount (LCY)")
                    {
                        IncludeCaption = true;
                    }
                    column(Transaction_No_; "Transaction No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Journal_Batch_Name; "Journal Batch Name")
                    {
                        IncludeCaption = true;
                    }
                    column(Debit_Amount__LCY_; "Debit Amount (LCY)")
                    {
                        IncludeCaption = true;
                    }
                    column(Credit_Amount__LCY_; "Credit Amount (LCY)")
                    {
                        IncludeCaption = true;
                    }
                }
            }
            dataitem("Sales Header";"Sales Header")
            {
              DataItemTableView = sorting("Document Type", "No.");
              DataItemLink = "Sell-to Customer No." = field("No.");
              column(Sales_Document_Type;"Document Type"){}
              column(Sales_No_;"No."){}  
              column(Sales_Posting_Date;"Posting Date"){}
              column(Prices_Including_VAT;"Prices Including VAT"){}
              column(Sales_Amount;Amount){}

            }
        }
    }
    var
        SalesDocumentCaptionLbl: Label 'Sales Documents';
        TotalCaptionLbl: Label 'Total';
}