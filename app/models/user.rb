class User < ApplicationRecord
  audited

  enum role: %i[user coach]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :training_sessions
  has_many :plans, through: :training_sessions

  has_many :customers, class_name: 'User', foreign_key: 'coach_id'
  belongs_to :coach, class_name: 'User', optional: true

  has_one :profile

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end
end
