json.array!(@trips) do |trip|
  json.extract! trip, :id, :enter_station, :exit_station, :user_id
  json.url trip_url(trip, format: :json)
end
