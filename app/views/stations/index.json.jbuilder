json.array!(@stations) do |station|
  json.extract! station, :id, :name, :identifier, :trip_id
  json.url station_url(station, format: :json)
end
