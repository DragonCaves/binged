class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]


  def self.from_omniauth(auth)
    puts auth
    where(email: auth.info.email, provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      # user.username = auth.extra.raw_info.username 
    end
  end
end
