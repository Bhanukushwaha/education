class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :finders]
  def should_generate_new_friendly_id?
    first_name_changed?
  end
  has_many :categories, dependent: :destroy
  def is_admin?
   return true if self.role =="admin"
  end
end
