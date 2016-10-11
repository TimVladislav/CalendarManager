# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{ email: 'example@example.ex', password: '123456', name: 'Vladislav'}, { email: 'ex@ex.ex', password: '111111', name: 'Vlad'}])
Task.create([{title: 'Написать диплом', description: 'Диплом... Что еще сказать?', dt: '12.06.2017', owner: 'example@example.ex'}, {title: 'SomeTitle', description: 'SomeDescription', dt: '1.1.2017', owner: 'ex@ex.ex'}])
Position.create([{task_id: 1, user_id: 1, isnew: 0},{task_id: 1, user_id: 2, isnew: 1},{task_id: 2, user_id: 1, isnew: 1},{task_id: 2, user_id: 2, isnew: 0}])
