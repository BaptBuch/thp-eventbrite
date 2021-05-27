class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: 'admin_id', class_name: 'Event', dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  
  has_one_attached :avatar

end
