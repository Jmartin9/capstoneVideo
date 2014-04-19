json.array!(@pois) do |poi|
  json.extract! poi, :id, :name, :description, :picture, :address
  json.url poi_url(poi, format: :json)
end
