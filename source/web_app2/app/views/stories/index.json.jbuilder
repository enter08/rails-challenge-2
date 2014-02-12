json.array!(@stories) do |story|
  json.extract! story, :user_id, :active, :url, :title, :description
  json.url story_url(story, format: :json)
end