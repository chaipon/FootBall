json.array!(@goals) do |goal|
  json.extract! goal, :time, :game_id_id, :player_id_id, :is_our_goal
  json.url goal_url(goal, format: :json)
end
