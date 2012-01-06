# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def products
  @number_combinations = []
  @numbers.each do |i|
    @numbers.each do |j|
      @number_combinations << i*j
    end
  end
  return @number_combinations.uniq
end

def palindromic_numbers
  @palindromic_array = []
  products.each do |i|
    number = i.to_s.chars.map(&:to_i)
      if number.count == 2
        @palindromic_array << number if number[0] == number[1]
      elsif even?(number)
        @palindromic_array << number if is_palindrome?(number)
    end
  end
  return @palindromic_array.map! {|x| "#{x}".to_i }.sort
end

def even?(number)
  number.count%2 == 0
end

def is_palindrome?(number)
  number[0,(number.count/2)] == number[(number.count/2),(number.count/2)].reverse
end

describe "palindromic_numbers" do
  
  it "should return an array with the product of each number combination" do
    @numbers = [2, 3]
    products.should == [4, 6, 9]
  end
  
  it "should find two-digit palindromic numbers" do
    @numbers = [1, 2, 3, 9, 11]
    palindromic_numbers.should == [11, 22, 33, 99]
  end
  
  it "should find four-digit palindromic numbers" do
    @numbers = [91, 99]
    palindromic_numbers.should == [9009]
  end
  
  it "should find palindromes from the product of other 2 two-digit numbers" do
    @numbers = (10..50)
    palindromic_numbers.should == [1221, 1551, 2112]
  end
  
  # it "should find the largest six-digit palindrome from the product of two 3-digit numbers" do
  #    @numbers = (100..999)
  #    palindromic_numbers.last.should == []
  #    # caution: takes forever to run this calculation
  # end
    
end
  