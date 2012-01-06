# Considering the terms in the Fibonacci sequence whose values do not exceed four million, 
# find the sum of the even-valued terms.

def fibonacci
  @sequence = [1,1]
  x = 0
  while (@sequence[x+1] < 4e+6)
    @sequence << @sequence[x] + @sequence[x+1]
    x += 1
  end
  even? x
end

def even?(x)
  @sequence.delete_if {|i| i%2 != 0 }
  sum_of_even_numbers
end

def sum_of_even_numbers
  total = 0
  @sequence.each do |i| 
    total += i
  end
  puts "Total: " + total.to_s
end

fibonacci
