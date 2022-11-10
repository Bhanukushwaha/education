json.extract! article, :id, :title, :name, :created_at, :updated_at
json.url article_url(article, format: :json)
