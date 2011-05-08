describe BotTrust::Robot do
  it "should let me new it" do
    BotTrust::Robot.expects(:new)

    BotTrust::Robot.new :o
  end
end