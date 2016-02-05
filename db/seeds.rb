=begin(1..30).each do
  Task.create([{title: 'Task 1', description: 'Lorem ihfudsn jsndj jnsdjkfb jksdkj njsndjf bsdjf', priority: '2', due_date: DateTime.strptime("09/01/2017", "%d/%m/%Y"), user_id: User.last.id}])
end
(1..30).each do
  Task.create([{title: 'Task 1', description: 'Lorem ihfudsn jsndj jnsdjkfb jksdkj njsndjf bsdjf', priority: '2', due_date: DateTime.strptime("09/01/2017", "%d/%m/%Y"), user_id: User.last.id}])
end
=end