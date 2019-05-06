# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'spam@gmail.com')
New.create(source: 'https://techcrunch.com/2019/05/05/thunes-raises-10m/',
   title: 'Thunes raises $10M to make financial services more accessible in emerging markets',
   image: 'https://techcrunch.com/wp-content/uploads/2019/05/thunes.jpg?w=750',
   published: '2019-05-06T01:36:03Z')
React.create(new_id:1,user_id:1,like:false,report:false,
   alt_headline: 'Tunes has a branding problem')
Follow.create(user_id:1,follow_id:1)