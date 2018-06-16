class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :finders]
  has_many :authentications, dependent: :destroy
  has_many :reviews
  has_many :blogs
  before_create :confirmation_token
  validates :email, :uniqueness => {:allow_blank => true}
  def should_generate_new_friendly_id?
    first_name_changed?
  end
  has_many :categories, dependent: :destroy
  def is_admin?
   return true if self.role =="admin"
  end
  def name
    "#{first_name} #{last_name}"
  end
end
