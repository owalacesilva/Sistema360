# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

# Root member
root_attr = FactoryBot.attributes_for(:user, :root, :actived, :verified)
root = User.new(root_attr)
root.save!

# Childrens from root
(1..50).each do 
  user_attr = FactoryBot.attributes_for(:user, :actived, :verified, sponsor: root)
  user = User.new(user_attr)
  user.save!
end
