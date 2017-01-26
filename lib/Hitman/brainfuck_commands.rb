require 'brainfucktt'
require 'stringio'

module BrainfuckCommands
  extend Discordrb::Commands::CommandContainer

  command(:bf, description: 'Interpretes brainfuck') do |event, *args|
    begin
      code = args.last
      output = StringIO.new
      parser = Brainfucktt::Parser.new(output: output)
      parser.parse(code)
      parser.run(code)
      output.string
    rescue RangeError => e
      "Impossible to parse due to\n\t #{e.message}"
    else
      'Unknown Error'
    end
  end


end