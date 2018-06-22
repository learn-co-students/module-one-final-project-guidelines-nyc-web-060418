require_relative '../config/environment.rb'

def run_surge_watcher
  while true

# This method makes the call to the API using the Geocoder-fetched (from user-inputted-addresses) coordinates.
    def ride_checker(trip)
        our_hash = hash_populator(trip.origin.latitude, trip.origin.longitude, trip.destination.latitude, trip.destination.longitude)
        primetime_percentage = get_primetime_percentage(our_hash)
        estimated_cost_cents_max = get_ride_price_estimate(our_hash)

      if primetime_percentage.to_i > 0
        puts "Your ride is currently surging! There's a #{primetime_percentage} price increase at this time."
        puts "Your ride will cost approx. $#{estimated_cost_cents_max / 100}."
      else
        puts "Good news! Your ride isn't affected by surge pricing."
        puts "Your ride will cost approx. $#{estimated_cost_cents_max / 100}."
      end
      puts "Press enter to initiate the next ping. Type exit to exit."
    end

# This method monitors the user's input - in case the user requests to exit the program, it will do so.
    def exit_checker(arg)
      if arg == "exit"
        puts "Goodbye!"
        return exit
      end
    end

# This is the start of our CLI!
    puts "
╔═╗╦ ╦╦═╗╔═╗╔═╗  ╦ ╦╔═╗╔╦╗╔═╗╦ ╦╔═╗╦═╗
╚═╗║ ║╠╦╝║ ╦║╣   ║║║╠═╣ ║ ║  ╠═╣║╣ ╠╦╝
╚═╝╚═╝╩╚═╚═╝╚═╝  ╚╩╝╩ ╩ ╩ ╚═╝╩ ╩╚═╝╩╚═
"
    puts "Welcome to Surge Watcher!"
    puts "You can use this app to monitor Lyft prices over time."
    puts "Type exit at any time to dip."
    puts "Please enter your name:"
      user_name = gets.chomp
      exit_checker(user_name)
      user_name = User.create(name: user_name)
    puts "Thanks #{user_name.name}! Please enter the address of your ride origin:"
      origin = gets.chomp
      exit_checker(origin)

      until Geocoder.search(origin) != nil
        sleep(3)
        puts "Hold on, the API is overloaded atm. We'll re-send your ping."
      end
      helper = Geocoder.search(origin)

      lat_long = helper.first.coordinates
      origin = Origin.create(:address => origin, :latitude => lat_long[0], :longitude => lat_long[1])
    puts "Please enter the address of your ride destination:"
      destination = gets.chomp
      exit_checker(destination)

      until Geocoder.search(destination) != nil
        sleep(3)
        puts "Hold on, the API is overloaded atm. We'll re-send your ping."
      end

      helper_2 = Geocoder.search(destination)
      lat_long = helper.first.coordinates
      destination = Destination.create(:address => destination, :latitude => lat_long[0], :longitude => lat_long[1])
    puts "Great. Let's check on your ride estimate."
      ride_checker(TripEstimate.create(user_id: user_name.id, origin_id: origin.id, destination_id: destination.id))
    until gets.chomp == "exit"
      ride_checker(TripEstimate.create(user_id: user_name.id, origin_id: origin.id, destination_id: destination.id))
    end
    break
  end
end

run_surge_watcher
