class Client
include HTTParty

  RequestResult = Struct.new(:succes?, :errors, :data)
 
  def initialize
  end

  def send_request
    RequestResult.new(success?, errors, data)
  end

  def success?
  end

  def errors
  end

  def data
    [processed_mediastack_response, processed_currentsapi_response].flatten
  end

  def mediastack_response
    mediastack_url = 'http://api.mediastack.com/v1/news?'
    mediastack_key = '541f6997e9849196b9fa7436a532eeef'
    HTTParty.get(mediastack_url+"languages=en&access_key=#{mediastack_key}").parsed_response['data']
  end

  def currentsapi_response
    currentsapi_url = 'https://api.currentsapi.services/v1/latest-news?'
    currentsapi_key = "KECBO2IuwJBvgibV36K_LcOXUv-A660CJPFdNUmHAScDe6lP"
    HTTParty.get(currentsapi_url+"language=en&apiKey=#{currentsapi_key}").parsed_response['news']
  end

  def processed_mediastack_response
    res = []
    mediastack_response.each do |news|
      res.append({
        title: news['title'],
        author: news['author'],
        description: news['description'],
        url: news['url'],
        image: news['image'],
        category: news['category'],
        published_at: news['published_at']
      })
    end
    res  
  end

  def processed_currentsapi_response
    res = []
    currentsapi_response.each do |news|
      res.append({
        title: news['title'],
        author: news['author'],
        description: news['description'],
        url: news['url'],
        image: news['image'],
        category: news['category'][0],
        published_at: news['published']
      })
    end
    res
  end

end