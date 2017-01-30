module FunCommands
  extend Discordrb::Commands::CommandContainer

  command :bitchslap, description: 'Bitchslaps someone to infinity and beyond (User needs to be in a voice chat', usage: '.bitchslap @guy (Discord will translate it into an id)' do |event, tag|
  	voice_channels = event.server.voice_channels
  	member = event.server.member_by_tag(tag)
  	begin_voice = member.voice_channel
  	break unless begin_voice
  	begin_index = voice_channels.find_index(begin_voice)
  	event.respond "To infinity and beyond!"
  	((begin_index+1)..(begin_index+voice_channels.length-1)).each do |i|
  		reali = i%voice_channels.length
  		event.server.move(member, voice_channels[reali])
  		sleep(3)
  	end
  end

end