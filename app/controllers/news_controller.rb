class NewsController < ApplicationController
  before_action :breaking, only: [:index]
  before_action :trending, only: [:index]

  def index
    news = New.all
    render json: news
  end

  def new
  end

  def create
    New.create(
      source: params[:source],
      title: params[:title],
      image: params[:image],
      published: params[:published]
    )
  end

  def update
    user = User.find_by(id: params[:user_id])
    if react = user.reacts.find_by(new_id: params[:news_id]) != nil
      react.like = params[:like]
      react.report = params[:report]
      params[:alt_headline] == '' ? true : react.alt_headline = params[:alt_headline]
      react.save
    else
      React.create(
        user_id: params[:user_id],
        new_id: params[:news_id],
        like: params[:like],
        report: params[:report],
        alt_headline: params[:alt_headline])
    end
  end

  def search
    found = []
    New.all.each do |news|
      found << news if news.title.downcase.include?(params[:search].downcase)
    end if New.count > 0
    React.all.each do |react|
      found << react.new if react.new.title.downcase.include?(params[:search].downcase)
    end if React.count > 0
    render json: found.uniq if found.count > 0
  end

  private

  def breaking
    url = 'https://newsapi.org/v2/top-headlines?'\
      'country=gb&'\
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

  def controvosy
    controvosy_h = Hash.new(0)
    controvosy_a = []
    React.all.each do |r|
      r.like ? controvosy_h[r.new.id] += 1 : controvosy_h[r.new.id] += 2
    end if React.count > 0
    begin
      most_controversial = controvosy_h.sort_by{|_k,v|v}.slice(controvosy_h.length - 3).to_h
      most_controversial.each do |controvosy|
        controvosy_a << New.find_by(id: controvosy.key)
      end
      controvosy_a
    rescue
    end
  end

  def trending
    trend_h = Hash.new(0)
    trend_a = []
    React.all.each do |r|
      r.like ? trend_h[r.new.id] += 1 : false
    end if React.count > 0
    begin
      top_trends = trend_h.sort_by{|_k,v|v}.slice(trend_h.length - 3).to_h # to grab the last 5 (or highest 5)
      top_trends.each do |top_trend|
        trend_a << New.find_by(id: top_trend.key)
      end
      trend_a
    rescue
    end
  end

end
