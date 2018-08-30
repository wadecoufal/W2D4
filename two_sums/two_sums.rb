require 'byebug'

# n^2
def two_sum_brute?(arr, target_sum)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      next if j <= i
      return true if el1 + el2 == target_sum
    end
  end
  false
end

# nlogn
def okay_two_sum?(arr, target_sum)
  sorted = arr.sort # nlogn
  sorted.each_with_index do |el, idx| # n
    target = target_sum - el
    temp_sort = sorted[0...idx] + sorted[idx+1..-1]
    val = binary_search(temp_sort, target) # log n
    # byebug
    return val if val
  end
  false
end

def binary_search(arr, target_sum)
  return false if arr.empty?
  return arr[0] == target_sum if arr.length == 1
  mid_i = arr.count / 2

  left = arr[0...mid_i]
  right = arr[mid_i + 1..-1]
  # byebug
  if arr[mid_i] == target_sum
    return true
  elsif arr[mid_i] > target_sum
    return binary_search(left, target_sum)
  else
    return binary_search(right, target_sum)
  end
  false
end


def best_two_sum?(arr, target_sum)
  counter = Hash.new
  arr.each do |el|
    target = target_sum - el
    counter[el] = target unless el == target
  end
  counter.keys.each do |key|
    return true if counter.has_value?(key)
  end
  false
end





if __FILE__ == $PROGRAM_NAME
  arr = [0, 1, 5, 7]
  p best_two_sum?(arr, 6) # => should be true
  p best_two_sum?(arr, 10) # => should be false
end
