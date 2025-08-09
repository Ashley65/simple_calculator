with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;

package body Calculation is

   History : History_Array;

   History_Count : Integer := 0;

   --  Save the calculation to history
   procedure save_calculations (Calc : computation) is
   begin
      if History_Count < History_Size then
         History_Count := History_Count + 1; -- As a new calcutions happen the history count will increase by 1
         History (History_Count) := Calc;
      else
         Put_Line (" History is full. Can not save more data.");
      end if;
   end save_calculations;

   --  Clear history
   procedure delete_calculations is
   begin
      History_Count := 0;

   end delete_calculations;

   --  Print all calculations history
   procedure print_calculations is
   begin
      if History_Count = 0 then
         Put_Line ("there are no saved calculations yet");

      else
         for I in 1 .. History_Count loop
            declare
               Calc : constant computation := History (I);

            begin
               Put ("Calculation " & Integer'Image (I) & ": ");
               Put (
                    Ada.Strings.Fixed.Trim (Integer'Image (Calc.Number1), Ada.Strings.Both) & " "
                      & Calc.Op & " " &
                    Ada.Strings.Fixed.Trim (Integer'Image (Calc.Number2), Ada.Strings.Both) & " = ");
               if Calc.is_Float then
                  Put_Line (Ada.Strings.Fixed.Trim (Float'Image (Calc.Fl_results), Ada.Strings.Both));
               else
                  Put_Line (Ada.Strings.Fixed.Trim (Integer'Image (Calc.Int_results), Ada.Strings.Both));
               end if;
            end;
         end loop;
      end if;
   end print_calculations;

   function get_calculation_count return Integer is
   begin
      return History_Count;
   end get_calculation_count;

end Calculation;
