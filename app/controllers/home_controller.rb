# frozen_string_literal: true

class HomeController < ApplicationController
  
  before_action :authenticate_user!, only: %i(setting profile)
  
  def index
    @results = Fetchallnews::Adapter.new.latest_news

    # @ms_results = Adapter.call(api: Mediastack)
    # @ca_results = Adapter.call(api: Currentsapi)

    # @news = @ms_results[0]
    # @title = @news['title']
    # @author = @news['author']
    # @description = @news['description']
    # @url = @news['url']
    # @image = @news['image']
    # @category = @news['category']
    # @published_at = @news['published_at']

    # @news = @ca_results[0]
    # @title = @news['title']
    # @author = @news['author']
    # @description = @news['description']
    # @url = @news['url']
    # @image = @news['image']
    # @category = @news['category'][0]
    # @published_at = @news['published']
  end

  def profile
  end

  def setting
  end

end
