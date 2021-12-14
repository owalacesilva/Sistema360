class User < ApplicationRecord
  # This is based in ActiveRecord::Enum module
  enum status: { 
    actived: "actived"
  }

  attr_accessor :email_confirmation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  belongs_to :sponsor, class_name: "User", optional: true
  has_many :sponsored, class_name: "User", foreign_key: "sponsor_id", dependent: :nullify, inverse_of: :sponsor
  has_one :node, class_name: "UserNetwork", foreign_key: "user_id", dependent: :nullify, inverse_of: :user
  has_many :network, class_name: "UserNetwork", foreign_key: "user_sponsor_id", dependent: :nullify, inverse_of: :sponsor
  has_many :children, class_name: "UserNetwork", foreign_key: "user_parent_id", dependent: :nullify, inverse_of: :sponsor
  has_one :bank_account, class_name: "UserBankAccount", dependent: :destroy
  has_many :points, class_name: "UserPoint", dependent: :destroy
  has_many :point_records, class_name: "UserPointRecord", dependent: :destroy
  has_many :point_distributions, class_name: "PointDistribution", dependent: :destroy
  has_many :user_graduations, dependent: :destroy
  has_many :user_qualifications, dependent: :destroy
  has_many :graduations, through: :user_graduations
  has_many :qualifications, through: :user_qualifications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, confirmation: true
  validates :gender, inclusion: { in: %w[male famale] }
  validates :status, inclusion: { in: %w[actived] }

  after_save :create_user_points

  def point(ref)
    points.find_by(reference: Reference.find_by(title: ref))
  end

  private

  def create_user_points
    ref1 = Reference.first
    #ref2 = Reference.create(title: "Upgrade")
    points.create(reference_id: ref1.id, amount: 0)
    #points.create(reference_id: ref2.id, amount: 0)
  end
end
