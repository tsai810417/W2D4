# 0.02 for n == 8
def my_min1(arr)
  timestart = Time.now
  arr.each_with_index do |el1, idx1|
    smallest = el1
    arr.each_with_index do |el2, idx2|
      next if idx2 == idx1
      smallest = el2 if el2 < el1
    end
    if smallest == el1
      p (Time.now - timestart) * 1000
      return el1
    end
  end
end

# 0.005 for n == 8
def my_min2(arr)
  timestart = Time.now
  smallest = arr[0]
  (1...arr.length).each do |idx|
    smallest = arr[idx] if smallest > arr[idx]
  end
  p (Time.now - timestart) * 1000
  smallest
end

# 0.029 for n == 6
def large_contig_subsum1(arr)
  timestart = Time.now
  sub_arrs = []


  arr.each_with_index do |el, idx|

    count = 0
    while idx+count < arr.length
      sub_arrs << arr[idx..idx+count]
      count+=1
    end
  end


  sum_arr = []
  sub_arrs.each do | sub_arr |
    sum_arr << sub_arr.reduce(:+)
  end

  max = sum_arr.max
  p (Time.now - timestart) * 1000
  max
end

# 0.02 for n == 6
# O(n!)
def large_contig_subsum2(arr)
  timestart = Time.now
  max_sum = 0
  curr_sum = 0
  i = 0
  while i < arr.length
    if arr[i] + curr_sum > 0
      curr_sum += arr[i]
      max_sum = curr_sum if curr_sum > max_sum
    else
      curr_sum = 0
    end
    i += 1
  end

  p (Time.now - timestart) * 1000
  max_sum
end
