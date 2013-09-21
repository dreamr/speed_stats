require 'minitest/autorun'
require 'mocha'
require_relative "../../lib/stager"

describe Stager do
  subject { Stager.new(app_path) }
  let(:app_path)   { 
    File.expand_path("../../test_web_app", __FILE__) 
  }
  let(:commit_hash) { 
    "d91aac29b2b512c065fa96d28df05d960dbd9135"
  }

  describe "#stage" do
    subject { Stager.new(app_path) }

    before do
      @files = Dir[app_path+"/**/*"]
    end

    it "must stage the commit" do
      subject.stage(commit_hash)
      assert File.read(@files[0]).scan(/Hello, world!/).any?
    end
  end

  describe "#unstage" do
    subject { Stager.new(app_path) }

    before do
      subject.stage(commit_hash)
      @files = Dir[app_path+"/**/*"]
    end

    it "must unstage the commit" do
      subject.unstage
      assert File.read(@files[0]).scan(/Hello, speed stats!/).any?
    end
  end
end
