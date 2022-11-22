class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :minimum => 4 }

  def self.authenticate_with_credentials(email, password)
    auth_email = email.strip.downcase
    user = User.where('lower(email) = ?', auth_email).first
    if user && user.authenticate(password)
      return user
    end
  end
end
