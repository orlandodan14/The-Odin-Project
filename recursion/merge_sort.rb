def order(a1, a2, result = [])
  until a1.empty? || a2.empty?
    if a1.first <= a2.first
      result << a1.shift
    elsif a2.first <= a1.first
      result << a2.shift
    end
  end
  until a1.empty?
    result << a1.shift
  end
  until a2.empty?
    result << a2.shift
  end
  result
end

def merge_sort(array)
  return array if array.size <= 1
  a1 = array[0..((array.length/2 - 1))]
  a2 = array[(array.length/2)..(array.length-1)]
  a1 = merge_sort(a1)
  a2 = merge_sort(a2)
  order(a1, a2)
end



array = [56, 21, 11, 19, 86, 7, 42, 38]
print merge_sort(array)
