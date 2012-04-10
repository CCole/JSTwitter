require 'jumpstart_auth'

class JSTwitter
	attr_reader :client

	def initialize
		puts "Initializing..."
		@client = JumpstartAuth.twitter 
	end 

	def tweet(message)
	  if message.length <= 140
	   @client.update(message)
	  else
		puts 'You have exceeded your character length! >;('
	  end 
    end

    def dm(target, message)
    	puts "Trying to send #{target} this direct message:"
    	puts message
    	
    end

    def run
		puts "Welcome to the JSL Twitter Client"
		command = " "
		while command != "q"
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			
			case command
			when 'q' then puts "Goodbye!"
			when 't' then tweet(parts[1..-1].join(" "))
			when 'dm' then dm(parts[1], parts[2..-1].join(" "))
			else
				puts "Sorry, I don't know how to #{command}"
			end 
		end
	end
	

end

jst = JSTwitter.new
#jst.tweet("abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcd")
jst.run

