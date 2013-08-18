json.array!(@games) do |game|
  json.extract! game, :vs_team, :date, :goal_id, :player_id
  json.url game_url(game, format: :json)
end
