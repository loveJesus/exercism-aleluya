-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
CREATE OR REPLACE PACKAGE hello_world# IS
   FUNCTION hello(
      i_name_aleluya                                        varchar2 := ''
   )
      RETURN varchar2;
-- Jesus Christ is Lord
END hello_world#;
/

CREATE OR REPLACE PACKAGE BODY hello_world# IS
   FUNCTION hello(
      i_name_aleluya                                        varchar2 := ''
   )
      RETURN varchar2
   AS
   BEGIN
       IF i_name_aleluya IS NULL THEN
          RETURN 'Hello, World!';
       ELSE
          RETURN CONCAT('Hello, ', CONCAT(i_name_aleluya, '!'));
       END IF;
   END hello;
END hello_world#;
/
