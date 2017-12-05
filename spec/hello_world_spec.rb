require "hello_world"
require 'string_analyzer'
describe HelloWorld do 
  context "When testing the HelloWorld class" do 
    
    it "should say 'Hello World' when we call the say_hello method" do 
      hw = HelloWorld.new 
      message = hw.say_hello 
      expect(message).to eq "Hello World!"
    end
    
  end  
end

describe StringAnalyzer do 
  context "With valid input" do 
      
    it "should detect when a string contains vowels" do 
      sa = StringAnalyzer.new 
      test_string = 'ae' 
      expect(sa.has_vowels? test_string).to be true 
    end 
    
    it "should detect when a string doesn't contain vowels" do 
      sa = StringAnalyzer.new 
      test_string = 'khkjh' 
      expect(sa.has_vowels? test_string).to be false
    end 
      
  end 
end


describe "An example of the comparison Matchers" do

   it "should show how the comparison Matchers work" do
      a = 1
      b = 2
      c = 3   
      d = 'test string'
      
      # The following Expectations will all pass
      expect(b).to be > a
      expect(a).to be >= a 
      expect(a).to be < b 
      expect(b).to be <= b 
      expect(c).to be_between(1,3).inclusive 
      expect(b).to be_between(1,3).exclusive 
      expect(d).to match /TEST/i 
   end
   
end

describe "An example of the type/class Matchers" do
 
   it "should show how the type/class Matchers work" do
      x = 1 
      y = 3.14 
      z = 'test string' 
      
      # The following Expectations will all pass
      expect(x).to be_instance_of Fixnum 
      expect(y).to be_kind_of Numeric 
      expect(z).to respond_to(:length) 
   end
   
end

describe "An example of the true/false/nil Matchers" do
   it "should show how the true/false/nil Matchers work" do
      x = true 
      y = false 
      z = nil 
      a = "test string" 
      
      # The following Expectations will all pass
      expect(x).to be true 
      expect(y).to be false 
      expect(a).to be_truthy 
      expect(z).to be_falsey 
      expect(z).to be_nil 
   end 
end


describe "An example of the error Matchers" do 
   it "should show how the error Matchers work" do 
      
      # The following Expectations will all pass 
      expect { 1/0 }.to raise_error(ZeroDivisionError)
      expect { 1/0 }.to raise_error("divided by 0") 
      expect { 1/0 }.to raise_error("divided by 0", ZeroDivisionError) 
   end 
end
