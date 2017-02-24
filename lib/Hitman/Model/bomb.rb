class Bomb

	@@possible_colors = [:red, :blue, :yellow]

	#attr_reader :event, :guy, :time, :color
	attr_accessor :task
	attr_reader :guy, :event

	def initialize(event, guy, time)
		@event = event
		@guy = guy
		@time = time
		@good_color = @@possible_colors.sample
		@bad_color = (@@possible_colors-[@good_color]).sample
		@task=nil
	end

	def cut(color)
		if color==@good_color.to_s
			return 0
		end
		if color==@bad_color.to_s
			return 1
		end
		return 2
		
	end



end