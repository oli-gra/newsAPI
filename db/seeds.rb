# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

User.create(email: 'spam@gmail.com')
React.create(new_id:1,user_id:1,like:false,report:false,
   alt_headline: 'Tunes has a branding problem')
Follow.create(user_id:1,follow_id:1)

url = 'https://newsapi.org/v2/top-headlines?'\
      'country=us&'\
      'apiKey=976ace69bfbe48e69375bd3929688817'
req = open(url)
resp = JSON.parse(req.read)
resp['articles'].each do|r|
   New.create(source: r['url'], title: r['title'], image: r['urlToImage'], published: r['publishedAt'])
end
