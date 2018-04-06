class Article < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  def should_generate_new_friendly_id?
    name_changed?
  end
end
