module TellEvents extend Discordrb::EventContainer

	@@map_tell = Hash.new {|hash,key| hash[key] = [] }

	def self.map_tell
		@@map_tell
	end

	def self.push(guy, phrase)
		@@map_tell[guy].push phrase
	end

	def self.get_reminders(guy)
		@@map_tell.delete(guy)
	end

	message containing: not!(".tell") do |event|
		auth = event.author.id
		arr = TellEvents::get_reminders(auth)
		if arr
			string=""
			arr.each do |e|
				string << "#{e}\n"
			end
			event.channel.send_message "<@#{event.author.id}> :\n #{string}"
		end
	end


end