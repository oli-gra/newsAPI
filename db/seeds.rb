# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'spam@gmail.com')

#    url = 'https://newsapi.org/v2/top-headlines?'\
#       'country=us&'\
#       'apiKey=976ace69bfbe48e69375bd3929688817'
#     req = open(url)
#     resp = JSON.parse(req.read)
#     resp['articles'].each do|r|
#       New.find_or_create_by(title: r['title']) do |news|
#         news.source = r['url']
#         news.image = r['urlToImage']
#         news.published = r['publishedAt']
#       end
#     end

# React.create(new_id:1,user_id:1,like:false,report:false,
#    alt_headline: 'Tunes has a branding problem')
# Follow.create(user_id:1,follow_id:1)
# Comment.create(user_id:1, new_id:1, content:'Greatest news ever!')
