require_relative '../lib/month'

RSpec.describe Month do
  context ".header" do
    it "matches cal for December 2012" do
      month = Month.new(12, 2012)
      month.header.should == "   December 2012"
    end
    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901"
    end
  end

  context ".name" do
    it "translates January" do
      Month.new(1, 2012).name.should == "January"
    end
    it "translates February" do
      Month.new(2, 2012).name.should == "February"
    end
    it "translates March" do
      Month.new(3, 2012).name.should == "March"
    end
    it "translates April" do
      Month.new(4, 2012).name.should == "April"
    end
    it "translates May" do
      Month.new(5, 2012).name.should == "May"
    end
    it "translates June" do
      Month.new(6, 2012).name.should == "June"
    end
    it "translates July" do
      Month.new(7, 2012).name.should == "July"
    end
    it "translates August" do
      Month.new(8, 2012).name.should == "August"
    end
    it "translates September" do
      Month.new(9, 2012).name.should == "September"
    end
    it "translates October" do
      Month.new(10, 2012).name.should == "October"
    end
    it "translates November" do
      Month.new(11, 2012).name.should == "November"
    end
    it "translates December" do
      Month.new(12, 2012).name.should == "December"
    end
  end

  context ".length" do
    it "returns length of 31 days for July 2014" do
      month = Month.new(7, 2014)
      month.length.should == 31
    end
    it "returns length of 28 days for February 2014" do
      month = Month.new(2, 2014)
      month.length.should == 28
    end
    it "returns length of 29 days for February 2000" do
      month = Month.new(2, 2000)
      month.length.should == 29
    end
    it "returns length of 30 days for September 2020" do
      month = Month.new(9, 2020)
      month.length.should == 30
    end
  end

  context ".build_week" do
    it "builds first week of month for July 2014" do
      month = Month.new(7, 2014)
      month.build_week(0).should == [nil, nil, 1, 2, 3, 4, 5]
    end
    it "should build second week of month for July 2014" do
      month = Month.new(7, 2014)
      month.build_week(1).should == [6, 7, 8, 9, 10, 11, 12]
    end
    it "should build third week of month for July 2014" do
      month = Month.new(7, 2014)
      month.build_week(2).should == [13, 14, 15, 16, 17, 18, 19]
    end
    it "should build fourth week of month for July 2014" do
      month = Month.new(7, 2014)
      month.build_week(3).should == [20, 21, 22, 23, 24, 25, 26]
    end
    it "should build fifth week of month for July 2014" do
      month = Month.new(7, 2014)
      month.build_week(4).should == [27, 28, 29, 30, 31, nil, nil]
    end
    it "should build sixth week of month for July 2014" do
      month = Month.new(7, 2014)
      month.build_week(5).should == [nil, nil, nil, nil, nil, nil, nil]
    end
  end

  context ".build_month" do
    it "should build month of February 2012" do
      month = Month.new(2, 2012)
      month.month_array.should == [[nil, nil, nil, 1, 2, 3, 4],
      [5, 6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17, 18],
      [19, 20, 21, 22, 23, 24, 25], [26, 27, 28, 29, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]]
    end
  end

  context ".to_s" do
    it "should build month - July 2017" do
      month = Month.new(7, 2017)
      month.to_s.should == <<EOS
     July 2017
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    end
  end

end
