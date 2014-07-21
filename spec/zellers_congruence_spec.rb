require_relative '../lib/zellers_congruence'

RSpec.describe ZellersCongruence do
  context ".calculate" do
    it "returns Tuesday for July 2014" do
      ZellersCongruence.calculate(7, 2014).should == 2
    end
    it "returns Saturday for August 2015" do
      ZellersCongruence.calculate(8, 2015).should == 6
    end
    it "returns Saturday for February 2014" do
      ZellersCongruence.calculate(2, 2014).should == 6
    end
  end
end
