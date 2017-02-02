require 'brainfuck'
require 'stringio'

module EvalCommands
  extend Discordrb::Commands::CommandContainer
  command(:eval, min_args: 1, usage: 'eval <code>') do |event, *code|
    break unless event.author.id == configatron.owner_id
    code = code.join(' ').to_s
    begin
      event << eval(code)
    rescue => e
      event << 'Eval resulted in an error.'
      nil
    end
  end

  command(:bf, description: 'Interpreter for brainfuck', usage: '.bf "Brainfuck code"') do |event, *args|
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