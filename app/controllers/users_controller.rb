class UsersController < ApplicationController
  before_action :breaking, only: [:show]
  before_action :trending, only: [:show]

  def show
    news = []
    user = User.find_by(id:params[:id])
    user.follows.each do |follow|
      muse = User.find_by(id:follow.follow_id)
      news << React.find_by(id:muse.id).new if React.count > 0
    end if user.follows.count > 0
    user.reacts.each do |react|
      news << react.new
    end if user.reacts.count > 0
    render json: news.uniq
  end

  def new
  end

  def create
  end

  private

  def breaking
    url = 'https://newsapi.org/v2/top-headlines?'\
      'country=us&'\
      'apiKey=976ace69bfbe48e69375bd3929688817'
    req = open(url)
    resp = JSON.parse(req.read)
    resp['articles'].each do|r|
      New.find_or_create_by(title: r['title']) do |news|
        news.source = r['url']
        news.image = r['urlToImage']
        news.published = r['publishedAt']
      end
    end
  end

  def trending
    trends = Hash.new(0)
    React.all.each do |r|
      r.like ? trends[r.new.id]+=1 : false
    end if React.count > 0
    puts trends.max_by{|k,v|v}
  end

end
