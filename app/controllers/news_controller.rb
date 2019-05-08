class NewsController < ApplicationController

  def index
    news = New.all
    render json: news
  end

  def show
    news = New.find_by(id:params[:id])
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

  def search
    news = New.all
    found = []
    news.each do |a_news|
      found << a_news if a_news.title.downcase.include?(params[:search])
    end
    if found.empty?
    else render json: found
    end
  end

end
