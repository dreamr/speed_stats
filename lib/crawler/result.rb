require_relative "../../ext/class_initializer"

class Crawler
  class Result
    include ClassInitializer

    attr_reader :uri, :response_time, :errors

    def initialize(attributes)
      super(attributes, [:errors])
    end

    def self.collect(uri, opts={})
      
    end
  end
end

