require_relative '../lib/year'

RSpec.describe Year do
  context ".leap_year?" do
    it "should return true for a standard leap year" do
      year = Year.new(2012)
      year.leap_year?.should == true
    end
    it "should return false for a non-leap year" do
      year = Year.new(2010)
      year.leap_year?.should == false
    end
    it "should return false for special leap year (100 && !400)" do
      year = Year.new(2100)
      year.leap_year?.should == false
    end
    it "should return true for special leap year (100 && 400)" do
      year = Year.new(2000)
      year.leap_year?.should == true
    end
  end
  
end
