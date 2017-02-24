require "Hitman/version"
require 'discordrb'
require 'configatron'
require 'concurrent'
require_relative '../config.rb'

require 'Hitman/Utilities/server_utils'

require 'Hitman/Events/basic_events'
require 'Hitman/Events/tell_events'
require 'Hitman/Commands/eval_commands'
require 'Hitman/Commands/basic_commands'
require 'Hitman/Commands/random_commands'
require 'Hitman/Commands/fun_commands'
require 'Hitman/Commands/save_commands'

module Hitman
  puts 'Creating bot'
  bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: configatron.client_id, prefix: '.'#, advanced_functionality: true

  bot.include! BasicEvents
  bot.include! TellEvents

  bot.include! BasicCommands
  bot.include! EvalCommands
  bot.include! RandomCommands
  bot.include! FunCommands
  bot.include! SaveCommands

  puts "Bot #{bot} ready to run"

  bot.run
end
