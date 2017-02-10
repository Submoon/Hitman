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


  command :bomb, min_args: 1, description: 'Bombs someone', usage: '.bomb @guy' do |event, guy|
    event << "No worko, I'm on the case!"
  end

end