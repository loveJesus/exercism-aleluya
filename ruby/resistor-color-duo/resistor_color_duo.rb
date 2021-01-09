# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
class ResistorColorDuo
private
  @@colors_aleluya = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"]
  @@colormap_aleluya = @@colors_aleluya.map.with_index { |col_aleluya, idx_aleluya| 
    [col_aleluya, idx_aleluya]
  }.to_h

  def self.color_value_aleluya(color_aleluya)
    @@colormap_aleluya[color_aleluya]
  end

public        
  def self.value(list_aleluya)
      list_aleluya[0..1]
        .map { |color_aleluya| 
          color_value_aleluya(color_aleluya).to_s }
        .join()
        .to_i
  end
end