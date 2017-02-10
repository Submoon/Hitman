require 'fileutils'

module SaveCommands
	extend Discordrb::Commands::CommandContainer


  #### => Quotes
  #       Quotes are saved in a file named quotes.txt at project's root
  #       They are linked to an ID which allows to manipulate them
  #
  ####

  QUOTE_FILE = File.join(File.dirname(__FILE__), '../../../quotes.txt') # add proper number of ..
  QUOTE_FILE_TMP = File.join(File.dirname(__FILE__), '../../../quotes.txt.tmp') # add proper number of ..
  
  command(:quote,
  	description: 'See, add, or delete quotes', 
  	usage: '
    Random quote: .quote
      Add a quote: .quote add quote_to_add
      Delete a quote with its id: .quote del <id>
      Find a quote with its id: .quote <id>
      Find a quote with its id and say it out loud: .quote tts <id>
      Find a quote with keywords: .quote find <keyword1 keyword2 ...>
      Find all quotes corresponding to keywords: .quote findall <keyword 1 keywords 2 ...>
      Export quotes: .quote export'
  	) do |event, arg='rand', *params|
  	case arg
  	when 'rand' #Default case
  		quotes = IO.readlines(QUOTE_FILE)
  		break unless quotes
  		line = quotes.sample
  		event << (line ? line : 'No quotes registered')
  	when /\A[-+]?[0-9]+\z/ #Is integer so we want to see a particular quote
  		quotes = IO.readlines(QUOTE_FILE) #Getting an array of al the lines
  		id = arg.to_i
		break unless quotes
		line = quotes.find{|l| (l.split(':'))[0].to_i==id} #Getting the quote corresponding to that number
		event << (line ? line : 'This quote does not exist')

  	when 'add'
  		quote = params.join(' ')
		towrite=""
		quotes = IO.readlines(QUOTE_FILE)
		last = -1
		if quotes && !quotes.empty?
			last = (quotes.last.split(':'))[0].to_i #Getting last used number
		end
		File.open(QUOTE_FILE, 'a+') do |f| 
			towrite = "#{last+1} : #{quote}\n"
			f.write(towrite) 
		end
		event << "New quote saved\n #{towrite}"
  	when 'del'
  		id = params.first
  		deleted = nil
  		break unless id.to_i.to_s == id
  		open(QUOTE_FILE, 'r') do |f|
  			open(QUOTE_FILE_TMP, 'w') do |f2|
  				f.each_line do |line|
  					if !line.start_with? "#{id} :"
  						f2.write(line)
  					else
  						deleted = line
  					end
				end
			end
		end
		FileUtils.mv QUOTE_FILE_TMP, QUOTE_FILE
		event << (deleted ? "Quote deleted #{deleted}" : "No quote found with id #{id}")
  	when 'find'
  		quotes = IO.readlines(QUOTE_FILE)
  		break unless quotes
  		params.each do |p|
  			quotes = quotes.select{|l| l.downcase.include? p.downcase}
  		end
  		line = quotes.sample
  		event << (line ? line : "No quotes found with keywords #{params}")
  	when 'findall'
  		quotes = IO.readlines(QUOTE_FILE)
  		break unless quotes
  		params.each do |p|
  			quotes = quotes.select{|l| l.downcase.include? p.downcase}
  		end
  		quotes = quotes.join('')
  		event << "Quotes found:\n #{quotes}"
  	when 'export'
  		f = File.new(QUOTE_FILE, "r")
  		event.channel.send_file f, caption: 'All quotes in a txt format'
    when 'tts'
      quotes = IO.readlines(QUOTE_FILE) #Getting an array of al the lines
      id = params.first.to_i
      break unless quotes
      line = quotes.find{|l| l.start_with? "#{id} :"} #Getting the quote corresponding to that number
      break unless line
      event.channel.send_message line, tts = true
  	else
  		event << 'Wrong use of command, see .help quote'
  	end
	nil
  end

end