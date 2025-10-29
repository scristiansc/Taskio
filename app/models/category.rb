class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
