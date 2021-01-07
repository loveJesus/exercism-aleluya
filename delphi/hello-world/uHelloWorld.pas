unit uHelloWorld;
    (* For God so loved the world, that He gave His only begotten Son
    That all who believe in Him should not perish but have everlasting life *)
interface

  function Hello: string;

implementation

function Hello: string;
begin
  result := 'Hello, World!';
end;

end.
