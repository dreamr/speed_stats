require 'open3'

class Stager
  attr_reader :commit, :git_dir

  def initialize(git_dir)
    @git_dir = git_dir
    self
  end

  def stage(commit)
    popen("cd #{git_dir}; git checkout #{commit}")
  end

  def unstage
    popen("cd #{git_dir}; git checkout master")
  end

private

  def popen(cmd)
    Open3.capture3(cmd)
  end
end
