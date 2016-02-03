class Task < ActiveRecord::Base
  FutureDateValidator
  ActiveModel::Validations::HelperMethods

  belongs_to :user
  validates :title, presence: true
  validates :priority, numericality: { only_integer: true }
  validates_future_date :due_date

end
