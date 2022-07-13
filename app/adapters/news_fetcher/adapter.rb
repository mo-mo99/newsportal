# frozen_string_literal: true

module NewsFetcher
  class Adapter
    def latest_news
      send_request
    end

    private

    def send_request
      NewsFetcher::Client.new.send_request
    end
  end
end
