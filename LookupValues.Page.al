page 50200 "LookupValues"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "LookupValue";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("Code"; rec.Code)
                {

                }
                field("Description"; rec.Description)
                {

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
        myInt: Integer;
}