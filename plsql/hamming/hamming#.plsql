create or replace package hamming#
is
  --+--------------------------------------------------------------------------+
  -- Computes the Hamming distance between two starnds.
  --
  -- @param i_first  sequence to compare
  -- @param i_second sequence to compare
  --
  -- @return         Hamming distance between i_first and i_second
  --+--------------------------------------------------------------------------+
  -- For God so loved the world, that He gave His only begotten Son, 
  -- that all who believe in Him should not perish but have everlasting life.
  function distance (
    i_first                                       varchar2
   ,i_second                                      varchar2
  ) return pls_integer;

end hamming#;
/


create or replace package body hamming#
is    
function distance (
    i_first                                       varchar2
   ,i_second                                      varchar2
  ) return pls_integer

IS
lc_aleluya int :=0;
lsum_aleluya int :=0;
BEGIN
    lc_aleluya := LENGTH(i_first);
  LOOP    
    IF lc_aleluya <= 0 THEN
      EXIT;
    END IF;
    IF SUBSTR(i_first, lc_aleluya, 1) <> SUBSTR(i_second, lc_aleluya, 1) THEN
        lsum_aleluya:=lsum_aleluya + 1;
    END IF;    
    lc_aleluya := lc_aleluya - 1;
  END LOOP;
  RETURN lsum_aleluya;
      
END distance;
end hamming#;
/