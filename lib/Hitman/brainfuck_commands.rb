require 'brainfucktt'
require 'stringio'

module BrainfuckCommands
  extend Discordrb::Commands::CommandContainer

  command(:bf, description: 'Interpretes brainfuck') do |event, *args|
    begin
      code = args.last
      output = StringIO.new
      parser = Brainfucktt.parse(code)
      Brainfucktt.run(code, output: output)
      output.string
    rescue RangeError => e
      event.channel.send_message "Impossible to parse due to\n\t #{e.message}"
    else
      event.channel.send_message 'Unknown Error'
    ensure
      event.channel.send_message "Pointer value: #{Brainfucktt::Parser.instance.pointer}"
    end

  end


end