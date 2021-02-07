# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.

defmodule ListOps do
  defp count_aleluya([], acc_aleluya) do    
    acc_aleluya
  end
  defp count_aleluya([_lh_aleluya | lt_aleluya], acc_aleluya ) do
    count_aleluya( lt_aleluya, acc_aleluya + 1 )      
  end
  
  @spec count(list) :: non_neg_integer
  def count(list_aleluya) do
    count_aleluya(list_aleluya, 0)
  end


  defp reverse_aleluya( [],  acc_aleluya) do
    acc_aleluya
  end
  defp reverse_aleluya( [lh_aleluya | lt_aleluya], acc_aleluya ) do
    reverse_aleluya( lt_aleluya, [lh_aleluya | acc_aleluya] )
  end

  @spec reverse(list) :: list
  def reverse(list_aleluya) do
    reverse_aleluya( list_aleluya, [])
  end


  defp map_aleluya([], acc_aleluya, _fun_aleluya) do
    reverse(acc_aleluya)
  end
  defp map_aleluya([lh_aleluya | lt_aleluya], acc_aleluya, fun_aleluya) do
    map_aleluya( 
      lt_aleluya, 
      [fun_aleluya.(lh_aleluya) | acc_aleluya], 
      fun_aleluya)
  end

  @spec map(list, (any -> any)) :: list
  def map(list_aleluya, fun_aleluya) do
    map_aleluya(list_aleluya, [], fun_aleluya)
  end



  defp filter_aleluya([], acc_aleluya, _fun_aleluya) do
    reverse(acc_aleluya)
  end
  defp filter_aleluya([lh_aleluya | lt_aleluya], acc_aleluya, fun_aleluya) do
    if fun_aleluya.(lh_aleluya), 
      do: filter_aleluya(
            lt_aleluya, 
            [lh_aleluya | acc_aleluya], 
            fun_aleluya),
    else: filter_aleluya(
            lt_aleluya, 
            acc_aleluya,  
            fun_aleluya)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list_aleluya, fun_aleluya) do
    filter_aleluya(list_aleluya, [], fun_aleluya)
  end



  defp reduce_aleluya([], acc_aleluya, _fun_aleluya) do
    acc_aleluya
  end
  defp reduce_aleluya([lh_aleluya | lt_aleluya], acc_aleluya, fun_aleluya) do
    reduce_aleluya( 
      lt_aleluya, 
      fun_aleluya.(lh_aleluya, acc_aleluya), 
      fun_aleluya)
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(list_aleluya, acc_aleluya, fun_aleluya) do
    reduce_aleluya(list_aleluya, acc_aleluya, fun_aleluya)
  end



  defp append_aleluya([], lacc_aleluya) do
    lacc_aleluya
  end
  defp append_aleluya([lh_aleluya | lt_aleluya], lacc_aleluya ) do
    append_aleluya( lt_aleluya, [lh_aleluya | lacc_aleluya])
  end

  @spec append(list, list) :: list
  def append(la_aleluya, lb_aleluya) do
    append_aleluya(reverse(la_aleluya), lb_aleluya)
  end



  @spec concat([[any]]) :: [any]
  def concat(lists_aleluya) do
    reduce(lists_aleluya, [], &append_aleluya/2)
    |> reverse
  end
end
