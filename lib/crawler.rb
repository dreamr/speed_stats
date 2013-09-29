require_relative 'crawler/link'
require_relative 'crawler/result'

class Crawler
  
  def self.curl_all(links)
    links.map {|link| curl link.opts, link.uri }
  end

  def self.curl(uri, opts=[])
    Crawler::Result.new( uri: "http://localhost:3000",
      response_time: 1000.00,
      errors: []
    )
  end
end
