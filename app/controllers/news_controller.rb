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
  end
end
