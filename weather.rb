require 'yahoo_weatherman'

puts "what is your zipcode?"
zipcode = gets.chomp

def get_location(location)
client = Weatherman::Client.new
client.lookup_by_location(location)
end

weather = get_location(zipcode)

today = Time.now.strftime('%u').to_i

weather.forecasts.each do |forecast|
	day = forecast['date']

	weekday = day.strftime('%u').to_i

	if weekday == today
		dayName = 'Today'
	elsif weekday == today + 1
		dayName = 'Tomorrow'
	else
		dayName = day.strftime('%A')
	end

puts dayName.to_s + ' is going to be ' + 
	forecast['text'].downcase + ' with a high of ' + 
	forecast['high'].to_s + ' and a low of ' +
	forecast['low'].to_s + ' in celsius.'
end

