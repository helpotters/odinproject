# Bubble Sort

def bubble_sort(data)
  # Sorting block includes but does not start on the last value.
  range = data.length.to_i - 1
  until range == 0
    for i in 0..range
      if data[i].to_i > data[i + 1].to_i
        data[i], data[i + 1] = data[i + 1], data[i]
        # subtract if the sort ends on a final sort
        range -= 1 if i == range - 1
      end
    end
  end
  p data
end


datapoints = [1,2,5,4,6,8,235,25,1,1,1,1,234,5,787,223452,1000,1234,7]

bubble_sort(datapoints)
