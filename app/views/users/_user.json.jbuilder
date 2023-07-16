json.extract! user, :id, :tweetname, :img_url, :created_at, :updated_at
json.url user_url(user, format: :json)
