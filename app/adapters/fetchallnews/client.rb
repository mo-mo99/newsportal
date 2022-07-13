module Fetchallnews
  class Client
    include HTTParty

    RequestResult = Struct.new(:succes?, :errors, :data)

    def send_request
      RequestResult.new(success?, errors, data)
    end

    def success?
      mediastack_response.success? || currentsapi_response.success?
    end

    def errors
      [mediastack_response['error'], currentsapi_response['msg']].flatten
    end

    def data
      [processed_mediastack_response, processed_currentsapi_response].flatten
    end

    def mediastack_response
      mediastack_url = 'http://api.mediastack.com/v1/news?'
      mediastack_key = '541f6997e9849196b9fa7436a532eeef'
      HTTParty.get(mediastack_url+"languages=en&access_key=#{mediastack_key}")
    end

    def currentsapi_response
      currentsapi_url = 'https://api.currentsapi.services/v1/latest-ne?'
      currentsapi_key = "KECBO2IuwJBvgibV36K_LcOXUv-A660CJPFdNUmHAScDe6lP"
      HTTParty.get(currentsapi_url+"language=en&apiKey=#{currentsapi_key}")
    end

    def processed_mediastack_response
      if mediastack_response.success?
      return mediastack_response.parsed_response['data'].map do |news|
        {
          title: news['title'],
          author: news['author'],
          description: news['description'],
          url: news['url'],
          image: news['image'],
          category: news['category'],
          published_at: news['published_at']
        }
      end
      end
    end

    def processed_currentsapi_response
      if currentsapi_response.success?
      return currentsapi_response.parsed_response['news'].map do |news|
         {
          title: news['title'],
          author: news['author'],
          description: news['description'],
          url: news['url'],
          image: news['image'],
          category: news['category'][0],
          published_at: news['published']
        }
      end
      end
    end
  end
end