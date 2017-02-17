module Enumerable
  
  def my_each                     #MY_EACH
    return self.to_enum unless block_given?
    for i in self
      yield(i)
    end
  end
  
  def my_each_with_index          #MY_EACH_WITH_INDEX
    return self.to_enum unless block_given?
    i = 0
    for j in self
      yield(j, i)
      i += 1
    end
  end
  
  def my_select                   #MY_SELECT
    return self.to_enum unless block_given?
    sel = []
    self.my_each do |i|
      if yield(i)
        sel.push(i)
      end
    end
    sel
  end
    
  def my_all?                   #MY_ALL
    return self.to_enum unless block_given?
    self.my_each do |i|
      if !yield(i)
        return false
      end
      return true
    end
  end
    
  def my_any?              #MY_ANY
    return self.to_enum unless block_given?
    self.my_each do |i|
      if yield(i)
        return true
      end
      return false
    end
  end
    
  def my_none?              #MY_NONE
    return self.to_enum unless block_given?
    self.my_each do |i|
      if !yield(i)
        return true
      end
      return false
    end
  end
    
  def my_count         #MY_COUNT
    return self.to_enum unless block_given?
    count = 0
    self.my_each do |i|
      if yield(i)
        count += 1
      end
    end
    count
  end
    
  def my_map                    #MY_MAP
    return self.to_enum unless block_given?
    sel = []
    self.my_each do |i|
      sel.push(yield(i))
    end
    sel
  end
    
  def my_inject            #MY_INJECT
    return self.to_enum unless block_given?
    result = self[0]
    self.my_each_with_index do |x, index|
      if index > 0
        result = yield(result,x)
      end
    end
    result
  end
  
  def my_map_proc(proc)     #MY_MAP_PROC
    raise(NameError, 'Argument is not given') if defined?(proc) == nil
    result = []
    self.my_each do |x|
      result.push(proc.call(x))
    end
    result
  end
  
  def my_map_proc_block(*proc)   #MY_MAP_PROC_BLOCK
    result = []
    self.my_each do |x|
      if proc.length > 0
        result.push(proc[0].call(x))
      else
        result.push(yield(x))
      end
    end
    result
  end
  
end

=begin
  
puts "\nProbando #my_each"
[1, 2, 3, 4, 5].my_each do |x|
  print "#{x} "
end

puts "\n\nProbando #my_each_with_index"
[1, 2, 3, 4, 5].my_each_with_index do |x, i|
  print "#{x} is in #{i}. "
end

puts "\n\nProbando #my_select"
p [1, 2, 3, 4, 5].my_select { |x| x.odd? }

puts "\nProbando #my_all?"
puts [1, 2, 3, 4, 5].my_all? { |x| x <= 5 }
puts [1, 2, 3, 4, 5].my_all? { |x| x > 5 }

puts "\nProbando #my_any?"
puts [1, 2, 3, 4, 5].my_any? { |x| x <= 4 }
puts [1, 2, 3, 4, 5].my_any? { |x| x > 5 }

puts "\nProbando #my_none?"
puts [1, 2, 3, 4, 5].my_none? { |x| x > 10 }
puts [1, 2, 3, 4, 5].my_none? { |x| x <= 5 }

puts "\nProbando #my_count"
puts [1, 2, 3, 4, 5].my_count { |x| x.odd? }

puts "\nProbando #my_map"
p [1, 2, 3, 4, 5].my_map { |x| x + 1 }

puts "\nProbando #my_inject"
p [1, 2, 3, 4, 5].my_inject { |x, i| x + i }

puts "\nProbando #my_map_proc"
proc = Proc.new { |x| x + 100 }
p [1, 2, 3, 4, 5].my_map_proc(proc)

puts "\nProbando #my_map_proc_block"
proc1 = Proc.new { |x| x + 10 }
p [1, 2, 3, 4, 5].my_map_proc_block(proc1)
p [1, 2, 3, 4, 5].my_map_proc_block { |x| x * 10 }

=end
