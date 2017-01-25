module RandomCommands
  extend Discordrb::Commands::CommandContainer

  #Module for all the random commands

  command(:plouf, description: 'Chooses for you between multiple choices. Usage : .plouf arg 1;arg 2') do |event, *args|
    correct_args = args.join(' ').split(';')
    correct_args.sample
  end

  command :dice, description: 'Rolls a dice (You can specify the maximum with the second parameter' do |event, max=6|
    rand(1..max.to_i)
  end

end