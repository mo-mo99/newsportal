# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i(setting profile)

  def index
    @results = ::NewsFetcher::Adapter.new.latest_news
  end

  def profile
  end

  def setting
  end
end
