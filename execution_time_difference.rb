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
      p Time.now
  end

  max = sum_arr.max
  p (Time.now - timestart) * 1000
  max
end

# 0.02 for n == 6
def large_contig_subsum2(arr)
  timestart = Time.now
  max_sum = arr[0] + arr[1]
  arr[0...-1].each_index do | idx |
    p Time.now
    cur_el = arr[idx]
    j = idx + 1
    while j < arr.length
      sub_sum = arr[idx..j].reduce(:+)
      max_sum = sub_sum if sub_sum > max_sum
      j += 1
    end
  end

  p (Time.now - timestart) * 1000
  max_sum
end
