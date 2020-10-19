# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  project = Project.new(name: %w[UNO dois Three].sample)
  project.save!

  Task.new(date: '1990-12-01',
           description: 'blablabla',
           status: 'canceled',
           project: project).save!

  Task.new(date: '2020-08-26',
           description: 'blablablablablablablablablablablablablablabla',
           status: 'done',
           project: project).save!

  Task.new(date: '2000-06-10',
           description: 'lots of things to do',
           status: 'ongoing',
           project: project).save!
end
