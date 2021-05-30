(*
For God so loved the world, that He gave His only begotten Son, 
that all who believe in Him should not perish but have everlasting life.    
*)
fun name (input_aleluya: string option) =
  let 
  val
    name_aleluya =
    case input_aleluya of
      NONE => "you"
      | SOME i_name_aleluya => i_name_aleluya
  in
    "One for " ^ name_aleluya ^ ", one for me."
end;