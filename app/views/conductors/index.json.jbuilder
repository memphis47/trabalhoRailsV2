json.array!(@conductors) do |conductor|
  json.extract! conductor, :id, :name, :age
  json.url conductor_url(conductor, format: :json)
end
