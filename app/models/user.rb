class User < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :validate_password?
  before_save { self.email = email.downcase }
  validates :phone_number, length: { minimum: 7, maximum: 11 }
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def disable_password_validation
    @dont_validate_password = true
  end

  def enable_password_validation
    @dont_validate_password = false
  end

  def send_password_reset
    self[:password_reset_token] = User.new_remember_token
    self.password_reset_sent_at = Time.zone.now
    disable_password_validation
    self.save!
    UserMailer.password_reset(self).deliver
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    def validate_password?
      !@dont_validate_password
    end

end
