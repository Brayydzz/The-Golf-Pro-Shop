class User < ApplicationRecord
  rolify
  has_many :equipment_listings, dependent: :destroy
  has_many :services, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_messageable

  # Creates a default role when a user signs up
  after_create :default_role

  def default_role
    add_role(:member)
  end
end
