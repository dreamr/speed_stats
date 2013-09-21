require_relative 'crawler/link'
require_relative 'crawler/result'

class Crawler
  
  def self.curl_all(links)
    links.map {|link| curl link.opts, link.uri }.
          reject {|link| link.result.nil?}
  end

  def self.curl(opts, uri)
    
  end
end
