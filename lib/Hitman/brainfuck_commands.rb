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
      "```Markdown\n#{output.string}\n```"
    rescue Exception => e
      event.channel.send_message "```Markdown\n#{e.message}\n```"
    end
  end


end