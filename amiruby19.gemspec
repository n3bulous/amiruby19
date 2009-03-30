# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{amiruby19}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kevin McFadden"]
  s.date = %q{2009-03-30}
  s.default_executable = %q{amiruby19}
  s.email = %q{kevin+github@conceptsahead.com}
  s.executables = ["amiruby19"]
  s.extra_rdoc_files = ["README.textile"]
  s.files = ["README.textile", "Rakefile", "lib/amiruby19", "lib/amiruby19/amiruby19.rb", "lib/amiruby19/version.rb", "lib/amiruby19.rb", "test/test_helper.rb", "test/unit", "test/unit/amiruby19_test.rb", "bin/amiruby19"]
  s.has_rdoc = true
  s.homepage = %q{http://conceptsahead.com}
  s.rdoc_options = ["--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Verifies whether your Ruby 1.8 gems are compatible with Ruby 1.9 based on entries from http://isitruby19.com}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
