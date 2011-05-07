require 'spec_helper'

describe BotTrust::BotOrder do
  it "should accept a bot color and a button number" do
    BotTrust::BotOrder.new :o, 5
  end
end

describe BotTrust::BotOrder do
  subject { BotTrust::BotOrder.new :o, 5 }

  its(:color)  { should be(:o) }
  its(:button) { should be(5) }
end