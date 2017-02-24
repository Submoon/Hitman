require 'Hitman/Model/bomb'
module FunCommands
  extend Discordrb::Commands::CommandContainer

  command :bitchslap, description: 'Bitchslaps someone to infinity and beyond (User needs to be in a voice chat', usage: '.bitchslap @guy' do |event, tag|
  	voice_channels = event.server.voice_channels
  	member = event.server.member_by_tag(tag)
  	begin_voice = member.voice_channel
  	break unless begin_voice
  	begin_index = voice_channels.find_index(begin_voice)
  	event.channel.send_message "To infinity and beyond!"
  	((begin_index+1)..(begin_index+voice_channels.length)).each do |i|
  		real_i = i%voice_channels.length
  		event.server.move(member, voice_channels[real_i])
  		sleep(3)
    end
    nil
  end

  bomb = nil

  #Bomb commands


  def self.explosion(bomb)
    bomb.event.channel.send_message "IT EXPLODED, YOU DIED"

  end

  command :bomb, min_args: 1, description: 'Bombs someone', usage: '.bomb @guy' do |event, tag|
    guy = event.server.member_by_tag(tag)
    if bomb
      event << "There's already a bomb!"
      return
    end
    bomb = Bomb.new(event, guy, 30)
    task = Concurrent::ScheduledTask.execute(30){
      FunCommands::explosion(bomb)
    }
    bomb.task=task
    event << "#{guy.username} has been bombed! You have 30s to cut a wire: .cut red/blue/yellow"
  end

  command :cut, min_args: 1, description: 'Cuts a wire for the bomb', usage: '.cut red/blue/yellow' do |event, color|
    break unless bomb
    break unless event.author == bomb.guy

    value = bomb.cut(color)
    case value
    when 0 #You live
      event << "Bomb has been deactivated"
      bomb.task.cancel
      bomb = nil
    when 1 #You ded
      FunCommands::explosion(bomb)
      bomb.task.cancel
      bomb = nil
    when 2 #Does nothing?
      event << "It seems to do nothing?"
    end
  end

end