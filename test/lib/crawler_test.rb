require 'minitest_helper'

require_relative "../../lib/crawler"

describe Crawler do
  subject { Crawler }
  
  let(:links) {
    [
      Crawler::Link.new(opts: '', uri: 'http://localhost:3000/')
    ]
  }

  describe ".curl_all(links)" do
    it "must return an array of .curl returns" do
      subject.curl_all(links).must_equal(
        []
      )
    end
  end

  describe ".curl(opts, uri)" do
    it "must return a Struct with results" do
      subject.curl(links[0]).must_equal(
        Crawler::Result.new( uri: "http://localhost:3000",
          response_time: 1000.00,
          errors: []
        )
      )
    end
  end
end

