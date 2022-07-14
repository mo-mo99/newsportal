# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i(setting profile)
  before_action :authorize_user, only: %i(fetch_news)

  def index
    @all_news = News.all.paginate(page: params[:page], per_page: 12).order("published_at")
  end

  def profile
  end

  def setting
  end

  def fetch_news
    ::SaveNews.call
    redirect_to "/", notice: "News added"
  end
end
