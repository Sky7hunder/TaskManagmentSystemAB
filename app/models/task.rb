class Task < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :priority, numericality: { only_integer: true }
  validate  :due_date_cannot_be_in_the_past

  before_save :format_date

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if !due_date.blank? and due_date < (Time.now - (60*60*24))
  end

  private

  def format_date
    self.due_date = self.due_date.to_time.strftime("%d/%m/%Y")
  end
end
