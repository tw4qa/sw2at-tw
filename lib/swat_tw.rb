module Swat
  module TestWorld
    require 'swat/test_world/base'
    require 'swat/test_world/config'
    require 'swat/test_world/rspec_setup'

    def self.setup(rspec_config, opts)
      @config = Config.new(opts)
      rspec_config.extend RspecSetup
    end

    def self.config
      @config
    end

  end
end
