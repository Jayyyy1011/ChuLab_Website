# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(:email => "admin@gmail.com", :password => "123456", :is_admin => true, :name => "LKC")
u2 = User.create(:email => "123456@gmail.com", :password => "123456", :name => "喜洋洋")
u3 = User.create(:email => "654321@gmail.com", :password => "123456", :name => "珮珮豬")
u4 = User.create(:email => "111111@gmail.com", :password => "123456", :name => "樹懶叫")
u5 = User.create(:email => "666666@gmail.com", :password => "123456", :name => "灰太狼")

c1 = Category.create(:name => "mirror")
c2 = Category.create(:name => "window")
c3 = Category.create(:name => "filter")
c4 = Category.create(:name => "lens")
c5 = Category.create(:name => "prism")
c6 = Category.create(:name => "beamsplitter")

15.times do |m|
  Meeting.create!(:date => Time.now,
                :speaker => [u1.name,u2.name,u3.name,u4.name,u5.name].sample,
                :speaker2 => [u1.name,u2.name,u3.name,u4.name,u5.name].sample,
                :remark => Faker::Lorem.paragraph
  )
end
