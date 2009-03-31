#
# Yes, this script is a quick utility hack.
#
require 'rubygems'
require 'json'
require 'open-uri'

works = {}
may_work = {}
fails = {}
untested = []
missing = []

isit19_url = "http://isitruby19.com"
isit19_file = "comments.json"

installed_gems = %x[gem list].split("\n")

puts "Found #{installed_gems.size} installed gem(s)."

installed_gems.each do |g|
  $stdout.print "."
  $stdout.flush

  gem_name = g.split(" ")[0]
  url = isit19_url + "/" + gem_name + "/" + isit19_file

  begin
    json_data = open(url).read
  rescue
    missing << gem_name
    next
  end

  gem_comments = JSON.parse(json_data)

  if gem_comments.size == 0
    untested << gem_name
  else
    sum = 0
    recent = gem_comments[0..4]

    recent.each do |r|
      if r["comment"]["works_for_me"]
        sum += 1
      end
    end

    rate = sum / recent.size.to_f
    ratio = "#{sum} / #{recent.size}"

    if rate > 0.80
      works[gem_name] = ratio
    elsif rate >= 0.40
      may_work[gem_name] = ratio
    else
      fails[gem_name] = ratio
    end
  end
end

puts "\nFinished!\n\n"

puts "WORKS (#{works.size})\n-----"
puts works.keys.join(" ")

puts "\nMAY WORK (#{may_work.size})\n--------"
puts may_work.keys.join(" ")

puts "\nFAILS (#{fails.size})\n-----"
puts fails.keys.join(" ")

puts "\nUNTESTED (#{untested.size})\n--------"
puts untested.join(" ")

puts "\nMISSING (#{missing.size})\n-------"
puts missing.join(" ")
