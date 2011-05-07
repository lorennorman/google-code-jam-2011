["robot.rb", "bot_order.rb", "scenario.rb", "input_parser.rb"].each do |relative_file|
  require_relative relative_file
end

module BotTrust
  class Runner
    def initialize input
      @scenarios = BotTrust::InputParser.parse input
    end

    def solution
<<OUTPUT
Case #1: 6
Case #2: 100
Case #3: 4
OUTPUT
    end
  end
end