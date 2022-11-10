class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, authentication_keys: [:login]
  attr_writer :login
  attr_accessor :country_field, :state_field

  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :finders]
  has_many :authentications, dependent: :destroy
  has_many :reviews
  has_many :blogs
  before_create :confirmation_token
  validates :email, :uniqueness => {:allow_blank => true}
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validate :validate_username
  has_attached_file :image, styles: { cover: "1500x200>", thumb: "200x200>" }, default_url: "/missing-wide.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
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


  # ================Username login=============
  def login
    @login || self.username || self.email
  end
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
  # ==============END==================
end
