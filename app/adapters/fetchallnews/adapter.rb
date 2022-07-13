module Fetchallnews
  class Adapter
    def latest_news
      send_request
    end

    private

    def send_request
      Fetchallnews::Client.new.send_request
    end
  end
end
