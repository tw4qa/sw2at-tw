module Swat
  module TestWorld
    require 'swat/test_world/base'
    require 'swat/test_world/config'

    mattr_reader :config

    def self.setup(rspec_config, opts)
      @config = Config.new(opts)
    end

  end
end
