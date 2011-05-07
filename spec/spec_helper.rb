require 'bundler/setup'

require_relative "../bot_trust/bot_trust.rb"

RSpec.configure do |config|
  config.mock_framework = :mocha
end

module Sample
  INPUT = <<INPUT
3
4 O 2 B 1 B 2 O 4
3 O 5 O 8 B 100
2 B 2 B 1
INPUT

  OUTPUT = <<OUTPUT
Case #1: 6
Case #2: 100
Case #3: 4
OUTPUT
end
