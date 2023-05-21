class User < ApplicationRecord

  has_many :albums, foreign_key: :validatiertdurch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  has_person_name

  extend FriendlyId
  friendly_id :name, use: :slugged
end
