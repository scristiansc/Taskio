class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: "User"
  has_many :participating_users, class_name: "Participant"
  has_many :participants, through: :participating_users, source: :user

  validates :participating_user, presence: true

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :due_date_validity

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, I18n.t("task.errors.invalid_due_date")
  end
end
