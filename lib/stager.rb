require 'open3'

class Stager
  attr_reader :commits
  attr_accessor :stage_dir

  def initialize(commits)
    @commits = commits
    @stage_dir = ""
    self
  end

  def collect_speed_stats
    stage_commits
    dig_stats_from_stage
    "completed!"
  end

  def stage_commits
    commits.each do |commit|
      popen(stage_cmd(commit))
    end
  end

  def stage_cmd(commit)
    <<-EOS
mkdir -p #{stage_dir}/#{commit}; 
cd $_; 
git checkout #{commit}
EOS
  end

  def popen(cmd)
    Open3.capture3(cmd)
  end

  def dig_stats_from_stage
  end
end
