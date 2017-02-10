module BasicEvents extend Discordrb::EventContainer

	

	ready do |event|
		event.bot.game="Dwarf Fortress"
	end


end
