require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'lib/amiruby19/version'

task :default => :test

spec = Gem::Specification.new do |s|
  s.name             = 'amiruby19'
  s.version          = Amiruby19::Version.to_s
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.textile)
  s.rdoc_options     = %w(--main README.textile)
  s.summary          = "Verifies whether your Ruby 1.8 gems are compatible with Ruby 1.9 based on entries from http://isitruby19.com"
  s.author           = 'Kevin McFadden'
  s.email            = 'kevin+github@conceptsahead.com'
  s.homepage         = 'http://conceptsahead.com'
  s.files            = %w(README.textile Rakefile) + Dir.glob("{lib,test}/**/*")
  s.executables    = ['amiruby19']

  # s.add_dependency('gem_name', '~> 0.0.1')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc 'Generate the gemspec to serve this Gem from Github'
task :github do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end
