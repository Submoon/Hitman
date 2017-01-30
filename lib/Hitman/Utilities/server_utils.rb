class Discordrb::Server

	# Returns a member by its tag ">@id" when his pseudo is used like @name#number
	def member_by_tag(tag)
		self.member(tag[2..tag.length])
	end
end