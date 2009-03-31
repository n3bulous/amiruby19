module Amiruby19
  module Version

    MAJOR = 1
    MINOR = 1
    TINY  = 0

    def self.to_s # :nodoc:
      [MAJOR, MINOR, TINY].join('.')
    end

  end
end
