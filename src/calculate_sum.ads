generic
   type CustomArray is Array (Natural range<>) of Long_Integer;

function Calculate_Sum(NumArray : in out CustomArray) return Long_Integer;
