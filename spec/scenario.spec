describe BotTrust::Scenario, "with 2 orders" do
  subject do
    BotTrust::Scenario.new [
      BotTrust::BotOrder.new(:o, 5),
      BotTrust::BotOrder.new(:b, 4),
      BotTrust::BotOrder.new(:b, 8),
      BotTrust::BotOrder.new(:o, 3)
    ]
  end

  it "should want to move both robots" do
    subject.next_orange_move.move_type.should == :up
    subject.next_blue_move.move_type.should   == :up
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

    BotTrust::Move.expects(:new).with(:press).never

    subject.robot(:o).position.should == 5
    subject.robot(:b).position.should == 4
  end

  it "should press the button" do
    # BotTrust::Move.expects(:new).with(:up).times(9).returns BotTrust::Move.new :up
    # BotTrust::Move.expects(:new).with(:wait).twice.returns  BotTrust::Move.new :wait
    # BotTrust::Move.expects(:new).with(:down).once.returns   BotTrust::Move.new :down
    # BotTrust::Move.expects(:new).with(:press).twice.returns BotTrust::Move.new :press

    7.times do
      subject.tick
    end

    subject.robot(:o).position.should == 4
    subject.robot(:b).position.should == 4
  end
end