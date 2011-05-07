require 'spec_helper'

describe BotTrust::InputParser do
  subject { BotTrust::InputParser }

  it "should not raise an error" do
    subject.parse "0"
  end

  describe "output from the sample input" do
    before { BotTrust::Scenario.expects(:new).times(3) }

    it "should output 3 scenarios" do
      BotTrust::InputParser.parse(Sample::INPUT)
    end
  end

  describe "parsing one line" do
    before do
      BotTrust::BotOrder.expects(:new).with(:o, 2)
      BotTrust::BotOrder.expects(:new).with(:b, 1)
      BotTrust::BotOrder.expects(:new).with(:b, 2)
      BotTrust::BotOrder.expects(:new).with(:o, 4)
    end

    it "should produce 4 BotOrders" do
      BotTrust::InputParser.parse_line "4 O 2 B 1 B 2 O 4"
    end
  end
end