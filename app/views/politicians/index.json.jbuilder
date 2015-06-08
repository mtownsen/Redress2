json.array!(@politicians) do |politician|
  json.extract! politician, :id, :name
  json.url politician_url(politician, format: :json)
end
