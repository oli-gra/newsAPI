class NewsController < ApplicationController
  before_action :breaking, only: [:index]

  def index
    # breaking
    news = New.all
    render json: news
  end

  def new
  end

  def create
    news = New.new(
      source: params[:source],
      title: params[:title],
      image: params[:image],
      published: params[:published]
    )
    if news.save
      render json: news
    else
      render json: {error: 'Unable to create news.'}, status: 400
    end
  end

  def update
    user = User.find_by(id: params[:user_id])
    if react = user.reacts.find_by(new_id: params[:news_id]) != nil
      react.like = params[:like]
      react.report = params[:report]
      params[:alt_headline] == '' ? true : react.alt_headline = params[:alt_headline]
      react.save
      render json: react
    else
      react = React.create(
        user_id: params[:user_id],
        new_id: params[:news_id],
        like: params[:like],
        report: params[:report],
        alt_headline: params[:alt_headline])
        render json: react, status: 404
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
    if found.count > 0
      render json: found.uniq
    else
      render json: {error: 'No headline matching your search.'}, status: 404
    end
  end

  def meta
    meta_news = {
      trending: trending(),
      controvosy: controvosy()
    }
    render json: meta_news
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
    React.all.each{|r|r.like ? controvosy_h[r.new.id] += 1 : controvosy_h[r.new.id] += 2}
    controvosy_h.count < 3 ? most_contro = controvosy_h : most_contro = controvosy_h.sort_by{|_k,v|v}[-3..-1].to_h
    most_contro.each{|controvosy| controvosy_a << New.find_by(id: controvosy[0])}
    controvosy_a
  end

  def trending
    trend_h = Hash.new(0)
    trend_a = []
    React.all.each{|r|r.like ? trend_h[r.new.id] += 1 : false}
    trend_h.count < 3 ? top_trends = trend_h : top_trends = trend_h.sort_by{|_k,v|v}[-3..-1].to_h
    top_trends.each{|trend|trend_a << New.find_by(id: trend[0])}
    trend_a
  end

end