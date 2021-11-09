class User < ApplicationRecord
  # This is based in ActiveRecord::Enum module
  enum status: { 
    actived: 'actived'
  }
  
  attr_accessor :email_confirmation
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  belongs_to :sponsor, class_name: 'User', optional: true
  has_many :sponsors, class_name: 'User', foreign_key: 'sponsor_id'

  validates :first_name, presence: true
  validates :email, uniqueness: true
  validates :email, confirmation: true
end
