module BotTrust
  class BotOrder
    attr_reader :color, :button

    def initialize color, button
      @color  = color
      @button = button
    end
  end
end