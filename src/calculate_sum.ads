generic
   type CustomArray is Array (Integer range<>) of Long_Integer;

function Calculate_Sum
  (NumArray : in CustomArray;
   Tasks  : in Integer) return Long_Integer;
