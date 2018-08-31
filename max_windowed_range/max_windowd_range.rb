require 'byebug'

def max_windowed_range_naive(arr, size)
  size -= 1
  max_sum = -Float::INFINITY
  beginning = nil
  ending = nil
  i = 0
  while i < arr.count - size
    j = i + size
    window = arr[i..j]
    current_sum = window_sum(window)
    if current_sum > max_sum
      max_sum = current_sum
      beginning = i
      ending = j
    end
    i += 1
  end
  # byebug
  max_sum
end

def window_sum(window)
  window.max - window.min
end


def max_win



if __FILE__ == $PROGRAM_NAME

  p max_windowed_range_naive([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
  p max_windowed_range_naive([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
  p max_windowed_range_naive([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
  p max_windowed_range_naive([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

end
