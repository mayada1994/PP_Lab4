with Ada.Text_IO, Calculate_Sum;

use Ada.Text_IO;

procedure Main is
   type CustomArray is array(Natural range<>) of Long_Integer;

   function TotalSum is new Calculate_Sum(CustomArray);

   arr: CustomArray(0..15);
begin
   --  create and print array
   Put("Array: ");
   for i in arr'First..arr'Last loop
      arr(i) := Long_Integer(i);
      Put(arr(i)'Image);
      if(i /= arr'Last) then
         Put(", ");
      else
         Put_Line("");
      end if;
   end loop;

   -- calculate sum
   Put_Line(TotalSum(arr)'Image);
end Main;
