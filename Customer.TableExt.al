tableextension 50200 "CustomerTableExt" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50200; "Lookup Value Code"; Code[10])
        {
            TableRelation = LookupValue;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}