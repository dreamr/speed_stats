require_relative "../../ext/class_initializer"

class Crawler
  class Link
    include ClassInitializer
    
    attr_reader :opts, :uri
  end
end
