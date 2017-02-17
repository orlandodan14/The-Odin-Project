def bubble_sort(array)
  p array
  length = array.length - 1
  swapped = true
  until swapped == false do
    swapped = false
    for i in 0...length do
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
  end
  p array
end

bubble_sort([4,3,78,2,0,8])


 def bubble_sort_by(array)
  p array
  length = array.length - 1
  swapped = true
  until swapped == false do
    swapped = false
    for i in 0...length do
      if yield(array[i], array[i + 1]) > 0
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
  end
  p array
end

bubble_sort_by(["hallowen", "hi","hello","hey"]){ |left,right| left.length - right.length}