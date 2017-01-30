class Discordrb::Server
	def member_by_tag(tag)
		self.member(tag[2..tag.length])
	end
end