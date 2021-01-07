(* For God so loved the world, that He gave His only begotten Son, 
that all who believe in Him should not perish but have everlasting life. *)
open Base;;

type nucleotide = A | C | G | T

let hamming_distance (s1_aleluya : nucleotide list) (s2_aleluya : nucleotide list) =

  let rec calc_score_aleluya (acc_aleluya : int) ( list_aleluya : (nucleotide * nucleotide) list) =
    match list_aleluya with
      [] -> acc_aleluya
      | (item1_aleluya, item2_aleluya) :: tl_aleluya ->
        let new_score_aleluya =
          if item1_aleluya == item2_aleluya then
            acc_aleluya 
          else
            acc_aleluya + 1 in
        calc_score_aleluya new_score_aleluya tl_aleluya in

  match List.zip s1_aleluya s2_aleluya  with
    Ok(zlist_aleluya) -> 
      Ok (calc_score_aleluya 0 zlist_aleluya)
    | _ -> 
      if List.length s1_aleluya = 0 then
        Error "left strand must not be empty"
      else if List.length s2_aleluya = 0 then
        Error "right strand must not be empty" 
      else 
        Error "left and right strands must be of equal length"

    
  

