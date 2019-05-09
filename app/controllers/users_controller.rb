class UsersController < ApplicationController

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

end
