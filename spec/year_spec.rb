require_relative '../lib/year'

RSpec.describe Year do
  context ".leap_year?" do
    it "should return true for a standard leap year" do
      Year.leap_year?(2012).should == true
    end
    it "should return false for a non-leap year" do
      Year.leap_year?(2010).should == false
    end
    it "should return false for special leap year (100 && !400)" do
      Year.leap_year?(2100).should == false
    end
    it "should return true for special leap year (100 && 400)" do
      Year.leap_year?(2000).should == true
    end
  end

  context ".initialize" do
    it "should build year_array" do
      year = Year.new(2012)
      year.year_array.length.should == 12
    end
  end

  context ".header" do
    it "should create year header for 2014" do
      year = Year.new(2014)
      year.header.should == "                              2014"
    end
  end

end
