class Image

  def initialize (pixels)
    @pixels = pixels
  end

  def one_coordinates
    one_coordinates = []
    @pixels.each_with_index do |row, row_number|
      row.each_with_index do |pixel, col_number|
        if pixel == 1
          one_coordinates << [row_number, col_number]
        end
      end
    end
    one_coordinates
  end

  def blur(distance)
    ones = one_coordinates
      @pixels.each_with_index do |row, row_number|
        row.each_with_index do |pixel, col_number|
          ones.each do |found_row_number, found_col_number|

            if row_number == found_row_number && col_number == found_col_number
              @pixels[row_number][col_number -1] = 1 unless col_number == 0
              @pixels[row_number][col_number +1] = 1 unless col_number == 3
              @pixels[row_number -1][col_number] = 1 unless row_number == 0
              @pixels[row_number +1][col_number] = 1 unless row_number == 3
            end
          end
        end
      end
  end

