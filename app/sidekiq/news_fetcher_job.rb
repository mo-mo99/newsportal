class NewsFetcherJob
  include Sidekiq::Job

  def perform(*args)
    ::SaveNews.call
  end
end
