class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  after_create :set_access_token


  private

  def set_access_token
    self.update_column(:access_token, generate_access_token)
  end

  def generate_access_token
    SecureRandom.uuid.gsub(/\-/, '')
  end
end
