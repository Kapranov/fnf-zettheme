class User < ActiveRecord::Base
  has_many :dashboards
  has_many :products

  attachment :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
