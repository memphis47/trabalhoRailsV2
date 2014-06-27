json.array!(@orchestras) do |orchestra|
  json.extract! orchestra, :id, :name, :city, :conductor_id
  json.url orchestra_url(orchestra, format: :json)
end
