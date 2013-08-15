json.array!(@teams) do |team|
  json.extract! team, :name, :game, :player
  json.url team_url(team, format: :json)
end
