class User < ApplicationRecord
  has_secure_password
  validates :name, :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :password, confirmation: true
  

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