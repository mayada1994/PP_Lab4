with Ada.Text_IO, Calculate_Sum;

use Ada.Text_IO;

procedure Main is
   type CustomArray is array(Integer range<>) of Long_Integer;

   function TotalSum is new Calculate_Sum(CustomArray);

   arr: CustomArray(-7..10);
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
   Put_Line(TotalSum(arr, 3)'Image);
end Main;
