# frozen_string_literal: true

def make_array(rows, columns)
  new_array = Array.new(rows, Array.new(columns, [1...columns]))
  p new_array
end

make_array(3, 3)
