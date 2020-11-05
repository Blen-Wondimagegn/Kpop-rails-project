class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :glams
  has_many :artists, through: :glams
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

   def self.from_omniauth(auth)
    binding.pry 
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user |
        user.provider = auth.provider
        user.name = auth.info.name
        user.username = auth.info.nickname
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
    end
  end      
end
