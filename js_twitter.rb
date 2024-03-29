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
    	screen_names = @client.followers.collect {|follower| follower.screen_name}
    	if screen_names.include?(target) 
    	  puts "Trying to send #{target} this direct message:"
    	  puts message
    	  tweet("d #{target} #{message}")
    	else
    	  puts 'Error. You can only DM people who are following you.'
        end 
    end

    def followers_list 
    	screen_names = []
    	@client.followers.each do |follower|
    	screen_names << follower["screen_name"]
        end
        return screen_names
    
    end

    def spam_my_followers(message)
    	followers_list.each do |follower| 
    		dm(follower,message)
    	end
    end

    def everyones_last_tweet
    	friends = @client.friends
    	friends.each do |friend|
    		# find each friends last message
    		# print each friend's screen_name
    		# print each friend's last message
    		puts ""  #Just print a blank line to sparate people
    	end
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
			when 'spam' then spam_my_followers(parts[1..-1].join(" "))
			when 'elt'  then everyones_last_tweet
			else
				puts "Sorry, I don't know how to #{command}"
			end 
		end
	end
	

end

jst = JSTwitter.new
#jst.tweet("abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcd")
jst.run

