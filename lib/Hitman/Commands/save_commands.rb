require 'fileutils'

module SaveCommands
	extend Discordrb::Commands::CommandContainer

  QUOTE_FILE = File.join(File.dirname(__FILE__), '../../../quotes.txt') # add proper number of ..
  QUOTE_FILE_TMP = File.join(File.dirname(__FILE__), '../../../quotes.txt.tmp') # add proper number of ..
  #Quotes
  command :quote, description: 'See, add, or delete a quote', usage: '.quote (for random quote)|.quote add quote_to_add|del <id>|<id>' do |event, arg='rand', *params|
  	if arg=='rand'
  		quotes = IO.readlines(QUOTE_FILE)
		break unless quotes
		line = quotes.sample
		event << (line ? line : 'No quotes registered')
	elsif arg.to_i.to_s == arg # We check if it's an int
		quotes = IO.readlines(QUOTE_FILE)
		break unless quotes
		line = quotes[arg.to_i]
		event << (line ? line : 'This quote does not exist')
	elsif arg=='add'
		quote = params.join(' ')
		towrite=""
		File.open(QUOTE_FILE, 'a+') { |f| 
			count = f.read.count("\n")
			towrite = "#{count} : #{quote}\n"
			f.write(towrite) 
		}
		event << "New quote saved\n #{towrite}"
  	elsif arg=='del' #Removing a quote : .quote 
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
  	else
  		event << 'Wrong use of command, see .help quote'
  	end
  	nil
  end

end