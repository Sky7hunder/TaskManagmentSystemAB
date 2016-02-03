# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin Task.delete_all

Task.create([{title: 'Task 1', description: 'Lorem ihfudsn jsndj jnsdjkfb jksdkj njsndjf bsdjf', priority: '2', due_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"), user_id: User.last.id},
             {title: 'Task 2', description: 'Lorem ihfudsn jsndj jnsdjkfb jksdkj njsndjf bsdjf', priority: '1', due_date: DateTime.strptime("09/01/2009 16:00", "%m/%d/%Y %H:%M"), completed: true, user_id: User.last.id},
            {title: 'Task 3', description: 'Lorem ihfudsn jsndj jnsdjkfb jksdkj njsndjf bsdjf', priority: '1', due_date: DateTime.strptime("09/01/2009 14:00", "%m/%d/%Y %H:%M"), completed: true, user_id: User.last.id},
             {title: 'Task 4', description: 'Lorem ihfudsn jsndj jnsdjkfb jksdkj njsndjf bsdjf', priority: '3', due_date: DateTime.strptime("09/01/2009 15:00", "%m/%d/%Y %H:%M"), user_id: User.last.id},
            ])
=end