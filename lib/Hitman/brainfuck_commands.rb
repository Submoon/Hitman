require 'brainfuck'
require 'stringio'

module BrainfuckCommands
  extend Discordrb::Commands::CommandContainer

  command(:bf, description: 'Interprater for brainfuck') do |event, *args|
    begin
      code = args.last
      output = StringIO.new
      parser = Brainfuck.new(code, output)
      parser.run()
      output.string
    rescue Exception => e
      event.channel.send_message e.message
    end
  end


end