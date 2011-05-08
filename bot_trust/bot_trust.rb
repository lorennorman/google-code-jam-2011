module BotTrust
  class Robot
    attr_accessor :position, :color

    def initialize color
      @position = 0
      @color    = color
    end
  end

  class BotOrder
    attr_reader :color, :button

    def initialize color, button
      @color  = color
      @button = button
    end
  end

  class Move
    attr_reader :move_type
    def initialize move_type
      @move_type = move_type
    end

    def execute robot
      case(@move_type)
      when :up   then robot.position += 1
      when :down then robot.position -= 1
      when :press
      when :wait
      end
    end
  end

  class Scenario
    def initialize orders
      @orders  = orders
      @o_robot = BotTrust::Robot.new :o
      @b_robot = BotTrust::Robot.new :b
      @robots  = [@o_robot, @b_robot]
    end

    attr_reader :total_seconds
    def run
      @total_seconds = -1
      while true do
        tick || break
        @total_seconds += 1
      end
    end

    def tick
      next_order = @orders.first
      return unless next_order

      # check next order for each bot
      o_move = next_orange_move :can_press? => next_order.color == :o
      b_move = next_blue_move   :can_press? => next_order.color == :b

      # execute the orders
      o_move && o_move.execute(@o_robot)
      b_move && b_move.execute(@b_robot)

      # pop the order if a button was pressed
      if [o_move, b_move].compact.map(&:move_type).include? :press
        @orders.delete next_order
      end

      next_order
    end

    def robot color
      @robots.detect { |bot| bot.color == color }
    end

    def next_move robot, options = {:can_press? => false}
      # find the next order that references this robot
      order = @orders.detect { |order| order.color == robot.color }
      return unless order

      # compare orange's position with the order
      if robot.position > order.button
        BotTrust::Move.new :down
      elsif robot.position < order.button
        BotTrust::Move.new :up
      else
        BotTrust::Move.new(options[:can_press?] ? :press : :wait)
      end
    end

    def next_orange_move options = {:can_press? => false}
      next_move @o_robot, options
    end

    def next_blue_move options = {:can_press? => false}
      next_move @b_robot, options
    end
  end

  class InputParser
    def self.parse input
      # get an Enumerator for input string
      lines = input.lines

      # drop the first line of the input
      # (do something with it?) nah...
      lines = lines.reject {|line| line == lines.first }

      # parse the remaining lines into scenarios
      lines.map do |line|
        BotTrust::Scenario.new parse_line(line)
      end
    end

    def self.parse_line line
      chars  = line.split[1..-1]
      color  = nil
      orders = []
      chars.each_with_index do |char, idx|
        if idx % 2 == 0
          color = char.downcase.to_sym
        else
          orders << BotOrder.new(color, char.to_i)
        end
      end

      orders
    end
  end

  class Runner
    def initialize input
      @scenarios = BotTrust::InputParser.parse input
    end

    def solution
      index = 0
      @scenarios.map do |scene|
        scene.run
        output = "Case ##{index+1}: #{scene.total_seconds}"
        index += 1
        output
      end.join "\n"
    end
  end
end