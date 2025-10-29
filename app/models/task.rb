class Task < ApplicationRecord
  belongs_to :category

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :due_date_validity

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, I18n.t("task.errors.invalid_due_date")
  end
end
