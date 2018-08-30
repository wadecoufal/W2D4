


def my_min_phase1(list)
  i = 0
  min = 1.0/0.0
  
  while i < list.count-1
    j = i + 1
    sub_min = 1.0/0.0
    while j < list.count
      sub_min = list[j] if list[j] < sub_min
      j += 1
    end
    min = sub_min if sub_min < min
    i += 1
  end
  min
end

def my_min_phase2(list)
  list.reduce(1.0/0.0) do |min, num|
    if num < min
      num
    else
      min
    end
  end
end


def largest_subsum_phase1(list)
  
  subarrs = []
  
  i = 0
  while i < list.length
    j = i
    while j < list.length
      subarrs << list[i..j]
      j += 1
    end
    i += 1
  end
    
  subarrs.map do |arr|
    arr.reduce(:+)
  end.max
end


def largest_subsum_phase2(list)
  return list.max if list.all? { |num| num < 0 }
  
  largest = 0
  current = 0
  list.each do |el|
    current = 0 if current < 0
    current += el
    largest = current if current > largest
  end 
  largest
end 


if __FILE__ == $PROGRAM_NAME
  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
  list2 = [5, 3, -7]
  list3 = [2, 3, -6, 7, -6, 7]
  list4 = [-5, -1, -3]
  
  p largest_subsum_phase2(list2) # 8
  p largest_subsum_phase2(list3) # 8
  p largest_subsum_phase2(list4) # -1
  
  # p my_min_phase1(list) # -5
  # p my_min_phase2(list) 
  
end