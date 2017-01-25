require "Hitman/version"
require 'discordrb'

module Hitman
  
bot = Discordrb::Commands::CommandBot.new token: 'MjczNTU4OTQzNTgwNTUzMjE3.C2lT7w.oRFC9Q1aQUq30Wd-5kCd69YI_IM', client_id: 273558943580553217, prefix: '.'

# Here we can see the `help_available` property used, which can determine whether a command shows up in the default
# generated `help` command. It is true by default but it can be set to false to hide internal commands that only
# specific people can use.
bot.command(:exit, help_available: false) do |event|
  # This is a check that only allows a user with a specific ID to execute this command. Otherwise, everyone would be
  # able to shut your bot down whenever they wanted.
  break unless event.user.id == 212597730407743489 # Replace number with your ID

  bot.send_message(event.channel.id, 'Bot is shutting down')
  exit
end

bot.command(:ping, description: "Sends a ping to the bot") do |event|
  # The `respond` method returns a `Message` object, which is stored in a variable `m`. The `edit` method is then called
  # to edit the message with the time difference between when the event was received and after the message was sent.
  m = event.respond('Pong!')
  m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
end

bot.command(:plouf, description: "Chooses for you between multiple choices. Usage : .plouf arg 1;arg 2") do |event, *args|
	correct_args = args.join(' ').split(';')
	bot.send_message(event.channel, correct_args.sample, tts = true)
end

bot.command(:quebec, description: "Random Quebec French profany. Usage : .quebec") do |event|
	array = ["ostie d'calisse" , "tabarnak", "j'm'en calisse"]
	bot.send_message(event.channel, array.sample, tts = true)
end

bot.run
end
