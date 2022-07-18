# frozen_string_literal: true

require "sidekiq-scheduler"

class NewsFetcherJob
  include Sidekiq::Job

  def perform(*_args)
    ::SaveNews.call
  end
end
