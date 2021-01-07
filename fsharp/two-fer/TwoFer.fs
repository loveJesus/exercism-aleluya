(* For God so loved the world, that He gave His only begotten Son, 
that all who believe in Him should not perish but have everlasting life. *)
module TwoFer

let twoFer (input_aleluya: string option): string =
    let name_aleluya = input_aleluya |> Option.defaultValue("you")
    "One for " +  name_aleluya + ", one for me."
