# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

def primes
  @factors = []
  factor = 2
  n = 600851475143
  while n>1
    @factors << factor and n /= factor while n%factor == 0
    factor += 1
  end
  return @factors.collect! {|x| x.to_s + ",\s"}.sort
end

primes
puts @factors.to_s
puts "largest prime factor: " + @factors.last.to_s


