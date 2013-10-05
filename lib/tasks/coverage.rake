# Lovingly adapted from https://gist.github.com/1693201

THRESHOLD = 100.0

namespace :spec do
  desc "Run specs and ensure coverage threshold is met"
  task :coverage do
    ENV['COV'] = '1'
    Rake::Task['spec'].invoke
    ensure_test_coverage
  end
end

def ensure_test_coverage
  require 'nokogiri'

  doc     = Nokogiri::HTML File.read("coverage/index.html")
  node    = doc.css("h2:first .covered_percent").first
  covered = node.content.to_f

  if covered < THRESHOLD
    puts "Coverage (#{covered}%) is less than threshold (#{THRESHOLD}%)"
    exit 1
  end
end
