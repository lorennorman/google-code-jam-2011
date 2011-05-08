describe BotTrust::Move do
  [:up, :down, :press, :wait].each do |move_type|
    describe "The #{move_type} Move" do
      subject { BotTrust::Move.new(move_type) }

      it "should initialize and respond with #{move_type}" do
        subject.move_type.should == move_type
      end

      it "should respond to execute" do
        subject.execute BotTrust::Robot.new :o
      end
    end
  end
end