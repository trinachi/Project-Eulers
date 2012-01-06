# Sum of multiples of 3 and 5 that are less than 1000

def find_multiples
  multiples = []
  (1...1000).each do |i|
    multiples << i if i%3 == 0 || i%5 == 0
  end
  return multiples
end

def add_values(multiples)
  total = 0
  multiples.each do |x|
    total += x
  end
  return total
end

multiples = find_multiples
total = add_values multiples
puts "Total: " + total.to_s