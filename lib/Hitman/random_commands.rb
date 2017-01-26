module RandomCommands
  extend Discordrb::Commands::CommandContainer

  @@QUEBEC_ARRAY = ["ostie d'calisse" , 'tabarnak', "j'm'en calisse","ca goûte la marde", "t'es cave", "sacristi", "marde", "ostie d'crisse", "fils de poutine"]
  #Module for all the random commands

  puts 'Random commands initialized'

  command(:plouf, description: 'Chooses for you between multiple choices. Usage : .plouf arg 1;arg 2') do |event, *args|
    correct_args = args.join(' ').split(';')
    correct_args.sample
  end

  command(:quebec, description: 'Random Quebec French profany. Usage : .quebec') do |event|
    
    @@QUEBEC_ARRAY.sample
  end

  command :dice, description: 'Rolls a dice (You can specify the maximum with the second parameter' do |event, max=6|
    rand(1..max.to_i)
  end

end