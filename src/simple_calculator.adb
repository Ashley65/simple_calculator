with Ada.Text_IO; use Ada.Text_IO;
with Calculation;        use Calculation;

procedure Simple_Calculator is
   Num1, Num2 : Integer;
   Operation : Character;
   Result : Float := 0.0;
   Int_Result : Integer;
   Input_Line : String (1 .. 10);
   Last : Natural;
   Valid : Boolean := True;
   Calc : computation;

   --  Nested procedure for checking if the user input value is an Integer and if not, it will ask the user to enter a valid one.
   procedure Get_Valid_Integer (Prompt : String; Value : out Integer) is
   begin
      loop
         Put_Line (Prompt);
         Get_Line (Input_Line, Last);
         begin
            Value := Integer'Value (Input_Line (1 .. Last));
            exit;  -- Exit the loop if the input is a valid integer
         exception
            when Constraint_Error =>

               null;
         end;
      end loop;
   end Get_Valid_Integer;

begin
   Get_Valid_Integer ("Enter your first number:", Num1);

   Put_Line ("Enter an operation (+, -, *, /):");
   Get_Line (Input_Line, Last);
   Operation := Input_Line (1);

   Get_Valid_Integer ("Enter your second number:", Num2);

   case Operation is
      when '+' =>
         Int_Result := Num1 + Num2;

      when '-' =>
         Int_Result := Num1 - Num2;

      when '*' =>
         Int_Result := Num1 * Num2;

      when '/' =>
         if Num2 /= 0 then
            Result := Float (Num1) / Float (Num2);
         else
            Put_Line ("Error: Division by zero.");
            Valid := False;
         end if;
      when others =>
         Put_Line ("Invalid operation.");
         Valid := False;
   end case;

   if Valid then
      --  Fill the record for calculatios
      Calc.Number1 := Num1;
      Calc.Number2 := Num2;
      Calc.Op := Operation;

      if Operation = '/' then
         Calc.is_Float := True;
         Calc.Fl_results := Result;
         Calc.Int_results := 0;
         Put_Line ("Result: " & Float'Image (Result));
      else
         Calc.is_Float := False;
         Calc.Fl_results := 0.0;
         Calc.Int_results := Int_Result;
         Put_Line ("Result: " & Integer'Image (Int_Result));
      end if;

      --  Save to history
      save_calculations (Calc);

      print_calculations;

   end if;
end Simple_Calculator;
