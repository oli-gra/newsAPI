class UsersController < ApplicationController
  before_action :breaking

  def show
    news = []
    user = User.find_by(id:params[:id])
    user.follows.each do |follow|
      muse = User.find_by(id:follow.follow_id)
      news << React.find_by(id:muse.id).new
    end
    render json: news
  end

  def new
  end

  def create
  end

  private

  def breaking
    url = 'https://newsapi.org/v2/top-headlines?'\
      'country=uk&'\
      'apiKey=976ace69bfbe48e69375bd3929688817'
    req = open(url)
    resp = JSON.parse(req.read)
      resp['articles'].each do|r|
      New.create(source: r['url'], title: r['title'], image: r['urlToImage'], published: r['publishedAt'])
    end
  end

end
