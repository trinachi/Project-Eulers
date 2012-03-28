# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. 
# For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
# The use of "and" when writing out numbers is in compliance with British usage.

def initialize_values
  @three = [1,2,6,10]
  @four = [4,5,9]
  @five = [3,7,8,40,50,60]
  @six = [11,12,20,30,80,90]
  @seven = [14,15,16,70]
  @eight = [13,19]
  @nine = [17,18]
end

def extra(value)
  total = 0
  digit_array = [@three, @four, @five, @six, @seven, @eight, @nine]
  digit_array.each do |x|
    total += digit_array.index(x)+3 if x.include?(value)
  end
  return total
end


def letter_count
  total = 0
  digit = []
  parsed_digits = @digit.to_s.each_char {|x| digit << x.to_i }
  while digit.length > 0
    digit.shift if digit[0] == 0
    total += 8 + extra(digit[0]) if digit.length == 4 # thousand
    total += 10 + extra(digit[0]) if digit.length == 3 && digit[1] + digit[2] != 0 # x hundred and
    total += 7 + extra(digit[0]) if digit.length == 3 && digit[1] + digit[2] == 0 # hundred
    total += extra(digit[0]*10) if digit.length == 2 && digit[0] > 1 # tens
    if digit.length == 2 && digit[0] == 1 #teens
      total += extra((digit[0].to_s + digit[1].to_s).to_i) 
      digit.shift(2)
    end
    total += extra(digit[0]) if digit.length == 1
    digit.shift
  end
  return total
end

def sum_of_letters
  sum = 0
  (1..@number).each do |x|
    @digit = x
    sum += letter_count
  end
  return sum
end

describe "letter_count" do 
  it "should return 21 if the number is 1600" do
    @digit = 1600
    initialize_values
    letter_count.should == 21
  end
  
  it "should return 23 if the number is 342" do
    @digit = 342
    initialize_values
    letter_count.should == 23
  end
  
  it "should return 20 if the number is 115" do
    @digit = 115
    initialize_values
    letter_count.should == 20
  end
  
  it "should return the sum of letters for 1000" do
    @digit = 1000
    initialize_values
    letter_count.should == 11
  end
end

describe "sum_of_letters" do
  it "should return the number of letters in the written words of 1 - 10" do
    @number = 10
    initialize_values
    sum_of_letters.should == 39
  end
  
  it "should return the number of letters in the written words of 1 - 1000" do
    @number = 1000
    initialize_values
    sum_of_letters.should == 21124
  end
end
