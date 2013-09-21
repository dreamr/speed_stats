#!/usr/bin/env ruby
# encoding: utf-8

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'stats_digger'

def main
  raise StatsDigger.new(ARGV).collect_speed_stats.inspect
end



main
