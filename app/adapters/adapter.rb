class Adapter
    
  def self.latest_news
    Client.new().send_request
  end

end