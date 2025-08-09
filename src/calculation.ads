package Calculation is

   type computation is record
      Number1 : Integer;
      Number2 : Integer;
      Op : Character;
      is_Float : Boolean;
      Int_results : Integer;
      Fl_results : Float;
   end record;

   -- Maximum history size
   History_Size : constant := 100;

   --  History type
   type History_Array is array (1 .. History_Size) of computation;

   --  Procedure to save a calculation to history
   procedure save_calculations (Calc : in computation);

   --  Procedure to delete history
   procedure delete_calculations;

   --  An procedure for printing the calculation history
   procedure print_calculations;
   
   
   function get_calculation_count return Integer;
   pragma Pure_Function( get_calculation_count);

   
   
   

end Calculation;
