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
installed_gems.each do |g|
  gem_name = g.split(" ")[0]
  url = isit19_url + "/" + gem_name + "/" + isit19_file

  begin
    doc = open(url).read
  rescue
    missing << gem_name
    next
  end

  json = JSON.parse(doc)

  if json.size == 0
    untested << gem_name
  else
    sum = 0
    recent = json[0..4]

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

puts "WORKS\n-----"
puts works.keys.join(" ")

puts "\nMAY WORK\n--------"
puts may_work.keys.join(" ")

puts "\nFAILS\n-----"
puts fails.keys.join(" ")

puts "\nUNTESTED\n--------"
puts untested.join(" ")

puts "\nMISSING\n-------"
puts missing.join(" ")
