# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

def sum
  number = 1
  1000.times do
    number *= 2
  end
  return number
end

def sum_of_digits
  total = 0
  sum.to_s.each_char {|x| total += x.to_i }
  return total
end

puts sum_of_digits
