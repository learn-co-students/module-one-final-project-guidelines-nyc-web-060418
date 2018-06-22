# Getting the Lyft API data/////////////////////////////////////////////

def hash_populator(origin_lat, origin_long, destination_lat, destination_long)
  lyft_hash = web_request_helper("http://api.lyft.com/v1/cost?start_lat=#{origin_lat}&start_lng=#{origin_long}8&end_lat=#{destination_lat}&end_lng=#{destination_long}")
  return lyft_hash
end

def web_request_helper(url)
  ride_information = RestClient.get(url)
  ride_estimate_information_hash = JSON.parse(ride_information)
  return ride_estimate_information_hash
end

def get_ride_price_estimate(our_hash)
  estimated_cost_cents_max = our_hash["cost_estimates"][1]["estimated_cost_cents_max"]
  return estimated_cost_cents_max
end

def get_primetime_percentage(our_hash)
  get_primetime_percentage = our_hash["cost_estimates"][1]["primetime_percentage"]
  return get_primetime_percentage
end
