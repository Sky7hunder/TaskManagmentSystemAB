FactoryGirl.define do
  factory :task do
    user
    title 'Task 1'
    priority 2
    due_date  Date.today
    description ' '
  end
end