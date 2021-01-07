# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
class Matrix:
    def __init__(self, matrix_string_aleluya):
        self.matrix_aleluya = [ 
             [int(item_aleluya) for item_aleluya in line_aleluya.split(" ")]
             for line_aleluya 
             in matrix_string_aleluya.splitlines()]

    def row(self, index_aleluya):
        return self.matrix_aleluya[index_aleluya - 1]
        

    def column(self, index_aleluya):
        return [
             self.matrix_aleluya[rowidx_aleluya][index_aleluya - 1] 
             for rowidx_aleluya
             in range(len(self.matrix_aleluya)) ]
