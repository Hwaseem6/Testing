codeunit 50200 "LookupValue UT Customer"
{
    Subtype = Test;
    trigger OnRun()
    begin
        // [FEATURE] LookupValue UT Customer
    end;

    var
        Assert: Codeunit Assert;
        //Assert: Codeunit "Library - Assert";
        LibraryUtility: Codeunit "Library - Utility";
        LibrarySales: Codeunit "Library - Sales";

    [Test]
    procedure AssignLookupValueToCustomer()
    var
        Customer: Record Customer;
        LookupValueCode: Code[10];
    begin
        // [SCENARIO #0001] Assign lookup value to customer
        //[GIVEN] Lookup value
        LookupValueCode := CreateLookupValueCode();
        //[GIVEN] Customer
        CreateCustomer(Customer);
        //[WHEN] Set lookup value on customer
        SetLookupValueOnCustomer(Customer, LookupValueCode);
        //[THEN] Customer has lookup value code field populated
        VerifyLookupValueOnCustomer(Customer."No.", LookupValueCode);
    end;

    local procedure CreatelookupValueCode(): Code[10]
    var
        LookupValue: Record LookupValue;
    begin
        LookupValue.Init();
        LookupValue.Validate(Code, LibraryUtility.GenerateRandomCode(LookupValue.FieldNo(Code), Database::LookupValue));
        LookupValue.Validate(Description, LookupValue.Code);
        LookupValue.Insert();
        exit(LookupValue.Code);
    end;

    local procedure CreateCustomer(var Customer: Record Customer)
    begin
        LibrarySales.CreateCustomer(Customer);
    end;

    local procedure SetLookupValueOnCustomer(var Customer: Record Customer; LookupValueCode: Code[10])
    begin
        Customer.Validate("Lookup Value Code", LookupValueCode);
        Customer.Modify();
    end;

    local procedure VerifyLookupValueOnCustomer(CustomerNo: Code[20]; LookupValueCode: Code[10])
    var
        Customer: Record Customer;
        FieldOnTableTxt: Label '%1 on %2';
    begin
        Customer.Get(CustomerNo);
        Assert.AreEqual(
            LookupValueCode, Customer."Lookup Value Code", StrSubstNo(
                FieldOnTableTxt, Customer.FieldCaption("Lookup Value Code"), Customer.TableCaption()
            ));
    end;

    procedure AreEqual(Expected: Variant; Actual: Variant; Msg: Text)
    begin
        // If not Assert.Equal(Expected, Actual) then
        //LibraryAssert.Error(
        // Assert.AreEqualFailedErr,  
        // Expected,
        // TypeNameOf(Expected),
        // Actual,
        // TypeNameOf(Actual),
        // Msg

        //     )
    end;
}