require "Hitman/version"
require 'discordrb'
require 'Hitman/basic_commands'
require 'Hitman/random_commands'
require 'Hitman/brainfuck_commands'

module Hitman
  puts 'Creating bot'
  bot = Discordrb::Commands::CommandBot.new token: 'MjczNTU4OTQzNTgwNTUzMjE3.C2lT7w.oRFC9Q1aQUq30Wd-5kCd69YI_IM', client_id: 273558943580553217, prefix: '.', advanced_functionality: true

  bot.include! BasicCommands
  bot.include! RandomCommands
  bot.include! BrainfuckCommands

  puts "Bot #{bot} ready to run"

  bot.run
end
