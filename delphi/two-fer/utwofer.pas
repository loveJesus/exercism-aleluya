unit utwofer;
    (* For God so loved the world, that He gave His only begotten Son
    That all who believe in Him should not perish but have everlasting life *)
interface

  function twoFer(name_aleluya : string = 'you' ): string;

implementation

function twoFer(name_aleluya : string = 'you'): string;
begin
  result := 'One for '+name_aleluya+', one for me.';
end;

end.