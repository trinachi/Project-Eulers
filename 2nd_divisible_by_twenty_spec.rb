# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def min_divisor_array
  divisor = (1..@number).to_a
  divisor.reverse.each do |x|
    divisor.each do |y|
      divisor.delete_if {|y| x%y == 0 && x > y}
    end
  end
  return divisor
end

def smallest_number?
  divisors = min_divisor_array
  smallest = []
  smallest_number = @number
  while smallest[0] == nil
    smallest << smallest_number
    smallest_number += @number
    divisors.each do |y|
      smallest.delete_if { smallest[0]%y != 0 }
    end
  end
  return smallest.uniq.sort.first
end

describe "min_divisor_array" do
  it "should contain divisors 2 and 3" do
    @number = 3
    min_divisor_array.should == [2,3]
  end
  
  it "should not contain duplicate divisors" do
    @number = 10
    min_divisor_array.should == [6,7,8,9,10]
  end
end

describe "smallest_number?" do
  
  it "should be divisible by 2" do
    @number = 2
    smallest_number?.should == 2
  end
  
  it "should be divisible by 3 and 2" do
    @number = 3
    smallest_number?.should == 6
  end
  
  it "should be divisible by numbers 1 - 10" do
    @number = 10
    smallest_number?.should == 2520
  end
  
  it "should be divisible by numbers 1 - 20" do
     @number = 20
     smallest_number?.should == 0
   end
  
end
