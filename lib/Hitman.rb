require "Hitman/version"
require 'discordrb'
require 'Hitman/basic_commands'
require 'Hitman/random_commands'

module Hitman
  
bot = Discordrb::Commands::CommandBot.new token: 'MjczNTU4OTQzNTgwNTUzMjE3.C2lT7w.oRFC9Q1aQUq30Wd-5kCd69YI_IM', client_id: 273558943580553217, prefix: '.', advanced_functionality: true

bot.include! BasicCommands
bot.include! RandomCommands

bot.command(:quebec, description: "Random Quebec French profany. Usage : .quebec") do |event|
	array = ["ostie d'calisse" , "tabarnak", "j'm'en calisse"]
	bot.send_message(event.channel, array.sample, tts = true)
end

bot.run
end
