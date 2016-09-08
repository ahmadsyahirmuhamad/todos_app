class User < ActiveRecord::Base
  has_secure_password(validations: false)

  attr_accessor :updating_password

  # associations
  has_many :todos, dependent: :destroy
  has_many :categories, through: :todos

  # callbacks
  before_save :email_downcase

  # validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validate :password_validity, if: :should_validate_password?

  private

  def email_downcase
    self.email = self.email.downcase
  end

  def should_validate_password?
    updating_password || new_record?
  end

  def updating_password!
    self.updating_password = true
  end

  def password_validity
    self.errors.add(:password, :blank) if self.password.blank?
    validates_length_of :password, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED
    validates_confirmation_of :password, allow_blank: false
  end

end





