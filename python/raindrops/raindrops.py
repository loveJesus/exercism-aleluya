# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life
def convert(number_aleluya):
    arr_aleluya = [ aleluya[1] 
          for aleluya in [(3,"Pling"),(5,"Plang"),(7,"Plong")] 
          if (number_aleluya % aleluya[0] == 0) ]

    if not(arr_aleluya):
        return str(number_aleluya)        
    else:
        return ''.join( arr_aleluya )
