module BotTrust
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
      chars.each_with_index do |char, idx|
        if idx % 2 == 0
          color = char.downcase.to_sym
        else
          BotOrder.new color, char.to_i
        end
      end
    end
  end
end