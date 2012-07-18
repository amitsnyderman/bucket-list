# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Bucket.create({:code => 'todo', :description => 'Create a todo'})
Bucket.create({:code => 'schedule', :description => 'Schedule an appointment'})
Bucket.create({:code => 'reminder', :description => 'Set a reminder'})
Bucket.create({:code => 'note', :description => 'Create a note'})