class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}, presence: true
  validates :password, length: {minimum: 4}, confirmation: true

  # validates :name, :password_confirmation, presence: true
  # validates :email, presence: true, uniqueness: { case_sensitive: false}

  def self.authenticate_with_credentials(email,password)
    user_email = email.downcase.strip
    @user = User.find_by(email: user_email)
    if @user && @user.authenticate(password)
      @user
    elsif 
      @user.errors.add(:password, "password not matching")
      nil
    end
  end



end