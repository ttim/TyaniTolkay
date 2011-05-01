# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all

User.create(
    :name => "admin",
    :email => "victor.passichenko@gmail.com",
    :password => "1q2w4r",
    :password_confirmation => "1q2w4r",
    :role => "admin"
)