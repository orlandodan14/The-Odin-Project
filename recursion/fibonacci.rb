def fibs(n)
  result = []
  (0..n).each do |num|
    if num < 2
      result << num
    else
      result << result[-2] + result[-1]
    end
  end
  print result, "\n\n"
end


def fibs_sec(n, result = [0, 1])
  if n > 1
    result << result[-2] + result[-1]
    fibs_sec(n-1, result)
  end
  result
end

puts "Fobonacci with iteration:"
fibs(10)

puts "Fibonacci with recursive:"
print fibs_sec(10)
