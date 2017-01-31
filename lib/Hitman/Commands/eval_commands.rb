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
    end