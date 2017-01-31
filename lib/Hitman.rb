require "Hitman/version"
require 'discordrb'
require 'configatron'
require_relative '../config.rb'

require 'Hitman/Utilities/server_utils'

require 'Hitman/Events/tell_events'
require 'Hitman/Commands/eval_commands'
require 'Hitman/Commands/basic_commands'
require 'Hitman/Commands/random_commands'
require 'Hitman/Commands/brainfuck_commands'
require 'Hitman/Commands/fun_commands'

module Hitman
  puts 'Creating bot'
  bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: 273558943580553217, prefix: '.'#, advanced_functionality: true

  bot.include! TellEvents

  bot.include! BasicCommands
  bot.include! EvalCommands
  bot.include! RandomCommands
  bot.include! BrainfuckCommands
  bot.include! FunCommands

  puts "Bot #{bot} ready to run"

  bot.run
end
