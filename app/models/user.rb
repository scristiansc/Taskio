class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks_as_owner, class_name: "Task", foreign_key: "owner_id"
  has_many :participations, class_name: "Participant"
  has_many :tasks, through: :participations
end
