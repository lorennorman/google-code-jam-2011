require 'spec_helper'

describe BotTrust::Runner, "with sample input" do
  subject { BotTrust::Runner.new(Sample::INPUT) }

  it "should provide the sample output as its solution" do
    subject.solution.strip.should == Sample::OUTPUT.strip
  end
end