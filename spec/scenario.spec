describe BotTrust::Scenario, "with 2 orders" do
  subject do
    BotTrust::Scenario.new [
      BotTrust::BotOrder.new(:o, 5),
      BotTrust::BotOrder.new(:b, 4)
    ]
  end

  it "should want to move both robots" do
    subject.next_orange_order.should == :move_up
    subject.next_blue_order.should   == :move_up
  end

  it "should move both robots up with after 1 tick" do
    subject.tick

    subject.robot(:o).position.should == 1
    subject.robot(:b).position.should == 1
  end

  it "should move blue to 4 and orange to 5 after 5 ticks" do
    5.times do
      subject.tick
    end

    subject.robot(:o).position.should == 5
    subject.robot(:b).position.should == 4
  end
end