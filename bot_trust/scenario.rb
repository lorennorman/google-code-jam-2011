module BotTrust
  class Scenario
    def initialize orders
      @orders  = orders
      @o_robot = BotTrust::Robot.new
      @b_robot = BotTrust::Robot.new
      @robots  = [@o_robot, @b_robot]
    end

    def tick
      # check next order for each bot
      # o_order = next_orange_order
      # b_order = next_blue_order

      # execute the orders
      @robots.each do |bot|
        bot.position += 1
      end

      # pop the order if a button was pressed
    end

    def robot color
      @o_robot
    end

    def next_orange_order
      # find the next order that references orange
      # compare orange's position with the order
      # not equal? 
      #   move towards order (+/-)
      :move_up
      # equal?
      #   are there any blue orders first?
      #     wait
      #   otherwise
      #     press
    end

    def next_blue_order
      :move_up
    end
  end
end