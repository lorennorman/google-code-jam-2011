require 'spec_helper'

describe BotTrust::Runner, "with sample input" do
  before do
    BotTrust::InputParser.expects(:parse).once
  end

  subject { BotTrust::Runner.new(Sample::INPUT) }

  it "should provide the sample output as its solution" do
    subject.solution.should == Sample::OUTPUT
  end
end