require 'minitest/autorun'
require 'mocha'
require_relative "../../lib/stager"

describe Stager do
  subject { Stager.new(commit_hashes) }

  let(:stage_path)   { 
    File.expand_path("../../stage", __FILE__) 
  }
  let(:commit_hashes) { 
    %w(
      d91aac29b2b512c065fa96d28df05d960dbd9135
      1f9983f92e9d0a6cd3c377c9ba45c7e9d0efdea2
    )
  }

  describe "#stage_commits" do
    subject { Stager.new(commit_hashes) }

    before do
      subject.stubs(:stage_dir).returns(stage_path)
      @files = Dir[stage_path+"/**/*"].map do |f| 
        f.match(/#{commit_hashes[0]}.*/).to_s
      end
    end

    it "must copy the 2 commits to the stage dir" do
      subject.stage_commits
      @files.must_include "d91aac29b2b512c065fa96d28df05d960dbd9135"
      @files.must_include "d91aac29b2b512c065fa96d28df05d960dbd9135/app.rb"
      @files.must_include "1f9983f92e9d0a6cd3c377c9ba45c7e9d0efdea2"
      @files.must_include "1f9983f92e9d0a6cd3c377c9ba45c7e9d0efdea2/app.rb"
    end
  end
end
