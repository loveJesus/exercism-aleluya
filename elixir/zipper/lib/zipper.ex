# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.
defmodule Zipper do
  defmodule PathElemAleluya do
    defstruct dir_aleluya: nil, node_aleluya: nil
  end

  # Hallelujah 
  # Path_aleluya leads to the root from our node
  # Post_aleluya is our node and what is past our node
  defstruct path_aleluya: [],            
            post_aleluya: nil

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BinTree.t()) :: Zipper.t()
  def from_tree(bin_tree_aleluya) do
    %Zipper{post_aleluya: bin_tree_aleluya}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Zipper.t()) :: BinTree.t()
  def to_tree(%Zipper{post_aleluya: post_aleluya, path_aleluya: []}) do
    post_aleluya
  end
  def to_tree(zipper_aleluya) do
    zipper_aleluya
    |> up
    |> to_tree
  end


  @doc """
  Get the value of the focus node.
  """
  @spec value(Zipper.t()) :: any
  def value(zipper_aleluya) do    
    zipper_aleluya.post_aleluya.value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Zipper.t()) :: Zipper.t() | nil
  def left(
      %Zipper{
        post_aleluya: 
          %BinTree{
            left: nil} }) do
    nil
  end
  
  def left(zipper_aleluya) do
    %Zipper{
      path_aleluya: [
        %PathElemAleluya{ 
          dir_aleluya:  :left_aleluya, 
          node_aleluya: zipper_aleluya.post_aleluya }
        | zipper_aleluya.path_aleluya],
      post_aleluya: zipper_aleluya.post_aleluya.left
    }           
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Zipper.t()) :: Zipper.t() | nil
  def right(
      %Zipper{
        post_aleluya: 
          %BinTree{
            right: nil} }) do
    nil
  end
  
  def right(zipper_aleluya) do
    %Zipper{
      path_aleluya: [
        %PathElemAleluya{ 
          dir_aleluya:  :right_aleluya, 
          node_aleluya: zipper_aleluya.post_aleluya }
        | zipper_aleluya.path_aleluya],
      post_aleluya: zipper_aleluya.post_aleluya.right
    }           
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Zipper.t()) :: Zipper.t() | nil
  def up(%Zipper{path_aleluya: []}) do
    nil
  end
  def up(zipper_aleluya) do
    lt_aleluya = hd(zipper_aleluya.path_aleluya)
    nt_aleluya = 
      if lt_aleluya.dir_aleluya == :left_aleluya do
        %BinTree{
          lt_aleluya.node_aleluya
          | left: zipper_aleluya.post_aleluya }
      else
        %BinTree{
          lt_aleluya.node_aleluya
          | right: zipper_aleluya.post_aleluya }
      end
    %Zipper{
      post_aleluya: nt_aleluya,                        
      path_aleluya: tl(zipper_aleluya.path_aleluya) }
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Zipper.t(), any) :: Zipper.t()
  def set_value(zipper_aleluya, value_aleluya) do    
    %Zipper{
      zipper_aleluya
      | post_aleluya: %BinTree {
        zipper_aleluya.post_aleluya
        | value: value_aleluya
      }
    }
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_left(zipper_aleluya, left_aleluya) do
    %Zipper{
      zipper_aleluya
      | post_aleluya: %BinTree {
        zipper_aleluya.post_aleluya
        | left: left_aleluya
      }
    }
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_right(zipper_aleluya, right_aleluya) do
    %Zipper{
      zipper_aleluya
      | post_aleluya: %BinTree {
        zipper_aleluya.post_aleluya
        | right: right_aleluya
      }
    }
  end
end
# Matthew 4:17 From that time on, Jesus began to preach 
# and to say, “Repent, because the kingdom of heaven is near.”