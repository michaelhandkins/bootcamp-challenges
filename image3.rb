class Image

  def initialize (pixels)
    @pixels = pixels
  end

  def get_ones
    ones = []
    @pixels.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur!(blur_distance)
    ones = get_ones

    @pixels.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        ones.each do |found_row_number, found_col_number|
          if manhattan_distance(col_number, row_number, found_col_number, found_row_number) <= blur_distance
            @pixels[row_number][col_number] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  def output_image
    @pixels.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])

# Image before manhattan distance blur
image.output_image
puts

# Manhattan distance blur applied
image.blur!(2)
image.output_image

