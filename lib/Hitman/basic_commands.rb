module BasicCommands
  extend Discordrb::Commands::CommandContainer

  # Here we can see the `help_available` property used, which can determine whether a command shows up in the default
  # generated `help` command. It is true by default but it can be set to false to hide internal commands that only
  # specific people can use.
  command(:exit, help_available: false) do |event|
    # This is a check that only allows a user with a specific ID to execute this command. Otherwise, everyone would be
    # able to shut your bot down whenever they wanted.
    break unless event.user.id == 212597730407743489 # Replace number with your ID

    event.respond('Bot is shutting down')
    exit
  end

  command(:ping, description: 'Sends a ping to the bot') do |event|
    # The `respond` method returns a `Message` object, which is stored in a variable `m`. The `edit` method is then called
    # to edit the message with the time difference between when the event was received and after the message was sent.
    m = event.respond('Pong!')
    m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
  end

  command :tts, description: 'Sends a message in tts' do |event, *args|
    event.channel.send_message args.join(' '), tts = true

  end

end