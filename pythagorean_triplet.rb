# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def hypotenuse(values)
  @product = 1
  values.each do |a|
    values.each do |b|
      c = Math.hypot(a,b)
      if c%1 == 0 && a + b + c == 1000
        @product = a * b * c
      end
    end
  end
  return @product
end


describe "hypotenuse" do
  it "should return the product of abc" do
    values = (1..500).to_a
    hypotenuse(values).should == 31875000 # answer to this problem
  end
end
  


