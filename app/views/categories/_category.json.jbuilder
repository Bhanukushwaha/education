json.extract! category, :id, :title, :description, :user_id, :is_active, :created_at, :updated_at
json.url category_url(category, format: :json)
