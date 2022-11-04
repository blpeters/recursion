def fibs(num)
  fib_arr = []
  for i in 0..num
    fib_arr[i] = i if i < 2
    fib_arr[i] = fib_arr[i-1] + fib_arr[i-2] if i >= 2
  end
  fib_arr
end

def fibs_rec(num)
  if num == 0
    [0]
  elsif num == 1
    [0, 1]
  else
    array = fibs_rec(num - 1)
    array << array[-1] + array[-2]
  end
end

def merge_sort(arr)
  return arr if arr.length < 2

  # else sort right half, sort left half
  left_half = arr[0...(arr.length / 2)]
  right_half = arr[(arr.length / 2)..]
  sorted_left = merge_sort(left_half)
  sorted_right = merge_sort(right_half)
  sorted_array = merge(sorted_left, sorted_right)
end

def merge(left, right)
  sorted_arr = []
  left_index = 0
  right_index = 0
  while left_index < left.length && right_index < right.length
    if left.empty?
      sorted_arr.push(right)
    elsif right.empty?
      sorted_arr.push(left)
    elsif left[left_index] <= right[right_index]
      sorted_arr.push(left[left_index])
      left_index += 1
    else 
      sorted_arr.push(right[right_index])
      right_index += 1
    end
  end

  if left_index == left.length
    sorted_arr.concat(right[right_index..right.length])
  elsif right_index == right.length
    sorted_arr.concat(left[left_index..left.length])
  end

  sorted_arr
end
    
p fibs(6)
p fibs_rec(6)

p merge_sort([5,1])
p merge_sort([5,1,3,6,2,4,8,7])
p merge_sort([5,67,8,99,0,1,1156,55,326,900,3,8,2,79,222,555])