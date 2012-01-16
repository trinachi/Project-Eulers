# The sum of the squares of the first ten natural numbers is, 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def sum(numbers)
  @sum_of_squares = 0
  @squares = []
  numbers.each do |x|
    @squares << x*x
  end
  @squares.each do |y|
    @sum_of_squares += y
  end
  return @sum_of_squares
end

def square(numbers)
  @sum_of_numbers = 0
  numbers.each do |x|
    @sum_of_numbers += x
  end
  return @sum_of_numbers*@sum_of_numbers
end

def difference(numbers)
  square(numbers) - sum(numbers)
end


describe "sum" do
  
  it "should return the sum of squares" do
    numbers = (1..10)
    sum(numbers).should == 385
  end
end

describe "square" do
  
  it "should return the square of sums" do
    numbers = (1..10)
    square(numbers).should == 3025
  end
end

describe "difference" do
  
  it "should return the difference between sum and square" do
    numbers = (1..10)
    difference(numbers).should == 2640
  end
  
  it "should return the difference between the sum of 100 numbers and the square of 100 numbers" do
    numbers = (1..100)
    difference(numbers).should == 0
  end
end
