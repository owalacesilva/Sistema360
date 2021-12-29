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
  has_one :spill_queue, class_name: "UserSpillQueue", dependent: :destroy, inverse_of: :user
  has_one :node, class_name: "UserNetwork", dependent: :restrict_with_exception, inverse_of: :user
  has_one :bank_account, class_name: "UserBankAccount", dependent: :destroy
  has_one :wallet, class_name: "Wallet"
  has_many :sponsored, class_name: "User", foreign_key: "sponsor_id", dependent: :destroy, inverse_of: :sponsor
  has_many :sponsored_queue, class_name: "UserSpillQueue", dependent: :destroy, inverse_of: :user_sponsor
  has_many :points, class_name: "UserPoint", dependent: :destroy
  has_many :point_records, class_name: "UserPointRecord", dependent: :destroy
  has_many :point_distributions, class_name: "PointDistribution", dependent: :destroy
  has_many :user_graduations, dependent: :destroy
  has_many :user_qualifications, dependent: :destroy
  has_many :graduations, through: :user_graduations
  has_many :qualifications, through: :user_qualifications
  has_many :withdraws, class_name: "Withdraw", through: :wallet

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, confirmation: true
  validates :gender, inclusion: { in: %w[male famale] }
  validates :status, inclusion: { in: %w[actived] }

  before_save :add_user_to_spill_queue, if: Proc.new { |user| user.sponsor? }
  after_save :create_user_points, :create_user_wallet

  def point(ref)
    points.find_by(reference: Reference.uname(ref))
  end

  def point_amount(ref)
    point(ref).amount
  end

  def sponsor?
    sponsor.present?
  end

  def qualification
    qualifications.order(id: :desc).first
  end

  private

  def create_user_points
    ref1 = Reference.first
    points.create(reference_id: ref1.id, amount: 0)
  end

  def create_user_wallet
    Wallet.create(user: self)
  end

  def add_user_to_spill_queue
    build_spill_queue(user_sponsor: sponsor, side: UserSpillQueue.sides[:left])
  end
end
