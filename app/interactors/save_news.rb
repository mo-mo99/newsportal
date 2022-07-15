# frozen_string_literal: true

class SaveNews
  include Interactor

  def call
    fetch_news.map do |news|
      News.create(news)
    end
  end

  def fetch_news
    ::NewsFetcher::Adapter.new.latest_news["data"]
  end
end
