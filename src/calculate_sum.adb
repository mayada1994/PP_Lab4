with Ada.Text_IO, Calculate_Sum;

use Ada.Text_IO;

function Calculate_Sum
  (NumArray : in CustomArray;
   Tasks  : in Integer) return Long_Integer is

   function PartialSum (First, Last : in Integer) return Long_Integer;

   task type SumCalculator is
      entry Start (First, Last : in Integer);

      entry Stop (Result : out Long_Integer);
   end;

   task body SumCalculator is
      First, Last : Integer;
      Sum : Long_Integer;
   begin
      accept Start (First, Last : Integer) do
         SumCalculator.First := First;
         SumCalculator.Last  := Last;
      end Start;

      Sum := PartialSum (First, Last);

      Put("Range: ");Put(First'Image);Put("..");Put(Last'Image);Put(", Partial sum: ");Put_Line(Sum'Image);

      accept Stop (Result : out Long_Integer) do
         Result := Sum;
      end Stop;
   end SumCalculator;

   function PartialSum (First, Last : in Integer) return Long_Integer is
      Sum : Long_Integer := 0;
   begin
      for i in First .. Last loop
         Sum := Sum + NumArray (i);
      end loop;

      return Sum;
   end PartialSum;

   Sub_Length : constant Integer := NumArray'Length / Tasks;
   SumCalcTasks : array (0 .. Tasks - 1) of SumCalculator;


   Index  : Integer := NumArray'First;
   Next   : Integer;
   Sum    : Long_Integer;
   Subsum : Long_Integer;

begin

   for i in SumCalcTasks'Range loop
      Next := Index + Sub_Length;
      SumCalcTasks (i).Start (First => Index, Last => Next - 1);
      Index := Next;
   end loop;

   Sum := PartialSum (Index, NumArray'Last);

   for i in SumCalcTasks'Range loop
      SumCalcTasks (i).Stop (Subsum);
      Sum := Sum + Subsum;
   end loop;
   Put("Total sum: ");
   return Sum;
end Calculate_Sum;
