json.array!(@integrants) do |integrant|
  json.extract! integrant, :id, :nome, :orchestra_id, :instrument_id, :conductor_id
  json.url integrant_url(integrant, format: :json)
end
